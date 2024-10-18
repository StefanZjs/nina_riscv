# nina_riscv
>最近在学西班牙语，nina在西班牙语里是女孩的意思，当然也有nino(男孩)，nino_riscv是5级流水线，但写的有点乱，所有就不发出来了

>nina_riscv使用SpinalHDL进行设计，共耗时4天完成（1 day coding,3 days verify）
## feature
* pipeline : 3 (fd -> ex -> mem)
* ISA : RISCV-[I] (no CSRs,no FENCE, no ECALL/EBREAK)
* Optimized for FPGA
* AXI4

## 性能及频率
xc7a200tsbg484-3 -> 181MHz (0.5 DMIPS/MHz)

## BSP
nina_riscv使用SpinalHDL设计，所以可以直接使用Briey SoC的[BSP](https://github.com/SpinalHDL/VexRiscvSocSoftware/tree/master/projects/briey)
## 外设添加
nina_riscv参照Briey SoC设计RAM与UART,其他外设也可以参考其进行添加。

## 指令集添加
借助SpinalHDL语言的独特优势，我使用了Map + List的方式对指令集进行管理（可以在instruction_decode.scala查看代码）

比如：添加[M]指令集，只需要两步
1. instruction_map中添加指令，instruction_map += (B"7'B0110011" -> Map("OPCODE_MULT" -> OP_GEN(instruction).alu_r))
2. ex_stage中新建一个Area实现乘法功能

# 参考资料
* Vexriscv : https://github.com/SpinalHDL/VexRiscv

> ***注意：纯自学，没有从业经验，所以验证的覆盖率可能不全。***

> Email：stefan_zjs@163.com
