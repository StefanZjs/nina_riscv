package nina_riscv.bus

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi.{Axi4Config, Axi4ReadOnly, Axi4Shared}

object bus_cfg{
  def bus_Axi4Config() = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useQos = false,
    useLen = false,
    useResp = true,
    useSize = true
  )

}

case class nina_icmd() extends Bundle{
  val pc = UInt(32 bit)
}
case class nina_irsp() extends Bundle{
  val instruction = Bits(32 bit)
//  val error       = Bool()
}

case class nina_dcmd() extends Bundle{
  val wr      = Bool()
  val addr    = UInt(32 bit)
  val data    = Bits(32 bit)
  val size    = UInt(2 bit)
}

case class nina_drsp() extends Bundle{
  val data    = UInt(32 bit)
}

case class nina_iBUS() extends Bundle {
  val iCMD = Stream(nina_icmd())
  val iRSP = Stream(nina_irsp())

  def toAxi4ReadOnly(): Axi4ReadOnly = {
    val axi = Axi4ReadOnly(bus_cfg.bus_Axi4Config())

    axi.ar.valid := iCMD.valid
    axi.ar.addr  := iCMD.pc
    axi.ar.prot  := "110"
    axi.ar.cache := "1111"
    axi.ar.size  := "111"
    iCMD.ready   := axi.ar.ready

    iRSP.valid   := axi.r.valid
    iRSP.instruction := axi.r.data
    axi.r.ready  := iRSP.ready

    axi
  }
}

case class nina_dBUS() extends Bundle{
  val dCMD = Stream(nina_dcmd())
  val dRSP = Stream(nina_drsp())

  def genMask(cmd: nina_dcmd )= {
    cmd.size.mux(
      U(0) -> B"0001",
      U(1) -> B"0011",
      default -> B"1111"
    ) |<< cmd.addr(1 downto 0)
  }

  def toAxi4Shared(pendingWritesMax : Int = 1): Axi4Shared = {
    val axi = Axi4Shared(bus_cfg.bus_Axi4Config())

    val cmdPreFork = dCMD

    val pendingWrites = CounterUpDown(
      stateCount = pendingWritesMax + 1,
      incWhen = cmdPreFork.fire && cmdPreFork.wr,
      decWhen = axi.writeRsp.fire
    )
    val hazard = (pendingWrites =/= 0 && cmdPreFork.valid && !cmdPreFork.wr) || pendingWrites === pendingWritesMax
    val (cmdFork, dataFork) = StreamFork2(cmdPreFork.haltWhen(hazard))
    axi.sharedCmd.arbitrationFrom(cmdFork)
    axi.sharedCmd.write := cmdFork.wr
    axi.sharedCmd.prot := "010"
    axi.sharedCmd.cache := "1111"
    axi.sharedCmd.size := cmdFork.size.resized
    axi.sharedCmd.addr := cmdFork.addr

    val dataStage = dataFork.throwWhen(!dataFork.wr)
    axi.writeData.arbitrationFrom(dataStage)
    axi.writeData.last := True
    axi.writeData.data := dataStage.data
    axi.writeData.strb := genMask(dataStage).resized

    dRSP.valid := axi.r.valid
    dRSP.data  := axi.r.data.asUInt

    axi.r.ready := dRSP.ready
    axi.b.ready := True


    axi
  }

}