package nina_riscv.ex

import nina_riscv.fd.{fd2x_bus, fd_jump}
import nina_riscv.regfiles.regfiles_rd_rsp
import nina_riscv.decode.Utils._
import nina_riscv.fd._
import spinal.core.{Mux, _}
import spinal.lib._

case class ex2mem() extends Bundle{
  val reg_dest   = Bits(5 bits)
  val mem_addr   = Bits(32 bits)
  val mem_data   = Bits(32 bits)
  val size       = Bits(2 bits)
  val usigned_op = Bool()
  val wr_en      = Bool()
}

case class ex2regfile() extends Bundle{
  val reg_dest = Bits(5 bits)
  val reg_data = Bits(32 bits)
}
case class wb_forward() extends  Bundle{
  val fw1_en   = Bool()
  val fw1_data = Bits(32 bits)
  val fw2_en   = Bool()
  val fw2_data = Bits(32 bits)
}
case class ex_forward() extends Bundle{
  val fw1_en   = Bool()
  val fw2_en   = Bool()
}

case class ex_stage(val reset_vector : BigInt = 0) extends Component{
  val io = new Bundle{
    val stall     = in Bool()
    val jump      = master(Stream(fd_jump()))
    val wb_fw     = in (wb_forward())
    val ex_fw     = in (ex_forward())

    val mem       = master(Stream(ex2mem()))
    val ex2rf     = master(Flow(ex2regfile()))

    val fd2x      = slave(Stream(fd2x_bus()))
    val rd_rsp    = in (regfiles_rd_rsp())
  }
  //rs1 rs2 data in
  val fw_ctrl1    = io.wb_fw.fw1_en ## io.ex_fw.fw1_en
  val fw_ctrl2    = io.wb_fw.fw2_en ## io.ex_fw.fw2_en
  val rs1_data    = fw_ctrl1.mux(
    B"2'b10" -> io.wb_fw.fw1_data,
      B"2'b01" -> RegNext(io.ex2rf.reg_data),
      B"2'b11" -> io.wb_fw.fw1_data,
      default -> io.rd_rsp.rd_data1
  )
  val rs2_data    = fw_ctrl2.mux(
    B"2'b10" -> io.wb_fw.fw2_data,
    B"2'b01" -> RegNext(io.ex2rf.reg_data),
    default -> io.rd_rsp.rd_data2
  )

  //fd2x
  val module_en   = io.fd2x.module_en
  val imm         = io.fd2x.imm

  io.fd2x.ready := io.mem.ready & (!io.stall)

  /*******************  mirror pc  **********************/
  val PC = Reg(UInt(32 bit)) init(reset_vector)

  when(io.jump.fire){
    PC := io.jump.new_pc
  }elsewhen(io.fd2x.fire){
    PC := PC + U(4)
  }

  /*******************  executer  **********************/
  //branch
  val brancher = branch()
  brancher.PC       := PC
  brancher.rs1      := rs1_data
  brancher.rs2      := rs2_data
  brancher.select   := module_en(get_BRANCH_index) ## module_en(get_JALR_index) ## module_en(get_JAL_index)
  brancher.imm      := imm

  io.jump.new_pc    := RegNextWhen(brancher.new_pc.asUInt,brancher.jump_pc && io.fd2x.fire)
  val jumper = RegInit(False)
  when(io.jump.fire){
    jumper := False
  }elsewhen (brancher.jump_pc && io.fd2x.fire){
    jumper := True
  }
  io.jump.valid     := jumper
  //pc_regfile_inst
  val pc_regfile = pc_regfile_inst()
  pc_regfile.PC     := PC
  pc_regfile.select := module_en(get_JAL_index) ## module_en(get_JALR_index) ## module_en(get_AUIPC_index) ## module_en(get_LUI_index)
  pc_regfile.imm    := imm
  //alu
  val alu = do_alu()
  alu.src_sel       := module_en(get_ALU_I_index)
  alu.imm           := imm
  alu.rs1           := rs1_data
  alu.rs2           := rs2_data
  //mem
  val mem = do_mem()
  mem.imm          := imm
  mem.rs1          := rs1_data
  mem.rs2          := rs2_data

  /** *****************w regfile********************* **/
  io.ex2rf.reg_data := Mux(io.fd2x.reg_dest_vld , pc_regfile.regfile_wdata, alu.result)
  io.ex2rf.reg_dest := Mux(io.fd2x.reg_dest_vld , io.fd2x.reg_dest, imm(19 downto 15))
  io.ex2rf.valid    := io.fd2x.fire & (module_en(get_ALU_I_index) |module_en(get_ALU_index) | io.fd2x.reg_dest_vld) /*&(!io.jump.valid)*/

  /*******************to mem**********************/
  io.mem.size            := mem.size
  io.mem.usigned_op      := mem.usigned_op
  io.mem.reg_dest        := mem.load_dest
  io.mem.wr_en           := module_en(get_STORE_index)
  io.mem.mem_addr        := mem.addr
  io.mem.mem_data        := rs2_data
  io.mem.valid           := io.fd2x.fire & (module_en(get_STORE_index) | module_en(get_LOAD_index))&(!io.jump.valid)
}

