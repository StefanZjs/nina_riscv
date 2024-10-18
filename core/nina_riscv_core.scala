package nina_riscv.core

import nina_riscv.bus.{bus_cfg, nina_dBUS, nina_iBUS}
import nina_riscv.decode.Utils.get_LOAD_index
import nina_riscv.ex.ex_stage
import nina_riscv.fd.fd_stage
import nina_riscv.mem.mem_stage
import nina_riscv.regfiles.regfiles
import spinal.core.{Mux, _}
import spinal.lib._
import spinal.lib.bus.amba3.apb.Apb3Decoder
import spinal.lib.bus.amba4.axi.{Axi4CrossbarFactory, Axi4ReadOnly, Axi4Shared, Axi4SharedOnChipRam, Axi4SharedToApb3Bridge}
import spinal.lib.com.uart.{Apb3UartCtrl, Uart, UartCtrlGenerics, UartCtrlMemoryMappedConfig}
import spinal.lib.misc.HexTools
import spinal.lib.soc.pinsec.{PinsecTimerCtrl, PinsecTimerCtrlExternal}

case class nina_riscv_core(val reset_vector : BigInt = 0) extends Component{
  val io = new Bundle{
    val iBUS = master(Axi4ReadOnly(bus_cfg.bus_Axi4Config()))
    val dBUS = master(Axi4Shared(bus_cfg.bus_Axi4Config()))
  }

  val regfile = regfiles()

  val fd   = fd_stage(reset_vector)
  val ex   = ex_stage(reset_vector)
  val mem  = mem_stage()
  /** bus connection */
  val ibus = nina_iBUS()
  val dbus = nina_dBUS()
  fd.io.ibus_cmd >> ibus.iCMD
  fd.io.ibus_rsp << ibus.iRSP
  io.iBUS <> ibus.toAxi4ReadOnly()

  mem.io.dbus_cmd >> dbus.dCMD
  mem.io.dbus_rsp << dbus.dRSP
  io.dBUS <> dbus.toAxi4Shared()

  /** fd 2 ex pipeline and read regfile*/
  fd.io.fd2x >/-> ex.io.fd2x
//  fd.io.pc_regfile >-> ex.io.pc_r_dest
  /** ex 2 mem pipeline */
  ex.io.mem >/-> mem.io.mem

  /** regfile read data out */
  fd.io.rd_cmd >> regfile.io.rd_cmd

  val rs1_data = regfile.io.rd_rsp.rd_data1
  val rs2_data = regfile.io.rd_rsp.rd_data2
  ex.io.rd_rsp.rd_data1 := rs1_data
  ex.io.rd_rsp.rd_data2 := rs2_data
  /** branch and jal/r */
  fd.io.jump << ex.io.jump
  /** regfile write */
  regfile.io.wr.reg_data := Mux(mem.io.wb.valid,mem.io.wb.reg_data,ex.io.ex2rf.reg_data)
  regfile.io.wr.reg_addr := Mux(mem.io.wb.valid,mem.io.wb.reg_dest,ex.io.ex2rf.reg_dest)
  regfile.io.wr.valid    := mem.io.wb.valid | ex.io.ex2rf.valid

  /** hazard ctrl */
    //stall
  val wb_conflict = mem.io.wb.valid & RegNext(ex.io.ex2rf.valid)
  val load_stall = RegInit(False)
  when(ex.io.fd2x.fire & ex.io.fd2x.module_en(get_LOAD_index)){
    load_stall := True
  }elsewhen(mem.io.dbus_rsp.fire){
    load_stall := False
  }

  ex.io.stall := wb_conflict | load_stall
  fd.io.stall := load_stall

  //forward
  val rd_addr1 = RegNextWhen(fd.io.rd_cmd.rd_addr1,fd.io.rd_cmd.valid)
  val rd_addr2 = RegNextWhen(fd.io.rd_cmd.rd_addr2,fd.io.rd_cmd.valid)

  val wb_conflict1 = (mem.io.wb.reg_dest === rd_addr1.asBits) & mem.io.wb.valid
  val wb_conflict2 = (mem.io.wb.reg_dest === rd_addr2.asBits) & mem.io.wb.valid
  val wb_fw1       = RegNext(wb_conflict1)
  val wb_fw2       = RegNext(wb_conflict2)
  val wb_fw1_data  = RegNextWhen(mem.io.wb.reg_data,wb_conflict1)
  val wb_fw2_data  = RegNextWhen(mem.io.wb.reg_data,wb_conflict2)
  ex.io.wb_fw.fw1_en   := wb_fw1
  ex.io.wb_fw.fw2_en   := wb_fw2
  ex.io.wb_fw.fw1_data := wb_fw1_data
  ex.io.wb_fw.fw2_data := wb_fw2_data

  val ex_conflict1 = (ex.io.ex2rf.reg_dest === rd_addr1.asBits) & ex.io.ex2rf.valid
  val ex_conflict2 = (ex.io.ex2rf.reg_dest === rd_addr2.asBits) & ex.io.ex2rf.valid

  ex.io.ex_fw.fw1_en := RegNext(ex_conflict1) & RegNext(!fd.io.fd2x.reg_dest_vld)
  ex.io.ex_fw.fw2_en := RegNext(ex_conflict2) & RegNext(!fd.io.fd2x.reg_dest_vld)

}

