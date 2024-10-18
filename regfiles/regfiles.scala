package nina_riscv.regfiles

import spinal.core.{Mem, _}
import spinal.lib._

case class regfiles_rd_cmd() extends  Bundle{
  val rd_addr1 = UInt (5 bits)
  val rd_addr2 = UInt (5 bits)
}
case class  regfiles_rd_rsp() extends Bundle{
  val rd_data1 = Bits(32 bits)
  val rd_data2 = Bits(32 bits)
}
case class regfiles_wr() extends Bundle{
  val reg_data = Bits(32 bits)
  val reg_addr = Bits(5 bits)
}

case class regfiles() extends Component{
  val io = new Bundle{
    val rd_cmd   = slave(Flow(regfiles_rd_cmd()))
    val rd_rsp   = out(regfiles_rd_rsp())

    val wr       = slave(Flow(regfiles_wr()))
  }


  val regFile = new Mem(Bits(32 bit), 32)
  regFile.init(List.fill(32)(B(0, 32 bits)))

  /** ***************** READ **************************** */
  io.rd_rsp.rd_data1 := regFile.readSync(io.rd_cmd.rd_addr1,io.rd_cmd.valid)
  io.rd_rsp.rd_data2 := regFile.readSync(io.rd_cmd.rd_addr2,io.rd_cmd.valid)
  /******************* WRITE MEM*****************************/
  //X0 is not be able to write
  when(io.wr.valid && (io.wr.reg_addr =/= 0)){
    regFile.write(io.wr.reg_addr.asUInt,io.wr.reg_data)
  }

}