case class pc_regfile_inst() extends Area{

  val PC    = UInt(32 bits)
  //[0]:LUI [1]:AUIPC [2]:JAL [3] JALR
  val select = Bits(4 bits)
  val imm    = Bits(20 bits)
  val regfile_wdata = Bits(32 bits)

  regfile_wdata := select.mux(
    B"4'b0001" -> imm ## U"x000",
    /** here, process instructions that need writing PC to regfile **/
    B"4'b0010" -> (PC + (imm ## U"x000").asUInt).asBits.resize(32),
    B"4'b0100" -> (PC + 4).asBits.resize(32),
    B"4'b1000" -> (PC + 4).asBits.resize(32),
    default -> imm ## U"x000"
  )
}

case class branch() extends Area{
  val PC      = UInt(32 bits)
  val rs1     = Bits(32 bits)
  val rs2     = Bits(32 bits)
  val select  = Bits(3 bits)
  val imm     = Bits(20 bits)
  val new_pc  = Bits(32 bits)
  val jump_pc = Bool()

  new_pc := select.mux(
    //JAL : result will be usd as new PC,pc+4 will be write in regfile
    B"3'b001" -> ((B((10 downto 0) -> imm(19)) ## imm ## False).asSInt + PC.asSInt).asBits.resize(32),
    //JALR : result will be usd as new PC, pc+4 will be write in regfile
    B"3'b010" -> (((imm(11 downto 0).asSInt + rs1.asSInt).asBits(31 downto 1)) ## False),
    //BRANCH : result will be usd as new PC
    B"3'b100" -> ((imm(11 downto 0) ## False).asSInt + PC.asSInt)(31 downto 0).asBits,
    //    default   -> (((imm(11 downto 0) ## False).asSInt + PC.asSInt).asBits)
    default -> PC.asBits
  )

  val branch_op = imm(14 downto 12).mux(
    B"3'b000" -> (rs1 === rs2),
    B"3'b001" -> (rs1 =/= rs2),
    B"3'b100" -> (rs1.asSInt < rs2.asSInt), //signed
    B"3'b101" -> (rs1.asSInt >= rs2.asSInt), //signed
    B"3'b110" -> (rs1.asUInt < rs2.asUInt),
    B"3'b111" -> (rs1.asUInt >= rs2.asUInt),
    default -> False
  )

  jump_pc := (branch_op && select(2)) | select(1) | select(0)

}
case class do_alu() extends Area{
  // select rs2 or imm
  val src_sel = Bool()
  //[3]: extended operation
  val rs1     = Bits(32 bits)
  val rs2     = Bits(32 bits)
  val imm     = Bits(20 bits)
  val result  = Bits(32 bits)

  val imm_extend = B((19 downto 0) -> imm(11)) ## imm(11 downto 0)
  val alu_op = Mux(src_sel, (False ## imm(14 downto 12)),
                             (imm(13) ## imm(7 downto 5)))

  val op_data = Bits(32 bits)
  op_data := src_sel.mux(
    True -> imm_extend,
    False -> rs2
  )


  result := alu_op(2 downto 0).mux(
    B"3'b000" -> ((rs1.asUInt + Mux(alu_op(3),op_data ^ B((31 downto 0) -> alu_op(3)),op_data).asUInt) + alu_op(3).asUInt)(31 downto 0).asBits,
    //SLL SLLI
    B"3'b001" -> (rs1.asUInt << op_data(4 downto 0).asUInt)(31 downto 0).asBits,
    //SLT SLTI
    B"3'b010" -> (rs1.asSInt < op_data.asSInt).asBits.resize(32),
    //SLTU SLTIU
    B"3'b011" -> Mux(src_sel,rs1.asUInt < imm(11 downto 0).resize(32).asUInt, rs1.asUInt < op_data.asUInt).asBits.resize(32),
    B"3'b100" -> (rs1 ^ op_data),
//    B"3'b101" -> (Mux(alu_op(3),(rs1.asSInt >> op_data(4 downto 0).asUInt).asBits.resize(32),(rs1.asUInt |>> (op_data(4 downto 0)).asUInt).asBits.resize(32))),
    B"3'b101" -> (Cat(alu_op(3)&rs1.msb,rs1).asSInt >> op_data(4 downto 0).asUInt)(31 downto 0).asBits,
    B"3'b110" -> (rs1 | op_data),
    B"3'b111" -> (rs1 & op_data)
  )

}


case class do_mem() extends Area{
  val imm        = Bits(20 bits)
  val rs1        = Bits(32 bits)
  val rs2        = Bits(32 bits)

  val addr       = Bits(32 bits)
  val size       = Bits(2 bits)
  val usigned_op = Bool()
  val load_dest  = Bits(5 bits)
//  val wr         = Bool()

  val imm_extend = B((19 downto 0) -> imm(11)) ## imm(11 downto 0)

  addr       := (rs1.asSInt + imm_extend.asSInt).asBits.resize(32)
  usigned_op := imm(14)
  size       := imm(13 downto 12)
  load_dest  := imm(19 downto 15)
}