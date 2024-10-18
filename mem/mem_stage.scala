package nina_riscv.mem

import nina_riscv.bus.{nina_dcmd, nina_drsp}
import nina_riscv.ex.ex2mem
import spinal.core.{Mux, _}
import spinal.lib._

case class wb_bus() extends Bundle{
  val reg_dest = Bits(5 bits)
  val reg_data = Bits(32 bits)
}

case class mem_stage() extends Component{
  val io = new Bundle{
    val dbus_cmd   = master(Stream(nina_dcmd()))
    val dbus_rsp   = slave(Stream(nina_drsp()))

    val mem        = slave(Stream(ex2mem()))
    val wb         = master(Flow(wb_bus()))
  }
  /*******************write back**********************/
  val dest_temp  = RegNextWhen(io.mem.reg_dest             , io.mem.valid)
  val size_temp  = RegNextWhen(io.mem.size                 , io.mem.valid)
  val op_temp    = RegNextWhen(io.mem.usigned_op           , io.mem.valid)
  val addr_align = RegNextWhen(io.mem.mem_addr(1 downto 0) , io.mem.valid)

  val rsp_data_remap = (size_temp ## addr_align).mux(
    //byte
    M"0000" -> B((31 downto 8) -> (io.dbus_rsp.data.asBits(7) && !op_temp),
                      (7 downto 0) -> io.dbus_rsp.data.asBits(7 downto 0)),
      M"0001" -> B((31 downto 8) -> (io.dbus_rsp.data.asBits(15) && !op_temp),
                      (7 downto 0)  -> io.dbus_rsp.data.asBits(15 downto 8)),
      M"0010" -> B((31 downto 8) -> (io.dbus_rsp.data.asBits(23) && !op_temp),
                      (7 downto 0)  -> io.dbus_rsp.data.asBits(23 downto 16)),
      M"0011" -> B((31 downto 8) -> (io.dbus_rsp.data.asBits(31) && !op_temp),
                      (7 downto 0)  -> io.dbus_rsp.data.asBits(31 downto 24)),
    //half
      M"010-" -> B((31 downto 16) -> (io.dbus_rsp.data.asBits(15) && !op_temp),
                      (15 downto 0)  -> io.dbus_rsp.data.asBits(15 downto 0)),
      M"011-" -> B((31 downto 16) -> (io.dbus_rsp.data.asBits(31) && !op_temp),
                      (15 downto 0)  -> io.dbus_rsp.data.asBits(31 downto 16)),
    //word
      default -> (io.dbus_rsp.data.asBits)
  )

  io.wb.reg_data    := rsp_data_remap
  io.wb.reg_dest    := dest_temp
  io.wb.valid       := io.dbus_rsp.valid /*& (io.wb.reg_dest =/= 0)*/

  io.dbus_rsp.ready := True//io.wb.ready

  /*******************dbus**********************/
  io.dbus_cmd.wr    := io.mem.wr_en
  io.dbus_cmd.size  := io.mem.size.asUInt
//  io.dbus_cmd.data  := io.mem.mem_data
  io.dbus_cmd.data  := io.mem.size.asUInt.mux(
    U(0)    -> io.mem.mem_data(7 downto 0)  ## io.mem.mem_data(7 downto 0) ## io.mem.mem_data(7 downto 0) ## io.mem.mem_data(7 downto 0),
    U(1)    -> io.mem.mem_data(15 downto 0) ## io.mem.mem_data(15 downto 0),
    default -> io.mem.mem_data
  )
  io.dbus_cmd.addr  := io.mem.mem_addr.asUInt
  io.dbus_cmd.valid := io.mem.valid

  io.mem.ready      := io.dbus_cmd.ready

}
