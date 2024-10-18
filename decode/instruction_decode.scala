package nina_riscv.decode

import spinal.core._
import spinal.lib._

import scala.collection.mutable
import scala.collection.mutable.Map
import scala.util.control.Breaks

case class decode_bus (module_en: Bits, operation: Bits, indexer: List[String])

object Utils {
  def get_module_en_size = instruction_decode(Bits(32 bits)).module_en.getWidth
  def get_LOAD_index     = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_LOAD")
  def get_STORE_index    = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_STORE")
  def get_ALU_I_index    = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_ALU_I")
  def get_ALU_index      = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_ALU")
  def get_LUI_index      = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_LUI")
  def get_AUIPC_index    = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_AUIPC")
  def get_JAL_index      = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_JAL")
  def get_JALR_index     = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_JALR")
  def get_BRANCH_index   = instruction_decode(Bits(32 bits)).indexer.indexOf("OPCODE_BRANCH")


  def instruction_decode(instruction: Bits): decode_bus = {
//    assert(
//      assertion = (instruction.getWidth != 32),
//      message = "instruction width must be 32"
//    )
    //here we need it to be a fixed Map
    //default "Map" is hashed, so if we use "Map" , each time we access this FUNCTION may return a different result
    val instruction_map: mutable.ListMap[Bits, Map[String, Bits]] = mutable.ListMap()
    val port_map: Map[String, Bits] = Map()

    //RISCV [I]
    instruction_map += (B"7'B0110111" -> Map("OPCODE_LUI" -> OP_GEN(instruction).u))
    instruction_map += (B"7'B0010111" -> Map("OPCODE_AUIPC" -> OP_GEN(instruction).u))
    instruction_map += (B"7'B1101111" -> Map("OPCODE_JAL" -> OP_GEN(instruction).jal))
    instruction_map += (B"7'B1100111" -> Map("OPCODE_JALR" -> OP_GEN(instruction).i))
    instruction_map += (B"7'B1100011" -> Map("OPCODE_BRANCH" -> OP_GEN(instruction).b))
    instruction_map += (B"7'B0000011" -> Map("OPCODE_LOAD" -> OP_GEN(instruction).i))
    instruction_map += (B"7'B0100011" -> Map("OPCODE_STORE" -> OP_GEN(instruction).s))
    instruction_map += (B"7'B0010011" -> Map("OPCODE_ALU_I" -> OP_GEN(instruction).i))
    instruction_map += (B"7'B0110011" -> Map("OPCODE_ALU" -> OP_GEN(instruction).alu_r))
    instruction_map += (B"7'B0001111" -> Map("OPCODE_FENCE" -> OP_GEN(instruction).i))
    instruction_map += (B"7'B1110011" -> Map("OPCODE_ENV" -> OP_GEN(instruction).i))


    val break_foreach = new Breaks

    instruction_map.keys.foreach { x =>
//      println(x)
      if (port_map.isEmpty) {
        port_map ++= instruction_map.apply(x)
//        println(port_map.keys.toList)
      }else{
        instruction_map.apply(x).keys.foreach { y =>
          break_foreach.breakable {
            port_map.keys.foreach { z =>

              if (z == y) {
                break_foreach.break()
              }
            }
            port_map ++= instruction_map.apply(x)
          }
        }
      }
    }
//    println(port_map.keys.toList)

    val module_en = B(0, port_map.size bits)
    val operation = B(0, 20 bits)
    val index_list = port_map.keys.toList


    val break_switch = new Breaks

    switch(instruction(6 downto 0)) {
      instruction_map.keys.foreach { x =>
        is(x) {
          port_map.keys.foreach { y =>
            break_switch.breakable {
              instruction_map.apply(x).keys.foreach { z =>
                if (y == z) {
                  module_en := (port_map.keys.toList.indexOf(y) -> True)
                  operation := instruction_map.apply(x)(z).resized
                  //                  println(y)
                  break_switch.break()
                }
              }
              module_en := (port_map.keys.toList.indexOf(y) -> False)
            }
          }
        }
      }
    }

    decode_bus(module_en, operation,index_list)
  }
  //operation generator:
  //this function combined both "'immediate' generation" and "'opcode' for executer"  as a 'operation'
  //ALL 'operation' is 20bit , the structure is:
  // type 1: {20bit-imm}
  // type 2: {rd ,func3,12bit-imm}
  // type 3: {rd,func7,fun3,5'd0}
  // type 4: {10'b0,func5,aq,rl,func3}

  def reg_dest = 11 downto 7
  def func3_range = 14 downto 12
  def func7_range = 31 downto 25
  def rs1_addr = 19 downto 15
  def rs2_addr = 24 downto 20

  case class OP_GEN(instruction: Bits) extends Area {
    //LUI AUIPC
    def u = instruction(31 downto 12)
    // JAL  :: execute need to sign-extended 'jal' to 32bit, [19]
    def jal = instruction(31) ## instruction(19 downto 12) ## instruction(20) ## instruction(30 downto 21)
    //JALR :: LB LH LW LBU LHU :: ADDI SLTI SLTIU XORI ORI ANDI :: SLLI SRLI SARI :: FENCE FENCE.I :: CSR
    def i = instruction(reg_dest) ## instruction(func3_range) ## instruction(31 downto 20)
    //BEQ BNEQ BLT[U] BGT[U]
    def b = instruction(func3_range) ## instruction(31) ## instruction(7) ## instruction(30 downto 25) ## instruction(11 downto 8)
    //SB SH SW
    def s = instruction(reg_dest) ## instruction(func3_range) ## instruction(31 downto 25) ## instruction(11 downto 7)
    //ADD SUB SLL SLT SLTU XOR SRL SRA OR AND
    def alu_r = instruction(reg_dest) ## instruction(func7_range) ## instruction(func3_range) ## B"5'd0"

  }

}