case class axi_nina_riscv() extends Component{
  val io = new Bundle{
    val uart      = master(Uart())
    val timerExternal = in(PinsecTimerCtrlExternal())
  }

  val cpu = nina_riscv_core(0x80000000l)

  val uart0_Ctrl = new Apb3UartCtrl(
    UartCtrlMemoryMappedConfig(
      uartCtrlConfig = UartCtrlGenerics(
        dataWidthMax = 8,
        clockDividerWidth = 20,
        preSamplingSize = 1,
        samplingSize = 5,
        postSamplingSize = 2
      ),
      txFifoDepth = 16,
      rxFifoDepth = 16
    ))
  val apbBridge = Axi4SharedToApb3Bridge(
    addressWidth = 28,
    dataWidth = 32,
    idWidth = 4
  )

  val ram = Axi4SharedOnChipRam(
    dataWidth = 32,
    byteCount = 128 kB,
    idWidth = 4,
    arwStage = false
  )
  val timerCtrl = PinsecTimerCtrl()
//start of crossbar define
val axiCrossbar = Axi4CrossbarFactory()

  axiCrossbar.addSlaves(
    ram.io.axi -> (0x80000000L, 128 kB),
    apbBridge.io.axi -> (0xF0000000L, 256 MB)
  )
  axiCrossbar.addConnections(
    cpu.io.iBUS -> List(ram.io.axi),
    cpu.io.dBUS -> List(ram.io.axi, apbBridge.io.axi)
  )
  axiCrossbar.addPipelining(cpu.io.iBUS)((cpu, crossbar) => {
    cpu.readCmd   >/> crossbar.readCmd
    cpu.readRsp   << crossbar.readRsp
  })
  axiCrossbar.addPipelining(cpu.io.dBUS)((cpu, crossbar) => {
    cpu.sharedCmd >/> crossbar.sharedCmd
    cpu.writeData >/> crossbar.writeData
    cpu.writeRsp  <<  crossbar.writeRsp
    cpu.readRsp   <-< crossbar.readRsp
  })
  axiCrossbar.build()
  //end of crossbar define
  val apbDecoder = Apb3Decoder(
    master = apbBridge.io.apb,
    slaves = List(
      uart0_Ctrl.io.apb -> (0x10000, 4 kB),
      timerCtrl.io.apb -> (0x20000, 4 kB)
    )
  )
  io.uart <> uart0_Ctrl.io.uart
  io.timerExternal  <> timerCtrl.io.external

}

object nina_riscv_base{
  def main(args: Array[String]): Unit = {
    val config = SpinalConfig()
    config.generateVerilog({
      val axi_nina = axi_nina_riscv()
      HexTools.initRam(axi_nina.ram.ram, "src/dhrystone.hex", 0x80000000l)
      axi_nina
    })
  }
}
