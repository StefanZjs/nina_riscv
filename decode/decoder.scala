package nina_riscv.decode

import nino_riscv.regfile.{regfile, regfile_rd_cmd, regfile_rd_rsp}
import Utils._
import nino_riscv.fetch.{f2d_bus, fetcher}
import spinal.core._
import spinal.lib._


case class d2e_bus() extends Bundle{
  val module_en = Bits(get_module_en_size bits)
  val operation = Bits(20 bits)
  val rs1_data  = Bits(32 bits)
  val rs2_data  = Bits(32 bits)
}
case class decode2regfile_bus() extends Bundle{
  val regfile_wdata = Bits(32 bits)
  val regfile_dest  = Bits(5 bits)
}

//"LUI AUIPC JAL JALR BRANCH " will be processed in decode stage
case class decoder() extends Component{
  val io = new Bundle{
    val f2d          = slave(Stream(f2d_bus()))
//    val rd_cmd       = out(regfile_rd_cmd())
    val rd_rsp       = in(regfile_rd_rsp())
    val jump_pc      = out Bool()
    val new_pc       = out Bits(32 bits)
    val d2e          = master(Stream(d2e_bus()))
    val d2regfile    = master(Stream(decode2regfile_bus()))
    val stall        = in Bool()
    val load_over    = in Bool()
    val load_stall   = out Bool()
    val wb_forward1  = in Bool()
    val wb_forward2  = in Bool()
    val wb_forward_data = in Bits(32 bits)
    val e2d_forward1 = in Bool()
    val e2d_forward2 = in Bool()
    val e2d_forward_data = in Bits(32 bits)
    val rs1_addr = out Bits(5 bits)
    val rs2_addr = out Bits(5 bits)
  }
  io.rs1_addr := io.f2d.instructions(rs1_addr).asBits
  io.rs2_addr := io.f2d.instructions(rs2_addr).asBits

  val instruction_decoder = instruction_decode(io.f2d.payload.instructions.asBits)

  val module_en           = instruction_decoder.module_en
  val operation           = instruction_decoder.operation

  val load_stall = RegInit(False)

  when(module_en(get_LOAD_index) & io.f2d.fire){
    load_stall := True
  }elsewhen(io.load_over){
    load_stall := False
  }otherwise{
    load_stall := load_stall
  }

  io.load_stall := load_stall
  /****************************reg file connection********************************/
//  io.rd_cmd.rd_addr1 := io.f2d.payload.instructions(rs1_addr)
//  io.rd_cmd.rd_addr2 := io.f2d.payload.instructions(rs2_addr)

  val Wregfile = Wregfile_in_decode()
  Wregfile.PC     := io.f2d.payload.pc.asBits
  Wregfile.select := module_en(get_JALR_index) ## module_en(get_JAL_index) ## module_en(get_AUIPC_index) ## module_en(get_LUI_index)
  Wregfile.imm    := operation
  io.d2regfile.payload.regfile_wdata := Wregfile.regfile_wdata
  io.d2regfile.payload.regfile_dest  := io.f2d.payload.instructions.asBits(reg_dest)
  io.d2regfile.valid                 := (module_en(get_JALR_index) | module_en(get_JAL_index) | module_en(get_AUIPC_index) | module_en(get_LUI_index))&(!load_stall)

  val rs1_data = Mux(io.wb_forward1,io.wb_forward_data,
                  Mux(io.e2d_forward1,io.e2d_forward_data,io.rd_rsp.rd_data1))
  val rs2_data = Mux(io.wb_forward2,io.wb_forward_data,
                Mux(io.e2d_forward2,io.e2d_forward_data,io.rd_rsp.rd_data2))
  /****************************some execute part in decode********************************/
  val brancher = branch_in_decode()
  brancher.PC     := io.f2d.payload.pc.asBits
  brancher.rs1    := rs1_data
  brancher.rs2    := rs2_data
  brancher.select := module_en(get_BRANCH_index) ## module_en(get_JALR_index) ## module_en(get_JAL_index)
  brancher.imm    := operation

  io.jump_pc := brancher.jump_pc &(!load_stall)/*& io.f2d.fire*/
  io.new_pc  := brancher.new_pc

  /****************************to execute********************************/
  io.d2e.payload.module_en := module_en
  io.d2e.payload.operation := operation
  io.d2e.payload.rs1_data  := rs1_data
  io.d2e.payload.rs2_data  := rs2_data
  io.d2e.valid             := io.f2d.fire & (!io.d2regfile.valid)  &(!load_stall)

  /****************************fed back to fetch********************************/

  io.f2d.ready := io.d2e.ready & io.d2regfile.ready /*&(!io.stall)*/&(!load_stall)

}

case class branch_in_decode() extends Area{
  val PC        = Bits(32 bits)
  val rs1       = Bits(32 bits)
  val rs2       = Bits(32 bits)
  val select    = Bits(3 bits)
  val imm       = Bits(20 bits)
  val new_pc    = Bits(32 bits)
  val jump_pc   = Bool()

  new_pc := select.mux(
    //JAL : result will be usd as new PC,pc+4 will be write in regfile
    B"3'b001" -> ((B((10 downto 0) -> imm(19)) ## imm ## False).asSInt + PC.asSInt).asBits.resize(32),
    //JALR : result will be usd as new PC, pc+4 will be write in regfile
    B"3'b010" -> (((imm(11 downto 0).asSInt + rs1.asSInt).asBits(31 downto 1)) ## False),
    //BRANCH : result will be usd as new PC
    B"3'b100" -> (((imm(11 downto 0) ## False).asSInt + PC.asSInt).asBits),
//    default   -> (((imm(11 downto 0) ## False).asSInt + PC.asSInt).asBits)
    default   -> PC
  )

  val branch_op = imm(14 downto 12).mux(
    B"3'b000" -> (rs1 === rs2),
    B"3'b001" -> (rs1 =/= rs2),
    B"3'b100" -> (rs1.asSInt < rs2.asSInt),//signed
    B"3'b101" -> (rs1.asSInt > rs2.asSInt),//signed
    B"3'b110" -> (rs1.asUInt < rs2.asUInt),
    B"3'b111" -> (rs1.asUInt > rs2.asUInt),
    default   -> False
  )

  jump_pc := (branch_op && select(2))|| select(1) || select(0)

}

case class Wregfile_in_decode() extends Area{
  val PC        = Bits(32 bits)
  //[0]:LUI [1]:AUIPC [2]:JAL [3] JALR
  val select     = Bits(4 bits)
  val imm        = Bits(20 bits)
  val regfile_wdata = Bits(32 bits)

  regfile_wdata := select.mux(
    B"4'b0001" -> imm ## U"x000",
    B"4'b0010" -> (PC.asUInt + (imm ## U"x000").asUInt).asBits.resize(32),
    B"4'b0100" -> (PC.asUInt + 4).asBits.resize(32),
    B"4'b1000" -> (PC.asUInt + 4).asBits.resize(32),
    default    -> imm ## U"x000"
  )

}

object decoder_test{
  def main(args: Array[String]): Unit = {
    SpinalVerilog(new decoder())
  }
}