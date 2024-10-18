package nina_riscv.fd

import nina_riscv.bus.{nina_icmd, nina_irsp}
import nina_riscv.regfiles.regfiles_rd_cmd
import nina_riscv.decode.Utils._
import spinal.core.{Mux, _}
import spinal.lib._


case class fd2x_bus() extends Bundle{

  val imm       = Bits(20 bits)
  val module_en = Bits(get_module_en_size bits)
  val reg_dest  = Bits(5 bits)
  val reg_dest_vld = Bool()

}

case class fd_jump() extends Bundle{
  val new_pc    = UInt(32 bits)
}

case class fd_stage(val reset_vector : BigInt = 0,
                    val use_fifo     : Boolean = false) extends Component{
  val io = new Bundle{
    val ibus_cmd   = master(Stream(nina_icmd()))
    val ibus_rsp   = slave(Stream(nina_irsp()))

    val stall      = in Bool()
    val jump       = slave(Stream(fd_jump()))

    val rd_cmd     = master(Flow(regfiles_rd_cmd()))
    val fd2x       = master(Stream(fd2x_bus()))
  }

  /*******************fetch**********************/
  val PC = Reg(UInt(32 bit)) init(reset_vector)

  when(io.jump.fire){
    PC := io.jump.payload.new_pc + U(4)
  }elsewhen(io.ibus_cmd.fire){
    PC := PC + U(4)
  }
  io.jump.ready := io.ibus_cmd.ready

  val inner_stream = Stream(nina_irsp())
  if(use_fifo){
    /******************* stream fifo **********************/
    val Fifo = StreamFifo(
      dataType = nina_irsp(),
      depth = 2
    )
    Fifo.io.push << io.ibus_rsp
    Fifo.io.pop >> inner_stream
    Fifo.io.flush := io.jump.valid
  }else{
    inner_stream << io.ibus_rsp
  }

  io.rd_cmd.rd_addr1 := inner_stream.instruction(rs1_addr).asUInt
  io.rd_cmd.rd_addr2 := inner_stream.instruction(rs2_addr).asUInt
  io.rd_cmd.valid    := inner_stream.fire
  /******************* decode **********************/
  val instruction_decoder = instruction_decode(inner_stream.instruction.asBits)
  val module_en = instruction_decoder.module_en
  val operation = instruction_decoder.operation

  io.fd2x.arbitrationFrom(inner_stream.throwWhen(io.jump.valid))
  io.fd2x.imm           := operation
  io.fd2x.module_en     := module_en

  io.fd2x.reg_dest      := inner_stream.instruction(reg_dest)
  io.fd2x.reg_dest_vld  := /*inner_stream.fire & */(module_en(get_JAL_index) |
    module_en(get_JALR_index) |
    module_en(get_AUIPC_index) |
    module_en(get_LUI_index))

  /*******************ibus_cmd**********************/
  val resetDone = RegNext(True) init(False)
  io.ibus_cmd.valid     := resetDone &(!io.stall)
  io.ibus_cmd.pc        := Mux(io.jump.valid,io.jump.payload.new_pc,PC)
  /*******************ibus_rsp**********************/
//  io.ibus_rsp.ready     := io.fd2x.ready

}
