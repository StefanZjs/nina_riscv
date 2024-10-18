// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : axi_nina_riscv

`timescale 1ns/1ps

module axi_nina_riscv (
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  input  wire          io_timerExternal_clear,
  input  wire          io_timerExternal_tick,
  input  wire          clk,
  input  wire          reset
);

  wire       [4:0]    uart0_Ctrl_io_apb_PADDR;
  wire       [7:0]    timerCtrl_io_apb_PADDR;
  reg                 cpu_io_dBUS_decoder_io_input_r_ready;
  wire       [27:0]   apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [1:0]    apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst;
  wire       [16:0]   ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [1:0]    ram_io_axi_arbiter_io_readInputs_0_ar_payload_burst;
  wire       [16:0]   ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [1:0]    ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst;
  wire                apb3Router_1_io_outputs_0_PSLVERROR;
  wire                cpu_io_iBUS_ar_valid;
  wire       [31:0]   cpu_io_iBUS_ar_payload_addr;
  wire       [2:0]    cpu_io_iBUS_ar_payload_size;
  wire       [3:0]    cpu_io_iBUS_ar_payload_cache;
  wire       [2:0]    cpu_io_iBUS_ar_payload_prot;
  wire                cpu_io_iBUS_r_ready;
  wire                cpu_io_dBUS_arw_valid;
  wire       [31:0]   cpu_io_dBUS_arw_payload_addr;
  wire       [2:0]    cpu_io_dBUS_arw_payload_size;
  wire       [3:0]    cpu_io_dBUS_arw_payload_cache;
  wire       [2:0]    cpu_io_dBUS_arw_payload_prot;
  wire                cpu_io_dBUS_arw_payload_write;
  wire                cpu_io_dBUS_w_valid;
  wire       [31:0]   cpu_io_dBUS_w_payload_data;
  wire       [3:0]    cpu_io_dBUS_w_payload_strb;
  wire                cpu_io_dBUS_w_payload_last;
  wire                cpu_io_dBUS_b_ready;
  wire                cpu_io_dBUS_r_ready;
  wire                uart0_Ctrl_io_apb_PREADY;
  wire       [31:0]   uart0_Ctrl_io_apb_PRDATA;
  wire                uart0_Ctrl_io_uart_txd;
  wire                uart0_Ctrl_io_interrupt;
  wire                apbBridge_io_axi_arw_ready;
  wire                apbBridge_io_axi_w_ready;
  wire                apbBridge_io_axi_b_valid;
  wire       [3:0]    apbBridge_io_axi_b_payload_id;
  wire       [1:0]    apbBridge_io_axi_b_payload_resp;
  wire                apbBridge_io_axi_r_valid;
  wire       [31:0]   apbBridge_io_axi_r_payload_data;
  wire       [3:0]    apbBridge_io_axi_r_payload_id;
  wire       [1:0]    apbBridge_io_axi_r_payload_resp;
  wire                apbBridge_io_axi_r_payload_last;
  wire       [27:0]   apbBridge_io_apb_PADDR;
  wire       [0:0]    apbBridge_io_apb_PSEL;
  wire                apbBridge_io_apb_PENABLE;
  wire                apbBridge_io_apb_PWRITE;
  wire       [31:0]   apbBridge_io_apb_PWDATA;
  wire                ram_io_axi_arw_ready;
  wire                ram_io_axi_w_ready;
  wire                ram_io_axi_b_valid;
  wire       [3:0]    ram_io_axi_b_payload_id;
  wire       [1:0]    ram_io_axi_b_payload_resp;
  wire                ram_io_axi_r_valid;
  wire       [31:0]   ram_io_axi_r_payload_data;
  wire       [3:0]    ram_io_axi_r_payload_id;
  wire       [1:0]    ram_io_axi_r_payload_resp;
  wire                ram_io_axi_r_payload_last;
  wire                timerCtrl_io_apb_PREADY;
  wire       [31:0]   timerCtrl_io_apb_PRDATA;
  wire                timerCtrl_io_apb_PSLVERROR;
  wire                timerCtrl_io_interrupt;
  wire                cpu_io_iBUS_decoder_io_input_ar_ready;
  wire                cpu_io_iBUS_decoder_io_input_r_valid;
  wire       [31:0]   cpu_io_iBUS_decoder_io_input_r_payload_data;
  wire       [1:0]    cpu_io_iBUS_decoder_io_input_r_payload_resp;
  wire                cpu_io_iBUS_decoder_io_input_r_payload_last;
  wire                cpu_io_iBUS_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   cpu_io_iBUS_decoder_io_outputs_0_ar_payload_addr;
  wire       [2:0]    cpu_io_iBUS_decoder_io_outputs_0_ar_payload_size;
  wire       [3:0]    cpu_io_iBUS_decoder_io_outputs_0_ar_payload_cache;
  wire       [2:0]    cpu_io_iBUS_decoder_io_outputs_0_ar_payload_prot;
  wire                cpu_io_iBUS_decoder_io_outputs_0_r_ready;
  wire                cpu_io_dBUS_decoder_io_input_arw_ready;
  wire                cpu_io_dBUS_decoder_io_input_w_ready;
  wire                cpu_io_dBUS_decoder_io_input_b_valid;
  wire       [1:0]    cpu_io_dBUS_decoder_io_input_b_payload_resp;
  wire                cpu_io_dBUS_decoder_io_input_r_valid;
  wire       [31:0]   cpu_io_dBUS_decoder_io_input_r_payload_data;
  wire       [1:0]    cpu_io_dBUS_decoder_io_input_r_payload_resp;
  wire                cpu_io_dBUS_decoder_io_input_r_payload_last;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire       [2:0]    cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_prot;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_write;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_w_valid;
  wire       [31:0]   cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_strb;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_last;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_b_ready;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_0_r_ready;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire       [2:0]    cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_prot;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_write;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_w_valid;
  wire       [31:0]   cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_strb;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_last;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_b_ready;
  wire                cpu_io_dBUS_decoder_io_sharedOutputs_1_r_ready;
  wire                apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [27:0]   apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                ram_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   ram_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    ram_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    ram_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                ram_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                ram_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                ram_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                ram_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                ram_io_axi_arbiter_io_output_arw_valid;
  wire       [16:0]   ram_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    ram_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    ram_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    ram_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    ram_io_axi_arbiter_io_output_arw_payload_burst;
  wire                ram_io_axi_arbiter_io_output_arw_payload_write;
  wire                ram_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   ram_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    ram_io_axi_arbiter_io_output_w_payload_strb;
  wire                ram_io_axi_arbiter_io_output_w_payload_last;
  wire                ram_io_axi_arbiter_io_output_b_ready;
  wire                ram_io_axi_arbiter_io_output_r_ready;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [27:0]   io_apb_decoder_io_output_PADDR;
  wire       [1:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [27:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [27:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire                toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_valid;
  wire                toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [2:0]    toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [3:0]    toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_rValid;
  wire                toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_fire;
  wire                toplevel_cpu_io_iBUS_ar_s2mPipe_valid;
  wire                toplevel_cpu_io_iBUS_ar_s2mPipe_ready;
  wire       [31:0]   toplevel_cpu_io_iBUS_ar_s2mPipe_payload_addr;
  wire       [2:0]    toplevel_cpu_io_iBUS_ar_s2mPipe_payload_size;
  wire       [3:0]    toplevel_cpu_io_iBUS_ar_s2mPipe_payload_cache;
  wire       [2:0]    toplevel_cpu_io_iBUS_ar_s2mPipe_payload_prot;
  reg                 toplevel_cpu_io_iBUS_ar_rValidN;
  reg        [31:0]   toplevel_cpu_io_iBUS_ar_rData_addr;
  reg        [2:0]    toplevel_cpu_io_iBUS_ar_rData_size;
  reg        [3:0]    toplevel_cpu_io_iBUS_ar_rData_cache;
  reg        [2:0]    toplevel_cpu_io_iBUS_ar_rData_prot;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_valid;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_ready;
  wire       [31:0]   toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr;
  wire       [2:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_size;
  wire       [3:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_cache;
  wire       [2:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_prot;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_write;
  reg                 toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_rValid;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_fire;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_valid;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_ready;
  wire       [31:0]   toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr;
  wire       [2:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_size;
  wire       [3:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_cache;
  wire       [2:0]    toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_prot;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_write;
  reg                 toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_rValid;
  wire                toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_fire;
  wire                toplevel_cpu_io_dBUS_arw_s2mPipe_valid;
  wire                toplevel_cpu_io_dBUS_arw_s2mPipe_ready;
  wire       [31:0]   toplevel_cpu_io_dBUS_arw_s2mPipe_payload_addr;
  wire       [2:0]    toplevel_cpu_io_dBUS_arw_s2mPipe_payload_size;
  wire       [3:0]    toplevel_cpu_io_dBUS_arw_s2mPipe_payload_cache;
  wire       [2:0]    toplevel_cpu_io_dBUS_arw_s2mPipe_payload_prot;
  wire                toplevel_cpu_io_dBUS_arw_s2mPipe_payload_write;
  reg                 toplevel_cpu_io_dBUS_arw_rValidN;
  reg        [31:0]   toplevel_cpu_io_dBUS_arw_rData_addr;
  reg        [2:0]    toplevel_cpu_io_dBUS_arw_rData_size;
  reg        [3:0]    toplevel_cpu_io_dBUS_arw_rData_cache;
  reg        [2:0]    toplevel_cpu_io_dBUS_arw_rData_prot;
  reg                 toplevel_cpu_io_dBUS_arw_rData_write;
  wire                toplevel_cpu_io_dBUS_w_s2mPipe_valid;
  wire                toplevel_cpu_io_dBUS_w_s2mPipe_ready;
  wire       [31:0]   toplevel_cpu_io_dBUS_w_s2mPipe_payload_data;
  wire       [3:0]    toplevel_cpu_io_dBUS_w_s2mPipe_payload_strb;
  wire                toplevel_cpu_io_dBUS_w_s2mPipe_payload_last;
  reg                 toplevel_cpu_io_dBUS_w_rValidN;
  reg        [31:0]   toplevel_cpu_io_dBUS_w_rData_data;
  reg        [3:0]    toplevel_cpu_io_dBUS_w_rData_strb;
  reg                 toplevel_cpu_io_dBUS_w_rData_last;
  wire                toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_valid;
  wire                toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_ready;
  wire       [31:0]   toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_data;
  wire       [1:0]    toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_resp;
  wire                toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_last;
  reg                 toplevel_cpu_io_dBUS_decoder_io_input_r_rValid;
  reg        [31:0]   toplevel_cpu_io_dBUS_decoder_io_input_r_rData_data;
  reg        [1:0]    toplevel_cpu_io_dBUS_decoder_io_input_r_rData_resp;
  reg                 toplevel_cpu_io_dBUS_decoder_io_input_r_rData_last;
  wire                when_Stream_l369;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_id;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len;
  wire       [2:0]    _zz_io_readInputs_0_ar_payload_id;
  wire       [7:0]    _zz_io_readInputs_0_ar_payload_len;
  wire       [2:0]    _zz_io_sharedInputs_0_arw_payload_id_1;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len_1;

  nina_riscv_core cpu (
    .io_iBUS_ar_valid          (cpu_io_iBUS_ar_valid                                              ), //o
    .io_iBUS_ar_ready          (toplevel_cpu_io_iBUS_ar_rValidN                                   ), //i
    .io_iBUS_ar_payload_addr   (cpu_io_iBUS_ar_payload_addr[31:0]                                 ), //o
    .io_iBUS_ar_payload_size   (cpu_io_iBUS_ar_payload_size[2:0]                                  ), //o
    .io_iBUS_ar_payload_cache  (cpu_io_iBUS_ar_payload_cache[3:0]                                 ), //o
    .io_iBUS_ar_payload_prot   (cpu_io_iBUS_ar_payload_prot[2:0]                                  ), //o
    .io_iBUS_r_valid           (cpu_io_iBUS_decoder_io_input_r_valid                              ), //i
    .io_iBUS_r_ready           (cpu_io_iBUS_r_ready                                               ), //o
    .io_iBUS_r_payload_data    (cpu_io_iBUS_decoder_io_input_r_payload_data[31:0]                 ), //i
    .io_iBUS_r_payload_resp    (cpu_io_iBUS_decoder_io_input_r_payload_resp[1:0]                  ), //i
    .io_iBUS_r_payload_last    (cpu_io_iBUS_decoder_io_input_r_payload_last                       ), //i
    .io_dBUS_arw_valid         (cpu_io_dBUS_arw_valid                                             ), //o
    .io_dBUS_arw_ready         (toplevel_cpu_io_dBUS_arw_rValidN                                  ), //i
    .io_dBUS_arw_payload_addr  (cpu_io_dBUS_arw_payload_addr[31:0]                                ), //o
    .io_dBUS_arw_payload_size  (cpu_io_dBUS_arw_payload_size[2:0]                                 ), //o
    .io_dBUS_arw_payload_cache (cpu_io_dBUS_arw_payload_cache[3:0]                                ), //o
    .io_dBUS_arw_payload_prot  (cpu_io_dBUS_arw_payload_prot[2:0]                                 ), //o
    .io_dBUS_arw_payload_write (cpu_io_dBUS_arw_payload_write                                     ), //o
    .io_dBUS_w_valid           (cpu_io_dBUS_w_valid                                               ), //o
    .io_dBUS_w_ready           (toplevel_cpu_io_dBUS_w_rValidN                                    ), //i
    .io_dBUS_w_payload_data    (cpu_io_dBUS_w_payload_data[31:0]                                  ), //o
    .io_dBUS_w_payload_strb    (cpu_io_dBUS_w_payload_strb[3:0]                                   ), //o
    .io_dBUS_w_payload_last    (cpu_io_dBUS_w_payload_last                                        ), //o
    .io_dBUS_b_valid           (cpu_io_dBUS_decoder_io_input_b_valid                              ), //i
    .io_dBUS_b_ready           (cpu_io_dBUS_b_ready                                               ), //o
    .io_dBUS_b_payload_resp    (cpu_io_dBUS_decoder_io_input_b_payload_resp[1:0]                  ), //i
    .io_dBUS_r_valid           (toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_valid             ), //i
    .io_dBUS_r_ready           (cpu_io_dBUS_r_ready                                               ), //o
    .io_dBUS_r_payload_data    (toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_data[31:0]), //i
    .io_dBUS_r_payload_resp    (toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_resp[1:0] ), //i
    .io_dBUS_r_payload_last    (toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_last      ), //i
    .clk                       (clk                                                               ), //i
    .reset                     (reset                                                             )  //i
  );
  Apb3UartCtrl uart0_Ctrl (
    .io_apb_PADDR   (uart0_Ctrl_io_apb_PADDR[4:0]          ), //i
    .io_apb_PSEL    (apb3Router_1_io_outputs_0_PSEL        ), //i
    .io_apb_PENABLE (apb3Router_1_io_outputs_0_PENABLE     ), //i
    .io_apb_PREADY  (uart0_Ctrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE  (apb3Router_1_io_outputs_0_PWRITE      ), //i
    .io_apb_PWDATA  (apb3Router_1_io_outputs_0_PWDATA[31:0]), //i
    .io_apb_PRDATA  (uart0_Ctrl_io_apb_PRDATA[31:0]        ), //o
    .io_uart_txd    (uart0_Ctrl_io_uart_txd                ), //o
    .io_uart_rxd    (io_uart_rxd                           ), //i
    .io_interrupt   (uart0_Ctrl_io_interrupt               ), //o
    .clk            (clk                                   ), //i
    .reset          (reset                                 )  //i
  );
  Axi4SharedToApb3Bridge apbBridge (
    .io_axi_arw_valid         (apbBridge_io_axi_arbiter_io_output_arw_valid             ), //i
    .io_axi_arw_ready         (apbBridge_io_axi_arw_ready                               ), //o
    .io_axi_arw_payload_addr  (apbBridge_io_axi_arbiter_io_output_arw_payload_addr[27:0]), //i
    .io_axi_arw_payload_id    (apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]   ), //i
    .io_axi_arw_payload_len   (apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (apbBridge_io_axi_arbiter_io_output_arw_payload_write     ), //i
    .io_axi_w_valid           (apbBridge_io_axi_arbiter_io_output_w_valid               ), //i
    .io_axi_w_ready           (apbBridge_io_axi_w_ready                                 ), //o
    .io_axi_w_payload_data    (apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (apbBridge_io_axi_arbiter_io_output_w_payload_last        ), //i
    .io_axi_b_valid           (apbBridge_io_axi_b_valid                                 ), //o
    .io_axi_b_ready           (apbBridge_io_axi_arbiter_io_output_b_ready               ), //i
    .io_axi_b_payload_id      (apbBridge_io_axi_b_payload_id[3:0]                       ), //o
    .io_axi_b_payload_resp    (apbBridge_io_axi_b_payload_resp[1:0]                     ), //o
    .io_axi_r_valid           (apbBridge_io_axi_r_valid                                 ), //o
    .io_axi_r_ready           (apbBridge_io_axi_arbiter_io_output_r_ready               ), //i
    .io_axi_r_payload_data    (apbBridge_io_axi_r_payload_data[31:0]                    ), //o
    .io_axi_r_payload_id      (apbBridge_io_axi_r_payload_id[3:0]                       ), //o
    .io_axi_r_payload_resp    (apbBridge_io_axi_r_payload_resp[1:0]                     ), //o
    .io_axi_r_payload_last    (apbBridge_io_axi_r_payload_last                          ), //o
    .io_apb_PADDR             (apbBridge_io_apb_PADDR[27:0]                             ), //o
    .io_apb_PSEL              (apbBridge_io_apb_PSEL                                    ), //o
    .io_apb_PENABLE           (apbBridge_io_apb_PENABLE                                 ), //o
    .io_apb_PREADY            (io_apb_decoder_io_input_PREADY                           ), //i
    .io_apb_PWRITE            (apbBridge_io_apb_PWRITE                                  ), //o
    .io_apb_PWDATA            (apbBridge_io_apb_PWDATA[31:0]                            ), //o
    .io_apb_PRDATA            (io_apb_decoder_io_input_PRDATA[31:0]                     ), //i
    .io_apb_PSLVERROR         (io_apb_decoder_io_input_PSLVERROR                        ), //i
    .clk                      (clk                                                      ), //i
    .reset                    (reset                                                    )  //i
  );
  Axi4SharedOnChipRam ram (
    .io_axi_arw_valid         (ram_io_axi_arbiter_io_output_arw_valid             ), //i
    .io_axi_arw_ready         (ram_io_axi_arw_ready                               ), //o
    .io_axi_arw_payload_addr  (ram_io_axi_arbiter_io_output_arw_payload_addr[16:0]), //i
    .io_axi_arw_payload_id    (ram_io_axi_arbiter_io_output_arw_payload_id[3:0]   ), //i
    .io_axi_arw_payload_len   (ram_io_axi_arbiter_io_output_arw_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (ram_io_axi_arbiter_io_output_arw_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (ram_io_axi_arbiter_io_output_arw_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (ram_io_axi_arbiter_io_output_arw_payload_write     ), //i
    .io_axi_w_valid           (ram_io_axi_arbiter_io_output_w_valid               ), //i
    .io_axi_w_ready           (ram_io_axi_w_ready                                 ), //o
    .io_axi_w_payload_data    (ram_io_axi_arbiter_io_output_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (ram_io_axi_arbiter_io_output_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (ram_io_axi_arbiter_io_output_w_payload_last        ), //i
    .io_axi_b_valid           (ram_io_axi_b_valid                                 ), //o
    .io_axi_b_ready           (ram_io_axi_arbiter_io_output_b_ready               ), //i
    .io_axi_b_payload_id      (ram_io_axi_b_payload_id[3:0]                       ), //o
    .io_axi_b_payload_resp    (ram_io_axi_b_payload_resp[1:0]                     ), //o
    .io_axi_r_valid           (ram_io_axi_r_valid                                 ), //o
    .io_axi_r_ready           (ram_io_axi_arbiter_io_output_r_ready               ), //i
    .io_axi_r_payload_data    (ram_io_axi_r_payload_data[31:0]                    ), //o
    .io_axi_r_payload_id      (ram_io_axi_r_payload_id[3:0]                       ), //o
    .io_axi_r_payload_resp    (ram_io_axi_r_payload_resp[1:0]                     ), //o
    .io_axi_r_payload_last    (ram_io_axi_r_payload_last                          ), //o
    .clk                      (clk                                                ), //i
    .reset                    (reset                                              )  //i
  );
  PinsecTimerCtrl timerCtrl (
    .io_apb_PADDR      (timerCtrl_io_apb_PADDR[7:0]           ), //i
    .io_apb_PSEL       (apb3Router_1_io_outputs_1_PSEL        ), //i
    .io_apb_PENABLE    (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .io_apb_PREADY     (timerCtrl_io_apb_PREADY               ), //o
    .io_apb_PWRITE     (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .io_apb_PWDATA     (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .io_apb_PRDATA     (timerCtrl_io_apb_PRDATA[31:0]         ), //o
    .io_apb_PSLVERROR  (timerCtrl_io_apb_PSLVERROR            ), //o
    .io_external_clear (io_timerExternal_clear                ), //i
    .io_external_tick  (io_timerExternal_tick                 ), //i
    .io_interrupt      (timerCtrl_io_interrupt                ), //o
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  Axi4ReadOnlyDecoder cpu_io_iBUS_decoder (
    .io_input_ar_valid             (toplevel_cpu_io_iBUS_ar_s2mPipe_valid                      ), //i
    .io_input_ar_ready             (cpu_io_iBUS_decoder_io_input_ar_ready                      ), //o
    .io_input_ar_payload_addr      (toplevel_cpu_io_iBUS_ar_s2mPipe_payload_addr[31:0]         ), //i
    .io_input_ar_payload_size      (toplevel_cpu_io_iBUS_ar_s2mPipe_payload_size[2:0]          ), //i
    .io_input_ar_payload_cache     (toplevel_cpu_io_iBUS_ar_s2mPipe_payload_cache[3:0]         ), //i
    .io_input_ar_payload_prot      (toplevel_cpu_io_iBUS_ar_s2mPipe_payload_prot[2:0]          ), //i
    .io_input_r_valid              (cpu_io_iBUS_decoder_io_input_r_valid                       ), //o
    .io_input_r_ready              (cpu_io_iBUS_r_ready                                        ), //i
    .io_input_r_payload_data       (cpu_io_iBUS_decoder_io_input_r_payload_data[31:0]          ), //o
    .io_input_r_payload_resp       (cpu_io_iBUS_decoder_io_input_r_payload_resp[1:0]           ), //o
    .io_input_r_payload_last       (cpu_io_iBUS_decoder_io_input_r_payload_last                ), //o
    .io_outputs_0_ar_valid         (cpu_io_iBUS_decoder_io_outputs_0_ar_valid                  ), //o
    .io_outputs_0_ar_ready         (toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_fire), //i
    .io_outputs_0_ar_payload_addr  (cpu_io_iBUS_decoder_io_outputs_0_ar_payload_addr[31:0]     ), //o
    .io_outputs_0_ar_payload_size  (cpu_io_iBUS_decoder_io_outputs_0_ar_payload_size[2:0]      ), //o
    .io_outputs_0_ar_payload_cache (cpu_io_iBUS_decoder_io_outputs_0_ar_payload_cache[3:0]     ), //o
    .io_outputs_0_ar_payload_prot  (cpu_io_iBUS_decoder_io_outputs_0_ar_payload_prot[2:0]      ), //o
    .io_outputs_0_r_valid          (ram_io_axi_arbiter_io_readInputs_0_r_valid                 ), //i
    .io_outputs_0_r_ready          (cpu_io_iBUS_decoder_io_outputs_0_r_ready                   ), //o
    .io_outputs_0_r_payload_data   (ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //i
    .io_outputs_0_r_payload_resp   (ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //i
    .io_outputs_0_r_payload_last   (ram_io_axi_arbiter_io_readInputs_0_r_payload_last          ), //i
    .clk                           (clk                                                        ), //i
    .reset                         (reset                                                      )  //i
  );
  Axi4SharedDecoder cpu_io_dBUS_decoder (
    .io_input_arw_valid                   (toplevel_cpu_io_dBUS_arw_s2mPipe_valid                            ), //i
    .io_input_arw_ready                   (cpu_io_dBUS_decoder_io_input_arw_ready                            ), //o
    .io_input_arw_payload_addr            (toplevel_cpu_io_dBUS_arw_s2mPipe_payload_addr[31:0]               ), //i
    .io_input_arw_payload_size            (toplevel_cpu_io_dBUS_arw_s2mPipe_payload_size[2:0]                ), //i
    .io_input_arw_payload_cache           (toplevel_cpu_io_dBUS_arw_s2mPipe_payload_cache[3:0]               ), //i
    .io_input_arw_payload_prot            (toplevel_cpu_io_dBUS_arw_s2mPipe_payload_prot[2:0]                ), //i
    .io_input_arw_payload_write           (toplevel_cpu_io_dBUS_arw_s2mPipe_payload_write                    ), //i
    .io_input_w_valid                     (toplevel_cpu_io_dBUS_w_s2mPipe_valid                              ), //i
    .io_input_w_ready                     (cpu_io_dBUS_decoder_io_input_w_ready                              ), //o
    .io_input_w_payload_data              (toplevel_cpu_io_dBUS_w_s2mPipe_payload_data[31:0]                 ), //i
    .io_input_w_payload_strb              (toplevel_cpu_io_dBUS_w_s2mPipe_payload_strb[3:0]                  ), //i
    .io_input_w_payload_last              (toplevel_cpu_io_dBUS_w_s2mPipe_payload_last                       ), //i
    .io_input_b_valid                     (cpu_io_dBUS_decoder_io_input_b_valid                              ), //o
    .io_input_b_ready                     (cpu_io_dBUS_b_ready                                               ), //i
    .io_input_b_payload_resp              (cpu_io_dBUS_decoder_io_input_b_payload_resp[1:0]                  ), //o
    .io_input_r_valid                     (cpu_io_dBUS_decoder_io_input_r_valid                              ), //o
    .io_input_r_ready                     (cpu_io_dBUS_decoder_io_input_r_ready                              ), //i
    .io_input_r_payload_data              (cpu_io_dBUS_decoder_io_input_r_payload_data[31:0]                 ), //o
    .io_input_r_payload_resp              (cpu_io_dBUS_decoder_io_input_r_payload_resp[1:0]                  ), //o
    .io_input_r_payload_last              (cpu_io_dBUS_decoder_io_input_r_payload_last                       ), //o
    .io_sharedOutputs_0_arw_valid         (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_valid                  ), //o
    .io_sharedOutputs_0_arw_ready         (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_fire), //i
    .io_sharedOutputs_0_arw_payload_addr  (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_addr[31:0]     ), //o
    .io_sharedOutputs_0_arw_payload_size  (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_size[2:0]      ), //o
    .io_sharedOutputs_0_arw_payload_cache (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_cache[3:0]     ), //o
    .io_sharedOutputs_0_arw_payload_prot  (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_prot[2:0]      ), //o
    .io_sharedOutputs_0_arw_payload_write (cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_write          ), //o
    .io_sharedOutputs_0_w_valid           (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_valid                    ), //o
    .io_sharedOutputs_0_w_ready           (ram_io_axi_arbiter_io_sharedInputs_0_w_ready                      ), //i
    .io_sharedOutputs_0_w_payload_data    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_data[31:0]       ), //o
    .io_sharedOutputs_0_w_payload_strb    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_strb[3:0]        ), //o
    .io_sharedOutputs_0_w_payload_last    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_last             ), //o
    .io_sharedOutputs_0_b_valid           (ram_io_axi_arbiter_io_sharedInputs_0_b_valid                      ), //i
    .io_sharedOutputs_0_b_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_0_b_ready                    ), //o
    .io_sharedOutputs_0_b_payload_resp    (ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]          ), //i
    .io_sharedOutputs_0_r_valid           (ram_io_axi_arbiter_io_sharedInputs_0_r_valid                      ), //i
    .io_sharedOutputs_0_r_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_0_r_ready                    ), //o
    .io_sharedOutputs_0_r_payload_data    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]         ), //i
    .io_sharedOutputs_0_r_payload_resp    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]          ), //i
    .io_sharedOutputs_0_r_payload_last    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last               ), //i
    .io_sharedOutputs_1_arw_valid         (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_valid                  ), //o
    .io_sharedOutputs_1_arw_ready         (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_fire), //i
    .io_sharedOutputs_1_arw_payload_addr  (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]     ), //o
    .io_sharedOutputs_1_arw_payload_size  (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_size[2:0]      ), //o
    .io_sharedOutputs_1_arw_payload_cache (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_cache[3:0]     ), //o
    .io_sharedOutputs_1_arw_payload_prot  (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_prot[2:0]      ), //o
    .io_sharedOutputs_1_arw_payload_write (cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_write          ), //o
    .io_sharedOutputs_1_w_valid           (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_valid                    ), //o
    .io_sharedOutputs_1_w_ready           (apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                ), //i
    .io_sharedOutputs_1_w_payload_data    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_data[31:0]       ), //o
    .io_sharedOutputs_1_w_payload_strb    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_strb[3:0]        ), //o
    .io_sharedOutputs_1_w_payload_last    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_last             ), //o
    .io_sharedOutputs_1_b_valid           (apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                ), //i
    .io_sharedOutputs_1_b_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_1_b_ready                    ), //o
    .io_sharedOutputs_1_b_payload_resp    (apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]    ), //i
    .io_sharedOutputs_1_r_valid           (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                ), //i
    .io_sharedOutputs_1_r_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_1_r_ready                    ), //o
    .io_sharedOutputs_1_r_payload_data    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]   ), //i
    .io_sharedOutputs_1_r_payload_resp    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]    ), //i
    .io_sharedOutputs_1_r_payload_last    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last         ), //i
    .clk                                  (clk                                                               ), //i
    .reset                                (reset                                                             )  //i
  );
  Axi4SharedArbiter apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid         (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_valid            ), //i
    .io_sharedInputs_0_arw_ready         (apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready                           ), //o
    .io_sharedInputs_0_arw_payload_addr  (apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[27:0]              ), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id[3:0]                                      ), //i
    .io_sharedInputs_0_arw_payload_len   (_zz_io_sharedInputs_0_arw_payload_len[7:0]                                     ), //i
    .io_sharedInputs_0_arw_payload_size  (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_size[2:0]), //i
    .io_sharedInputs_0_arw_payload_burst (apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst[1:0]              ), //i
    .io_sharedInputs_0_arw_payload_write (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_write    ), //i
    .io_sharedInputs_0_w_valid           (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_valid                                 ), //i
    .io_sharedInputs_0_w_ready           (apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                             ), //o
    .io_sharedInputs_0_w_payload_data    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_data[31:0]                    ), //i
    .io_sharedInputs_0_w_payload_strb    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_strb[3:0]                     ), //i
    .io_sharedInputs_0_w_payload_last    (cpu_io_dBUS_decoder_io_sharedOutputs_1_w_payload_last                          ), //i
    .io_sharedInputs_0_b_valid           (apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                             ), //o
    .io_sharedInputs_0_b_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_1_b_ready                                 ), //i
    .io_sharedInputs_0_b_payload_id      (apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]                   ), //o
    .io_sharedInputs_0_b_payload_resp    (apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]                 ), //o
    .io_sharedInputs_0_r_valid           (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                             ), //o
    .io_sharedInputs_0_r_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_1_r_ready                                 ), //i
    .io_sharedInputs_0_r_payload_data    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]                ), //o
    .io_sharedInputs_0_r_payload_id      (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]                   ), //o
    .io_sharedInputs_0_r_payload_resp    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]                 ), //o
    .io_sharedInputs_0_r_payload_last    (apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last                      ), //o
    .io_output_arw_valid                 (apbBridge_io_axi_arbiter_io_output_arw_valid                                   ), //o
    .io_output_arw_ready                 (apbBridge_io_axi_arw_ready                                                     ), //i
    .io_output_arw_payload_addr          (apbBridge_io_axi_arbiter_io_output_arw_payload_addr[27:0]                      ), //o
    .io_output_arw_payload_id            (apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]                         ), //o
    .io_output_arw_payload_len           (apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]                        ), //o
    .io_output_arw_payload_size          (apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]                       ), //o
    .io_output_arw_payload_burst         (apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]                      ), //o
    .io_output_arw_payload_write         (apbBridge_io_axi_arbiter_io_output_arw_payload_write                           ), //o
    .io_output_w_valid                   (apbBridge_io_axi_arbiter_io_output_w_valid                                     ), //o
    .io_output_w_ready                   (apbBridge_io_axi_w_ready                                                       ), //i
    .io_output_w_payload_data            (apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]                        ), //o
    .io_output_w_payload_strb            (apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]                         ), //o
    .io_output_w_payload_last            (apbBridge_io_axi_arbiter_io_output_w_payload_last                              ), //o
    .io_output_b_valid                   (apbBridge_io_axi_b_valid                                                       ), //i
    .io_output_b_ready                   (apbBridge_io_axi_arbiter_io_output_b_ready                                     ), //o
    .io_output_b_payload_id              (apbBridge_io_axi_b_payload_id[3:0]                                             ), //i
    .io_output_b_payload_resp            (apbBridge_io_axi_b_payload_resp[1:0]                                           ), //i
    .io_output_r_valid                   (apbBridge_io_axi_r_valid                                                       ), //i
    .io_output_r_ready                   (apbBridge_io_axi_arbiter_io_output_r_ready                                     ), //o
    .io_output_r_payload_data            (apbBridge_io_axi_r_payload_data[31:0]                                          ), //i
    .io_output_r_payload_id              (apbBridge_io_axi_r_payload_id[3:0]                                             ), //i
    .io_output_r_payload_resp            (apbBridge_io_axi_r_payload_resp[1:0]                                           ), //i
    .io_output_r_payload_last            (apbBridge_io_axi_r_payload_last                                                ), //i
    .clk                                 (clk                                                                            ), //i
    .reset                               (reset                                                                          )  //i
  );
  Axi4SharedArbiter_1 ram_io_axi_arbiter (
    .io_readInputs_0_ar_valid            (toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_valid                   ), //i
    .io_readInputs_0_ar_ready            (ram_io_axi_arbiter_io_readInputs_0_ar_ready                                    ), //o
    .io_readInputs_0_ar_payload_addr     (ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr[16:0]                       ), //i
    .io_readInputs_0_ar_payload_id       (_zz_io_readInputs_0_ar_payload_id[2:0]                                         ), //i
    .io_readInputs_0_ar_payload_len      (_zz_io_readInputs_0_ar_payload_len[7:0]                                        ), //i
    .io_readInputs_0_ar_payload_size     (toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_size[2:0]       ), //i
    .io_readInputs_0_ar_payload_burst    (ram_io_axi_arbiter_io_readInputs_0_ar_payload_burst[1:0]                       ), //i
    .io_readInputs_0_r_valid             (ram_io_axi_arbiter_io_readInputs_0_r_valid                                     ), //o
    .io_readInputs_0_r_ready             (cpu_io_iBUS_decoder_io_outputs_0_r_ready                                       ), //i
    .io_readInputs_0_r_payload_data      (ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]                        ), //o
    .io_readInputs_0_r_payload_id        (ram_io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]                           ), //o
    .io_readInputs_0_r_payload_resp      (ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]                         ), //o
    .io_readInputs_0_r_payload_last      (ram_io_axi_arbiter_io_readInputs_0_r_payload_last                              ), //o
    .io_sharedInputs_0_arw_valid         (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_valid            ), //i
    .io_sharedInputs_0_arw_ready         (ram_io_axi_arbiter_io_sharedInputs_0_arw_ready                                 ), //o
    .io_sharedInputs_0_arw_payload_addr  (ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[16:0]                    ), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id_1[2:0]                                    ), //i
    .io_sharedInputs_0_arw_payload_len   (_zz_io_sharedInputs_0_arw_payload_len_1[7:0]                                   ), //i
    .io_sharedInputs_0_arw_payload_size  (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_size[2:0]), //i
    .io_sharedInputs_0_arw_payload_burst (ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst[1:0]                    ), //i
    .io_sharedInputs_0_arw_payload_write (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_write    ), //i
    .io_sharedInputs_0_w_valid           (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_valid                                 ), //i
    .io_sharedInputs_0_w_ready           (ram_io_axi_arbiter_io_sharedInputs_0_w_ready                                   ), //o
    .io_sharedInputs_0_w_payload_data    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_data[31:0]                    ), //i
    .io_sharedInputs_0_w_payload_strb    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_strb[3:0]                     ), //i
    .io_sharedInputs_0_w_payload_last    (cpu_io_dBUS_decoder_io_sharedOutputs_0_w_payload_last                          ), //i
    .io_sharedInputs_0_b_valid           (ram_io_axi_arbiter_io_sharedInputs_0_b_valid                                   ), //o
    .io_sharedInputs_0_b_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_0_b_ready                                 ), //i
    .io_sharedInputs_0_b_payload_id      (ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]                         ), //o
    .io_sharedInputs_0_b_payload_resp    (ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]                       ), //o
    .io_sharedInputs_0_r_valid           (ram_io_axi_arbiter_io_sharedInputs_0_r_valid                                   ), //o
    .io_sharedInputs_0_r_ready           (cpu_io_dBUS_decoder_io_sharedOutputs_0_r_ready                                 ), //i
    .io_sharedInputs_0_r_payload_data    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]                      ), //o
    .io_sharedInputs_0_r_payload_id      (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]                         ), //o
    .io_sharedInputs_0_r_payload_resp    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]                       ), //o
    .io_sharedInputs_0_r_payload_last    (ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last                            ), //o
    .io_output_arw_valid                 (ram_io_axi_arbiter_io_output_arw_valid                                         ), //o
    .io_output_arw_ready                 (ram_io_axi_arw_ready                                                           ), //i
    .io_output_arw_payload_addr          (ram_io_axi_arbiter_io_output_arw_payload_addr[16:0]                            ), //o
    .io_output_arw_payload_id            (ram_io_axi_arbiter_io_output_arw_payload_id[3:0]                               ), //o
    .io_output_arw_payload_len           (ram_io_axi_arbiter_io_output_arw_payload_len[7:0]                              ), //o
    .io_output_arw_payload_size          (ram_io_axi_arbiter_io_output_arw_payload_size[2:0]                             ), //o
    .io_output_arw_payload_burst         (ram_io_axi_arbiter_io_output_arw_payload_burst[1:0]                            ), //o
    .io_output_arw_payload_write         (ram_io_axi_arbiter_io_output_arw_payload_write                                 ), //o
    .io_output_w_valid                   (ram_io_axi_arbiter_io_output_w_valid                                           ), //o
    .io_output_w_ready                   (ram_io_axi_w_ready                                                             ), //i
    .io_output_w_payload_data            (ram_io_axi_arbiter_io_output_w_payload_data[31:0]                              ), //o
    .io_output_w_payload_strb            (ram_io_axi_arbiter_io_output_w_payload_strb[3:0]                               ), //o
    .io_output_w_payload_last            (ram_io_axi_arbiter_io_output_w_payload_last                                    ), //o
    .io_output_b_valid                   (ram_io_axi_b_valid                                                             ), //i
    .io_output_b_ready                   (ram_io_axi_arbiter_io_output_b_ready                                           ), //o
    .io_output_b_payload_id              (ram_io_axi_b_payload_id[3:0]                                                   ), //i
    .io_output_b_payload_resp            (ram_io_axi_b_payload_resp[1:0]                                                 ), //i
    .io_output_r_valid                   (ram_io_axi_r_valid                                                             ), //i
    .io_output_r_ready                   (ram_io_axi_arbiter_io_output_r_ready                                           ), //o
    .io_output_r_payload_data            (ram_io_axi_r_payload_data[31:0]                                                ), //i
    .io_output_r_payload_id              (ram_io_axi_r_payload_id[3:0]                                                   ), //i
    .io_output_r_payload_resp            (ram_io_axi_r_payload_resp[1:0]                                                 ), //i
    .io_output_r_payload_last            (ram_io_axi_r_payload_last                                                      ), //i
    .clk                                 (clk                                                                            ), //i
    .reset                               (reset                                                                          )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR      (apbBridge_io_apb_PADDR[27:0]         ), //i
    .io_input_PSEL       (apbBridge_io_apb_PSEL                ), //i
    .io_input_PENABLE    (apbBridge_io_apb_PENABLE             ), //i
    .io_input_PREADY     (io_apb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (apbBridge_io_apb_PWRITE              ), //i
    .io_input_PWDATA     (apbBridge_io_apb_PWDATA[31:0]        ), //i
    .io_input_PRDATA     (io_apb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (io_apb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (io_apb_decoder_io_output_PADDR[27:0] ), //o
    .io_output_PSEL      (io_apb_decoder_io_output_PSEL[1:0]   ), //o
    .io_output_PENABLE   (io_apb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY         ), //i
    .io_output_PWRITE    (io_apb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (io_apb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]   ), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR      )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (io_apb_decoder_io_output_PADDR[27:0]  ), //i
    .io_input_PSEL          (io_apb_decoder_io_output_PSEL[1:0]    ), //i
    .io_input_PENABLE       (io_apb_decoder_io_output_PENABLE      ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY          ), //o
    .io_input_PWRITE        (io_apb_decoder_io_output_PWRITE       ), //i
    .io_input_PWDATA        (io_apb_decoder_io_output_PWDATA[31:0] ), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]    ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR       ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[27:0] ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //o
    .io_outputs_0_PREADY    (uart0_Ctrl_io_apb_PREADY              ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //o
    .io_outputs_0_PRDATA    (uart0_Ctrl_io_apb_PRDATA[31:0]        ), //i
    .io_outputs_0_PSLVERROR (apb3Router_1_io_outputs_0_PSLVERROR   ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[27:0] ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //o
    .io_outputs_1_PREADY    (timerCtrl_io_apb_PREADY               ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //o
    .io_outputs_1_PRDATA    (timerCtrl_io_apb_PRDATA[31:0]         ), //i
    .io_outputs_1_PSLVERROR (timerCtrl_io_apb_PSLVERROR            ), //i
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_fire = (toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_valid && toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_ready);
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_valid = toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_rValid;
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_addr = cpu_io_iBUS_decoder_io_outputs_0_ar_payload_addr;
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_size = cpu_io_iBUS_decoder_io_outputs_0_ar_payload_size;
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_cache = cpu_io_iBUS_decoder_io_outputs_0_ar_payload_cache;
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_prot = cpu_io_iBUS_decoder_io_outputs_0_ar_payload_prot;
  assign toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_ready = ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_valid = (cpu_io_iBUS_ar_valid || (! toplevel_cpu_io_iBUS_ar_rValidN));
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_payload_addr = (toplevel_cpu_io_iBUS_ar_rValidN ? cpu_io_iBUS_ar_payload_addr : toplevel_cpu_io_iBUS_ar_rData_addr);
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_payload_size = (toplevel_cpu_io_iBUS_ar_rValidN ? cpu_io_iBUS_ar_payload_size : toplevel_cpu_io_iBUS_ar_rData_size);
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_payload_cache = (toplevel_cpu_io_iBUS_ar_rValidN ? cpu_io_iBUS_ar_payload_cache : toplevel_cpu_io_iBUS_ar_rData_cache);
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_payload_prot = (toplevel_cpu_io_iBUS_ar_rValidN ? cpu_io_iBUS_ar_payload_prot : toplevel_cpu_io_iBUS_ar_rData_prot);
  assign toplevel_cpu_io_iBUS_ar_s2mPipe_ready = cpu_io_iBUS_decoder_io_input_ar_ready;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_fire = (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_valid && toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_ready);
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_valid = toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_rValid;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr = cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_addr;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_size = cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_size;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_cache = cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_cache;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_prot = cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_prot;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_write = cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_payload_write;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_ready = ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_fire = (toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_valid && toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_ready);
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_valid = toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_rValid;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr = cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_addr;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_size = cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_size;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_cache = cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_cache;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_prot = cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_prot;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_write = cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_payload_write;
  assign toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_ready = apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_valid = (cpu_io_dBUS_arw_valid || (! toplevel_cpu_io_dBUS_arw_rValidN));
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_payload_addr = (toplevel_cpu_io_dBUS_arw_rValidN ? cpu_io_dBUS_arw_payload_addr : toplevel_cpu_io_dBUS_arw_rData_addr);
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_payload_size = (toplevel_cpu_io_dBUS_arw_rValidN ? cpu_io_dBUS_arw_payload_size : toplevel_cpu_io_dBUS_arw_rData_size);
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_payload_cache = (toplevel_cpu_io_dBUS_arw_rValidN ? cpu_io_dBUS_arw_payload_cache : toplevel_cpu_io_dBUS_arw_rData_cache);
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_payload_prot = (toplevel_cpu_io_dBUS_arw_rValidN ? cpu_io_dBUS_arw_payload_prot : toplevel_cpu_io_dBUS_arw_rData_prot);
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_payload_write = (toplevel_cpu_io_dBUS_arw_rValidN ? cpu_io_dBUS_arw_payload_write : toplevel_cpu_io_dBUS_arw_rData_write);
  assign toplevel_cpu_io_dBUS_arw_s2mPipe_ready = cpu_io_dBUS_decoder_io_input_arw_ready;
  assign toplevel_cpu_io_dBUS_w_s2mPipe_valid = (cpu_io_dBUS_w_valid || (! toplevel_cpu_io_dBUS_w_rValidN));
  assign toplevel_cpu_io_dBUS_w_s2mPipe_payload_data = (toplevel_cpu_io_dBUS_w_rValidN ? cpu_io_dBUS_w_payload_data : toplevel_cpu_io_dBUS_w_rData_data);
  assign toplevel_cpu_io_dBUS_w_s2mPipe_payload_strb = (toplevel_cpu_io_dBUS_w_rValidN ? cpu_io_dBUS_w_payload_strb : toplevel_cpu_io_dBUS_w_rData_strb);
  assign toplevel_cpu_io_dBUS_w_s2mPipe_payload_last = (toplevel_cpu_io_dBUS_w_rValidN ? cpu_io_dBUS_w_payload_last : toplevel_cpu_io_dBUS_w_rData_last);
  assign toplevel_cpu_io_dBUS_w_s2mPipe_ready = cpu_io_dBUS_decoder_io_input_w_ready;
  always @(*) begin
    cpu_io_dBUS_decoder_io_input_r_ready = toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_ready;
    if(when_Stream_l369) begin
      cpu_io_dBUS_decoder_io_input_r_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_valid);
  assign toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_valid = toplevel_cpu_io_dBUS_decoder_io_input_r_rValid;
  assign toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_data = toplevel_cpu_io_dBUS_decoder_io_input_r_rData_data;
  assign toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_resp = toplevel_cpu_io_dBUS_decoder_io_input_r_rData_resp;
  assign toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_payload_last = toplevel_cpu_io_dBUS_decoder_io_input_r_rData_last;
  assign toplevel_cpu_io_dBUS_decoder_io_input_r_m2sPipe_ready = cpu_io_dBUS_r_ready;
  assign apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr[27:0];
  assign _zz_io_sharedInputs_0_arw_payload_id[3 : 0] = 4'b0000;
  assign _zz_io_sharedInputs_0_arw_payload_len[7 : 0] = 8'h00;
  assign apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst = 2'b01;
  assign ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr = toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_payload_addr[16:0];
  assign _zz_io_readInputs_0_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_readInputs_0_ar_payload_len[7 : 0] = 8'h00;
  assign ram_io_axi_arbiter_io_readInputs_0_ar_payload_burst = 2'b01;
  assign ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr[16:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_1[2 : 0] = 3'b000;
  assign _zz_io_sharedInputs_0_arw_payload_len_1[7 : 0] = 8'h00;
  assign ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst = 2'b01;
  assign uart0_Ctrl_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[4:0];
  assign apb3Router_1_io_outputs_0_PSLVERROR = 1'b0;
  assign timerCtrl_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[7:0];
  assign io_uart_txd = uart0_Ctrl_io_uart_txd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_rValid <= 1'b0;
      toplevel_cpu_io_iBUS_ar_rValidN <= 1'b1;
      toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_rValid <= 1'b0;
      toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_rValid <= 1'b0;
      toplevel_cpu_io_dBUS_arw_rValidN <= 1'b1;
      toplevel_cpu_io_dBUS_w_rValidN <= 1'b1;
      toplevel_cpu_io_dBUS_decoder_io_input_r_rValid <= 1'b0;
    end else begin
      if(cpu_io_iBUS_decoder_io_outputs_0_ar_valid) begin
        toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_validPipe_fire) begin
        toplevel_cpu_io_iBUS_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(cpu_io_iBUS_ar_valid) begin
        toplevel_cpu_io_iBUS_ar_rValidN <= 1'b0;
      end
      if(toplevel_cpu_io_iBUS_ar_s2mPipe_ready) begin
        toplevel_cpu_io_iBUS_ar_rValidN <= 1'b1;
      end
      if(cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_valid) begin
        toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_rValid <= 1'b1;
      end
      if(toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_validPipe_fire) begin
        toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_0_arw_rValid <= 1'b0;
      end
      if(cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_valid) begin
        toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_rValid <= 1'b1;
      end
      if(toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_validPipe_fire) begin
        toplevel_cpu_io_dBUS_decoder_io_sharedOutputs_1_arw_rValid <= 1'b0;
      end
      if(cpu_io_dBUS_arw_valid) begin
        toplevel_cpu_io_dBUS_arw_rValidN <= 1'b0;
      end
      if(toplevel_cpu_io_dBUS_arw_s2mPipe_ready) begin
        toplevel_cpu_io_dBUS_arw_rValidN <= 1'b1;
      end
      if(cpu_io_dBUS_w_valid) begin
        toplevel_cpu_io_dBUS_w_rValidN <= 1'b0;
      end
      if(toplevel_cpu_io_dBUS_w_s2mPipe_ready) begin
        toplevel_cpu_io_dBUS_w_rValidN <= 1'b1;
      end
      if(cpu_io_dBUS_decoder_io_input_r_ready) begin
        toplevel_cpu_io_dBUS_decoder_io_input_r_rValid <= cpu_io_dBUS_decoder_io_input_r_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(toplevel_cpu_io_iBUS_ar_rValidN) begin
      toplevel_cpu_io_iBUS_ar_rData_addr <= cpu_io_iBUS_ar_payload_addr;
      toplevel_cpu_io_iBUS_ar_rData_size <= cpu_io_iBUS_ar_payload_size;
      toplevel_cpu_io_iBUS_ar_rData_cache <= cpu_io_iBUS_ar_payload_cache;
      toplevel_cpu_io_iBUS_ar_rData_prot <= cpu_io_iBUS_ar_payload_prot;
    end
    if(toplevel_cpu_io_dBUS_arw_rValidN) begin
      toplevel_cpu_io_dBUS_arw_rData_addr <= cpu_io_dBUS_arw_payload_addr;
      toplevel_cpu_io_dBUS_arw_rData_size <= cpu_io_dBUS_arw_payload_size;
      toplevel_cpu_io_dBUS_arw_rData_cache <= cpu_io_dBUS_arw_payload_cache;
      toplevel_cpu_io_dBUS_arw_rData_prot <= cpu_io_dBUS_arw_payload_prot;
      toplevel_cpu_io_dBUS_arw_rData_write <= cpu_io_dBUS_arw_payload_write;
    end
    if(toplevel_cpu_io_dBUS_w_rValidN) begin
      toplevel_cpu_io_dBUS_w_rData_data <= cpu_io_dBUS_w_payload_data;
      toplevel_cpu_io_dBUS_w_rData_strb <= cpu_io_dBUS_w_payload_strb;
      toplevel_cpu_io_dBUS_w_rData_last <= cpu_io_dBUS_w_payload_last;
    end
    if(cpu_io_dBUS_decoder_io_input_r_ready) begin
      toplevel_cpu_io_dBUS_decoder_io_input_r_rData_data <= cpu_io_dBUS_decoder_io_input_r_payload_data;
      toplevel_cpu_io_dBUS_decoder_io_input_r_rData_resp <= cpu_io_dBUS_decoder_io_input_r_payload_resp;
      toplevel_cpu_io_dBUS_decoder_io_input_r_rData_last <= cpu_io_dBUS_decoder_io_input_r_payload_last;
    end
  end


endmodule

module Apb3Router (
  input  wire [27:0]   io_input_PADDR,
  input  wire [1:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output wire          io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output wire          io_input_PSLVERROR,
  output wire [27:0]   io_outputs_0_PADDR,
  output wire [0:0]    io_outputs_0_PSEL,
  output wire          io_outputs_0_PENABLE,
  input  wire          io_outputs_0_PREADY,
  output wire          io_outputs_0_PWRITE,
  output wire [31:0]   io_outputs_0_PWDATA,
  input  wire [31:0]   io_outputs_0_PRDATA,
  input  wire          io_outputs_0_PSLVERROR,
  output wire [27:0]   io_outputs_1_PADDR,
  output wire [0:0]    io_outputs_1_PSEL,
  output wire          io_outputs_1_PENABLE,
  input  wire          io_outputs_1_PREADY,
  output wire          io_outputs_1_PWRITE,
  output wire [31:0]   io_outputs_1_PWDATA,
  input  wire [31:0]   io_outputs_1_PRDATA,
  input  wire          io_outputs_1_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  reg        [0:0]    selIndex;

  always @(*) begin
    case(selIndex)
      1'b0 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[1];
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= _zz_selIndex;
  end


endmodule

module Apb3Decoder (
  input  wire [27:0]   io_input_PADDR,
  input  wire [0:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output reg           io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output reg           io_input_PSLVERROR,
  output wire [27:0]   io_output_PADDR,
  output reg  [1:0]    io_output_PSEL,
  output wire          io_output_PENABLE,
  input  wire          io_output_PREADY,
  output wire          io_output_PWRITE,
  output wire [31:0]   io_output_PWDATA,
  input  wire [31:0]   io_output_PRDATA,
  input  wire          io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 28'h0000fff)) == 28'h0010000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 28'h0000fff)) == 28'h0020000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 2'b00));

endmodule

module Axi4SharedArbiter_1 (
  input  wire          io_readInputs_0_ar_valid,
  output wire          io_readInputs_0_ar_ready,
  input  wire [16:0]   io_readInputs_0_ar_payload_addr,
  input  wire [2:0]    io_readInputs_0_ar_payload_id,
  input  wire [7:0]    io_readInputs_0_ar_payload_len,
  input  wire [2:0]    io_readInputs_0_ar_payload_size,
  input  wire [1:0]    io_readInputs_0_ar_payload_burst,
  output wire          io_readInputs_0_r_valid,
  input  wire          io_readInputs_0_r_ready,
  output wire [31:0]   io_readInputs_0_r_payload_data,
  output wire [2:0]    io_readInputs_0_r_payload_id,
  output wire [1:0]    io_readInputs_0_r_payload_resp,
  output wire          io_readInputs_0_r_payload_last,
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [16:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [2:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [2:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [16:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [16:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [3:0]    _zz_io_output_arw_payload_id_1;
  wire       [2:0]    _zz_io_output_arw_payload_id_2;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [16:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [16:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [16:0]   cmdOutputFork_payload_addr;
  wire       [2:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [16:0]   cmdRouteFork_payload_addr;
  wire       [2:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                _zz_io_output_arw_payload_id;
  wire                when_Stream_l439;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [16:0]   cmdRouteFork_thrown_payload_addr;
  wire       [2:0]    cmdRouteFork_thrown_payload_id;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_io_output_arw_payload_id_2 = cmdOutputFork_payload_id;
  assign _zz_io_output_arw_payload_id_1 = {1'd0, _zz_io_output_arw_payload_id_2};
  StreamArbiter cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[16:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[2:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_inputs_1_valid         (inputsCmd_1_valid                      ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (inputsCmd_1_payload_addr[16:0]         ), //i
    .io_inputs_1_payload_id    (inputsCmd_1_payload_id[2:0]            ), //i
    .io_inputs_1_payload_len   (inputsCmd_1_payload_len[7:0]           ), //i
    .io_inputs_1_payload_size  (inputsCmd_1_payload_size[2:0]          ), //i
    .io_inputs_1_payload_burst (inputsCmd_1_payload_burst[1:0]         ), //i
    .io_inputs_1_payload_write (inputsCmd_1_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[16:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[2:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (cmdRouteFork_thrown_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                                     ), //i
    .reset           (reset                                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_readInputs_0_r_ready;
      default : _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? _zz_io_output_arw_payload_id_1 : {_zz_io_output_arw_payload_id,cmdOutputFork_payload_id});
  assign when_Stream_l439 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l439) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l439) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_io_output_r_ready;
  assign cmdRouteFork_thrown_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        ram_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [27:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [3:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [3:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [27:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [27:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [27:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [27:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [27:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l439;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [27:0]   cmdRouteFork_thrown_payload_addr;
  wire       [3:0]    cmdRouteFork_thrown_payload_id;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[27:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[3:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[27:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (cmdRouteFork_thrown_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                                     ), //i
    .reset           (reset                                                   )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l439 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l439) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l439) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  assign cmdRouteFork_thrown_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input  wire          io_input_arw_valid,
  output wire          io_input_arw_ready,
  input  wire [31:0]   io_input_arw_payload_addr,
  input  wire [2:0]    io_input_arw_payload_size,
  input  wire [3:0]    io_input_arw_payload_cache,
  input  wire [2:0]    io_input_arw_payload_prot,
  input  wire          io_input_arw_payload_write,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_sharedOutputs_0_arw_valid,
  input  wire          io_sharedOutputs_0_arw_ready,
  output wire [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output wire          io_sharedOutputs_0_arw_payload_write,
  output wire          io_sharedOutputs_0_w_valid,
  input  wire          io_sharedOutputs_0_w_ready,
  output wire [31:0]   io_sharedOutputs_0_w_payload_data,
  output wire [3:0]    io_sharedOutputs_0_w_payload_strb,
  output wire          io_sharedOutputs_0_w_payload_last,
  input  wire          io_sharedOutputs_0_b_valid,
  output wire          io_sharedOutputs_0_b_ready,
  input  wire [1:0]    io_sharedOutputs_0_b_payload_resp,
  input  wire          io_sharedOutputs_0_r_valid,
  output wire          io_sharedOutputs_0_r_ready,
  input  wire [31:0]   io_sharedOutputs_0_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_0_r_payload_resp,
  input  wire          io_sharedOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_1_arw_valid,
  input  wire          io_sharedOutputs_1_arw_ready,
  output wire [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output wire          io_sharedOutputs_1_arw_payload_write,
  output wire          io_sharedOutputs_1_w_valid,
  input  wire          io_sharedOutputs_1_w_ready,
  output wire [31:0]   io_sharedOutputs_1_w_payload_data,
  output wire [3:0]    io_sharedOutputs_1_w_payload_strb,
  output wire          io_sharedOutputs_1_w_payload_last,
  input  wire          io_sharedOutputs_1_b_valid,
  output wire          io_sharedOutputs_1_b_ready,
  input  wire [1:0]    io_sharedOutputs_1_b_payload_resp,
  input  wire          io_sharedOutputs_1_r_valid,
  output wire          io_sharedOutputs_1_r_ready,
  input  wire [31:0]   io_sharedOutputs_1_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_1_r_payload_resp,
  input  wire          io_sharedOutputs_1_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire       [1:0]    _zz__zz_writeRspIndex;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  wire       [1:0]    _zz__zz_readRspIndex;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l754;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l694;
  wire                io_input_w_fire;
  wire                when_Utils_l697;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [1:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [1:0]    _zz_io_sharedOutputs_0_w_valid;
  wire                _zz_writeRspIndex;
  wire       [0:0]    writeRspIndex;
  wire                _zz_readRspIndex;
  wire       [0:0]    readRspIndex;

  assign _zz__zz_writeRspIndex = pendingSels[1 : 0];
  assign _zz__zz_readRspIndex = pendingSels[1 : 0];
  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid         (errorSlave_io_axi_arw_valid           ), //i
    .io_axi_arw_ready         (errorSlave_io_axi_arw_ready           ), //o
    .io_axi_arw_payload_addr  (io_input_arw_payload_addr[31:0]       ), //i
    .io_axi_arw_payload_size  (io_input_arw_payload_size[2:0]        ), //i
    .io_axi_arw_payload_cache (io_input_arw_payload_cache[3:0]       ), //i
    .io_axi_arw_payload_prot  (io_input_arw_payload_prot[2:0]        ), //i
    .io_axi_arw_payload_write (io_input_arw_payload_write            ), //i
    .io_axi_w_valid           (errorSlave_io_axi_w_valid             ), //i
    .io_axi_w_ready           (errorSlave_io_axi_w_ready             ), //o
    .io_axi_w_payload_data    (io_input_w_payload_data[31:0]         ), //i
    .io_axi_w_payload_strb    (io_input_w_payload_strb[3:0]          ), //i
    .io_axi_w_payload_last    (io_input_w_payload_last               ), //i
    .io_axi_b_valid           (errorSlave_io_axi_b_valid             ), //o
    .io_axi_b_ready           (io_input_b_ready                      ), //i
    .io_axi_b_payload_resp    (errorSlave_io_axi_b_payload_resp[1:0] ), //o
    .io_axi_r_valid           (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready           (io_input_r_ready                      ), //i
    .io_axi_r_payload_data    (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp    (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last    (errorSlave_io_axi_r_payload_last      ), //o
    .clk                      (clk                                   ), //i
    .reset                    (reset                                 )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_input_b_payload_resp = io_sharedOutputs_0_b_payload_resp;
      default : _zz_io_input_b_payload_resp = io_sharedOutputs_1_b_payload_resp;
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l754) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l754 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l694 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l697 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l694) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l723 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {((io_input_arw_payload_addr & (~ 32'h0fffffff)) == 32'hf0000000),((io_input_arw_payload_addr & (~ 32'h0001ffff)) == 32'h80000000)};
  assign decodedCmdError = (decodedCmdSels == 2'b00);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_1_arw_ready,io_sharedOutputs_0_arw_ready})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[1 : 0];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|(pendingSels[1 : 0] & {io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[1 : 0];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = _zz__zz_writeRspIndex[1];
  assign writeRspIndex = _zz_writeRspIndex;
  assign io_input_b_valid = ((|{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = _zz__zz_readRspIndex[1];
  assign readRspIndex = _zz_readRspIndex;
  assign io_input_r_valid = ((|{io_sharedOutputs_1_r_valid,io_sharedOutputs_0_r_valid}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 2'b00;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [2:0]    io_input_ar_payload_size,
  input  wire [3:0]    io_input_ar_payload_cache,
  input  wire [2:0]    io_input_ar_payload_prot,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [2:0]    io_outputs_0_ar_payload_size,
  output wire [3:0]    io_outputs_0_ar_payload_cache,
  output wire [2:0]    io_outputs_0_ar_payload_prot,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l697;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_ar_payload_size  (io_input_ar_payload_size[2:0]         ), //i
    .io_axi_ar_payload_cache (io_input_ar_payload_cache[3:0]        ), //i
    .io_axi_ar_payload_prot  (io_input_ar_payload_prot[2:0]         ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready          (io_input_r_ready                      ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last      ), //o
    .clk                     (clk                                   ), //i
    .reset                   (reset                                 )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l697 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l723 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_ar_payload_addr & (~ 32'h0001ffff)) == 32'h80000000) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & io_outputs_0_ar_ready)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  always @(*) begin
    io_input_r_valid = (|io_outputs_0_r_valid);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = io_outputs_0_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module PinsecTimerCtrl (
  input  wire [7:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR,
  input  wire          io_external_clear,
  input  wire          io_external_tick,
  output wire          io_interrupt,
  input  wire          clk,
  input  wire          reset
);

  wire                timerA_io_tick;
  wire                timerA_io_clear;
  wire                timerB_io_tick;
  wire                timerB_io_clear;
  wire                timerC_io_tick;
  wire                timerC_io_clear;
  wire                timerD_io_tick;
  wire                timerD_io_clear;
  reg        [3:0]    interruptCtrl_1_io_inputs;
  reg        [3:0]    interruptCtrl_1_io_clears;
  wire                io_external_buffercc_io_dataOut_clear;
  wire                io_external_buffercc_io_dataOut_tick;
  wire                prescaler_1_io_overflow;
  wire                timerA_io_full;
  wire       [31:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [15:0]   timerB_io_value;
  wire                timerC_io_full;
  wire       [15:0]   timerC_io_value;
  wire                timerD_io_full;
  wire       [15:0]   timerD_io_value;
  wire       [3:0]    interruptCtrl_1_io_pendings;
  wire                external_clear;
  wire                external_tick;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [15:0]   _zz_io_limit;
  reg                 _zz_io_clear;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [31:0]   timerCtrl_timerA_io_limit_driver;
  reg                 when_Timer_l40;
  reg                 when_Timer_l44;
  reg        [2:0]    timerBBridge_ticksEnable;
  reg        [1:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [15:0]   timerCtrl_timerB_io_limit_driver;
  reg                 when_Timer_l40_1;
  reg                 when_Timer_l44_1;
  reg        [2:0]    timerCBridge_ticksEnable;
  reg        [1:0]    timerCBridge_clearsEnable;
  reg                 timerCBridge_busClearing;
  reg        [15:0]   timerCtrl_timerC_io_limit_driver;
  reg                 when_Timer_l40_2;
  reg                 when_Timer_l44_2;
  reg        [2:0]    timerDBridge_ticksEnable;
  reg        [1:0]    timerDBridge_clearsEnable;
  reg                 timerDBridge_busClearing;
  reg        [15:0]   timerCtrl_timerD_io_limit_driver;
  reg                 when_Timer_l40_3;
  reg                 when_Timer_l44_3;
  reg        [3:0]    timerCtrl_interruptCtrl_1_io_masks_driver;

  BufferCC io_external_buffercc (
    .io_dataIn_clear  (io_external_clear                    ), //i
    .io_dataIn_tick   (io_external_tick                     ), //i
    .io_dataOut_clear (io_external_buffercc_io_dataOut_clear), //o
    .io_dataOut_tick  (io_external_buffercc_io_dataOut_tick ), //o
    .clk              (clk                                  ), //i
    .reset            (reset                                )  //i
  );
  Prescaler prescaler_1 (
    .io_clear    (_zz_io_clear           ), //i
    .io_limit    (_zz_io_limit[15:0]     ), //i
    .io_overflow (prescaler_1_io_overflow), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  Timer timerA (
    .io_tick  (timerA_io_tick                        ), //i
    .io_clear (timerA_io_clear                       ), //i
    .io_limit (timerCtrl_timerA_io_limit_driver[31:0]), //i
    .io_full  (timerA_io_full                        ), //o
    .io_value (timerA_io_value[31:0]                 ), //o
    .clk      (clk                                   ), //i
    .reset    (reset                                 )  //i
  );
  Timer_1 timerB (
    .io_tick  (timerB_io_tick                        ), //i
    .io_clear (timerB_io_clear                       ), //i
    .io_limit (timerCtrl_timerB_io_limit_driver[15:0]), //i
    .io_full  (timerB_io_full                        ), //o
    .io_value (timerB_io_value[15:0]                 ), //o
    .clk      (clk                                   ), //i
    .reset    (reset                                 )  //i
  );
  Timer_1 timerC (
    .io_tick  (timerC_io_tick                        ), //i
    .io_clear (timerC_io_clear                       ), //i
    .io_limit (timerCtrl_timerC_io_limit_driver[15:0]), //i
    .io_full  (timerC_io_full                        ), //o
    .io_value (timerC_io_value[15:0]                 ), //o
    .clk      (clk                                   ), //i
    .reset    (reset                                 )  //i
  );
  Timer_1 timerD (
    .io_tick  (timerD_io_tick                        ), //i
    .io_clear (timerD_io_clear                       ), //i
    .io_limit (timerCtrl_timerD_io_limit_driver[15:0]), //i
    .io_full  (timerD_io_full                        ), //o
    .io_value (timerD_io_value[15:0]                 ), //o
    .clk      (clk                                   ), //i
    .reset    (reset                                 )  //i
  );
  InterruptCtrl interruptCtrl_1 (
    .io_inputs   (interruptCtrl_1_io_inputs[3:0]                ), //i
    .io_clears   (interruptCtrl_1_io_clears[3:0]                ), //i
    .io_masks    (timerCtrl_interruptCtrl_1_io_masks_driver[3:0]), //i
    .io_pendings (interruptCtrl_1_io_pendings[3:0]              ), //o
    .clk         (clk                                           ), //i
    .reset       (reset                                         )  //i
  );
  assign external_clear = io_external_buffercc_io_dataOut_clear;
  assign external_tick = io_external_buffercc_io_dataOut_tick;
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h00000000;
    case(io_apb_PADDR)
      8'h00 : begin
        io_apb_PRDATA[15 : 0] = _zz_io_limit;
      end
      8'h40 : begin
        io_apb_PRDATA[1 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'h44 : begin
        io_apb_PRDATA[31 : 0] = timerCtrl_timerA_io_limit_driver;
      end
      8'h48 : begin
        io_apb_PRDATA[31 : 0] = timerA_io_value;
      end
      8'h50 : begin
        io_apb_PRDATA[2 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerBBridge_clearsEnable;
      end
      8'h54 : begin
        io_apb_PRDATA[15 : 0] = timerCtrl_timerB_io_limit_driver;
      end
      8'h58 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      8'h60 : begin
        io_apb_PRDATA[2 : 0] = timerCBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerCBridge_clearsEnable;
      end
      8'h64 : begin
        io_apb_PRDATA[15 : 0] = timerCtrl_timerC_io_limit_driver;
      end
      8'h68 : begin
        io_apb_PRDATA[15 : 0] = timerC_io_value;
      end
      8'h70 : begin
        io_apb_PRDATA[2 : 0] = timerDBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerDBridge_clearsEnable;
      end
      8'h74 : begin
        io_apb_PRDATA[15 : 0] = timerCtrl_timerD_io_limit_driver;
      end
      8'h78 : begin
        io_apb_PRDATA[15 : 0] = timerD_io_value;
      end
      8'h10 : begin
        io_apb_PRDATA[3 : 0] = interruptCtrl_1_io_pendings;
      end
      8'h14 : begin
        io_apb_PRDATA[3 : 0] = timerCtrl_interruptCtrl_1_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    _zz_io_clear = 1'b0;
    case(io_apb_PADDR)
      8'h00 : begin
        if(busCtrl_doWrite) begin
          _zz_io_clear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    timerABridge_busClearing = 1'b0;
    if(when_Timer_l40) begin
      timerABridge_busClearing = 1'b1;
    end
    if(when_Timer_l44) begin
      timerABridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40 = 1'b0;
    case(io_apb_PADDR)
      8'h44 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44 = 1'b0;
    case(io_apb_PADDR)
      8'h48 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerA_io_clear = ((|(timerABridge_clearsEnable & timerA_io_full)) || timerABridge_busClearing);
  assign timerA_io_tick = (|(timerABridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    timerBBridge_busClearing = 1'b0;
    if(when_Timer_l40_1) begin
      timerBBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_1) begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_1 = 1'b0;
    case(io_apb_PADDR)
      8'h54 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_1 = 1'b0;
    case(io_apb_PADDR)
      8'h58 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerB_io_clear = ((|(timerBBridge_clearsEnable & {external_clear,timerB_io_full})) || timerBBridge_busClearing);
  assign timerB_io_tick = (|(timerBBridge_ticksEnable & {external_tick,{prescaler_1_io_overflow,1'b1}}));
  always @(*) begin
    timerCBridge_busClearing = 1'b0;
    if(when_Timer_l40_2) begin
      timerCBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_2) begin
      timerCBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_2 = 1'b0;
    case(io_apb_PADDR)
      8'h64 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_2 = 1'b0;
    case(io_apb_PADDR)
      8'h68 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerC_io_clear = ((|(timerCBridge_clearsEnable & {external_clear,timerC_io_full})) || timerCBridge_busClearing);
  assign timerC_io_tick = (|(timerCBridge_ticksEnable & {external_tick,{prescaler_1_io_overflow,1'b1}}));
  always @(*) begin
    timerDBridge_busClearing = 1'b0;
    if(when_Timer_l40_3) begin
      timerDBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_3) begin
      timerDBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_3 = 1'b0;
    case(io_apb_PADDR)
      8'h74 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_3 = 1'b0;
    case(io_apb_PADDR)
      8'h78 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerD_io_clear = ((|(timerDBridge_clearsEnable & {external_clear,timerD_io_full})) || timerDBridge_busClearing);
  assign timerD_io_tick = (|(timerDBridge_ticksEnable & {external_tick,{prescaler_1_io_overflow,1'b1}}));
  always @(*) begin
    interruptCtrl_1_io_clears = 4'b0000;
    case(io_apb_PADDR)
      8'h10 : begin
        if(busCtrl_doWrite) begin
          interruptCtrl_1_io_clears = io_apb_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    interruptCtrl_1_io_inputs[0] = timerA_io_full;
    interruptCtrl_1_io_inputs[1] = timerB_io_full;
    interruptCtrl_1_io_inputs[2] = timerC_io_full;
    interruptCtrl_1_io_inputs[3] = timerD_io_full;
  end

  assign io_interrupt = (|interruptCtrl_1_io_pendings);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      timerABridge_ticksEnable <= 2'b00;
      timerABridge_clearsEnable <= 1'b0;
      timerBBridge_ticksEnable <= 3'b000;
      timerBBridge_clearsEnable <= 2'b00;
      timerCBridge_ticksEnable <= 3'b000;
      timerCBridge_clearsEnable <= 2'b00;
      timerDBridge_ticksEnable <= 3'b000;
      timerDBridge_clearsEnable <= 2'b00;
      timerCtrl_interruptCtrl_1_io_masks_driver <= 4'b0000;
    end else begin
      case(io_apb_PADDR)
        8'h40 : begin
          if(busCtrl_doWrite) begin
            timerABridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h50 : begin
          if(busCtrl_doWrite) begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'h60 : begin
          if(busCtrl_doWrite) begin
            timerCBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerCBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'h70 : begin
          if(busCtrl_doWrite) begin
            timerDBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerDBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'h14 : begin
          if(busCtrl_doWrite) begin
            timerCtrl_interruptCtrl_1_io_masks_driver <= io_apb_PWDATA[3 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(io_apb_PADDR)
      8'h00 : begin
        if(busCtrl_doWrite) begin
          _zz_io_limit <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h44 : begin
        if(busCtrl_doWrite) begin
          timerCtrl_timerA_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'h54 : begin
        if(busCtrl_doWrite) begin
          timerCtrl_timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h64 : begin
        if(busCtrl_doWrite) begin
          timerCtrl_timerC_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h74 : begin
        if(busCtrl_doWrite) begin
          timerCtrl_timerD_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Axi4SharedOnChipRam (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [16:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   _zz_ram_port0;
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [16:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [16:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [16:0]   Axi4Incr_result;
  wire       [4:0]    Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l322;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [16:0]   stage0_payload_fragment_addr;
  wire       [3:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [14:0]   _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [31:0]   _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [16:0]   stage1_payload_fragment_addr;
  wire       [3:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [16:0]   stage0_rData_fragment_addr;
  reg        [3:0]    stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l369;
  reg [7:0] ram_symbol0 [0:32767];
  reg [7:0] ram_symbol1 [0:32767];
  reg [7:0] ram_symbol2 [0:32767];
  reg [7:0] ram_symbol3 [0:32767];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  initial begin
    $readmemb("axi_nina_riscv.v_toplevel_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("axi_nina_riscv.v_toplevel_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("axi_nina_riscv.v_toplevel_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("axi_nina_riscv.v_toplevel_ram_ram_symbol3.bin",ram_symbol3);
  end
  always @(*) begin
    _zz_ram_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge clk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge clk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      3'b001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      3'b010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      3'b011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      3'b100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[16 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (unburstify_buffer_transaction_addr[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      unburstify_result_payload_last = 1'b1;
      if(when_Axi4Channel_l322) begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l322 = (io_axi_arw_payload_len != 8'h00);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[16 : 2];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = _zz_ram_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l369) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(when_Axi4Channel_l322) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(when_Axi4Channel_l322) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

module Axi4SharedToApb3Bridge (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [27:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output reg           io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output reg           io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output reg           io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  output wire [27:0]   io_apb_PADDR,
  output reg  [0:0]    io_apb_PSEL,
  output reg           io_apb_PENABLE,
  input  wire          io_apb_PREADY,
  output wire          io_apb_PWRITE,
  output wire [31:0]   io_apb_PWDATA,
  input  wire [31:0]   io_apb_PRDATA,
  input  wire          io_apb_PSLVERROR,
  input  wire          clk,
  input  wire          reset
);
  localparam Axi4ToApb3BridgePhase_SETUP = 2'd0;
  localparam Axi4ToApb3BridgePhase_ACCESS_1 = 2'd1;
  localparam Axi4ToApb3BridgePhase_RESPONSE = 2'd2;

  reg        [1:0]    phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  wire                when_Axi4SharedToApb3Bridge_l91;
  wire                when_Axi4SharedToApb3Bridge_l97;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : phase_string = "SETUP   ";
      Axi4ToApb3BridgePhase_ACCESS_1 : phase_string = "ACCESS_1";
      Axi4ToApb3BridgePhase_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_arw_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_w_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(write) begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(!write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          io_apb_PSEL[0] = 1'b1;
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_apb_PSEL[0] = 1'b0;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Axi4SharedToApb3Bridge_l91 = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  assign when_Axi4SharedToApb3Bridge_l97 = (io_axi_arw_payload_write && (io_axi_w_payload_strb == 4'b0000));
  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      phase <= Axi4ToApb3BridgePhase_SETUP;
    end else begin
      case(phase)
        Axi4ToApb3BridgePhase_SETUP : begin
          if(when_Axi4SharedToApb3Bridge_l91) begin
            phase <= Axi4ToApb3BridgePhase_ACCESS_1;
            if(when_Axi4SharedToApb3Bridge_l97) begin
              phase <= Axi4ToApb3BridgePhase_RESPONSE;
            end
          end
        end
        Axi4ToApb3BridgePhase_ACCESS_1 : begin
          if(io_apb_PREADY) begin
            phase <= Axi4ToApb3BridgePhase_RESPONSE;
          end
        end
        default : begin
          if(write) begin
            if(io_axi_b_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end else begin
            if(io_axi_r_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3UartCtrl (
  input  wire [4:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_interrupt,
  input  wire          clk,
  input  wire          reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_flush;
  reg                 uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
  wire                uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_flush;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [4:0]    uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [4:0]    _zz_io_apb_PRDATA;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire                bridge_busCtrlWrapped_readErrorFlag;
  wire                bridge_busCtrlWrapped_writeErrorFlag;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        [0:0]    bridge_uartConfigReg_frame_stop;
  reg        [1:0]    bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 when_BusSlaveFactory_l341;
  wire                when_BusSlaveFactory_l347;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l341_1;
  wire                when_BusSlaveFactory_l347_1;
  wire                uart0_Ctrl_uartCtrl_1_io_read_isStall;
  reg                 bridge_misc_breakDetected;
  reg                 uart0_Ctrl_uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l155;
  reg                 when_BusSlaveFactory_l341_2;
  wire                when_BusSlaveFactory_l347_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l377;
  wire                when_BusSlaveFactory_l379;
  reg                 when_BusSlaveFactory_l341_3;
  wire                when_BusSlaveFactory_l347_3;
  wire       [1:0]    _zz_bridge_uartConfigReg_frame_parity;
  wire       [0:0]    _zz_bridge_uartConfigReg_frame_stop;
  wire                when_Apb3SlaveFactory_l81;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_bridge_uartConfigReg_frame_parity_string;
  reg [23:0] _zz_bridge_uartConfigReg_frame_stop_string;
  `endif


  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength (bridge_uartConfigReg_frame_dataLength[2:0]                          ), //i
    .io_config_frame_stop       (bridge_uartConfigReg_frame_stop                                     ), //i
    .io_config_frame_parity     (bridge_uartConfigReg_frame_parity[1:0]                              ), //i
    .io_config_clockDivider     (bridge_uartConfigReg_clockDivider[19:0]                             ), //i
    .io_write_valid             (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid       ), //i
    .io_write_ready             (uartCtrl_1_io_write_ready                                           ), //o
    .io_write_payload           (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]), //i
    .io_read_valid              (uartCtrl_1_io_read_valid                                            ), //o
    .io_read_ready              (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_push_ready      ), //i
    .io_read_payload            (uartCtrl_1_io_read_payload[7:0]                                     ), //o
    .io_uart_txd                (uartCtrl_1_io_uart_txd                                              ), //o
    .io_uart_rxd                (io_uart_rxd                                                         ), //i
    .io_readError               (uartCtrl_1_io_readError                                             ), //o
    .io_writeBreak              (bridge_misc_doBreak                                                 ), //i
    .io_readBreak               (uartCtrl_1_io_readBreak                                             ), //o
    .clk                        (clk                                                                 ), //i
    .reset                      (reset                                                               )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid   (bridge_write_streamUnbuffered_valid                                  ), //i
    .io_push_ready   (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (bridge_write_streamUnbuffered_payload[7:0]                           ), //i
    .io_pop_valid    (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (uartCtrl_1_io_write_ready                                            ), //i
    .io_pop_payload  (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush        (bridge_write_streamUnbuffered_queueWithOccupancy_io_flush            ), //i
    .io_occupancy    (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]   ), //o
    .io_availability (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]), //o
    .clk             (clk                                                                  ), //i
    .reset           (reset                                                                )  //i
  );
  StreamFifo uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid   (uartCtrl_1_io_read_valid                                             ), //i
    .io_push_ready   (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (uartCtrl_1_io_read_payload[7:0]                                      ), //i
    .io_pop_valid    (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload  (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush        (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_flush            ), //i
    .io_occupancy    (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[4:0]   ), //o
    .io_availability (uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_availability[4:0]), //o
    .clk             (clk                                                                  ), //i
    .reset           (reset                                                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : _zz_bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : _zz_bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : _zz_bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : _zz_bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : _zz_bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : _zz_bridge_uartConfigReg_frame_stop_string = "TWO";
      default : _zz_bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h00000000;
    case(io_apb_PADDR)
      5'h00 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'h04 : begin
        io_apb_PRDATA[20 : 16] = _zz_io_apb_PRDATA;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'h10 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1_io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign bridge_busCtrlWrapped_readErrorFlag = 1'b0;
  assign bridge_busCtrlWrapped_writeErrorFlag = 1'b0;
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      5'h00 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'h00 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l341 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347 = io_apb_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l341_1 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_1 = io_apb_PWDATA[1];
  assign uart0_Ctrl_uartCtrl_1_io_read_isStall = (uartCtrl_1_io_read_valid && (! uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l155 = (uartCtrl_1_io_readBreak && (! uart0_Ctrl_uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l341_2 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_2 = io_apb_PWDATA[9];
  always @(*) begin
    when_BusSlaveFactory_l377 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l377 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l379 = io_apb_PWDATA[10];
  always @(*) begin
    when_BusSlaveFactory_l341_3 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_3 = io_apb_PWDATA[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_bridge_uartConfigReg_frame_parity = io_apb_PWDATA[9 : 8];
  assign _zz_bridge_uartConfigReg_frame_stop = io_apb_PWDATA[16 : 16];
  assign when_Apb3SlaveFactory_l81 = ((io_apb_PADDR & (~ 5'h03)) == 5'h08);
  assign bridge_write_streamUnbuffered_queueWithOccupancy_io_flush = 1'b0;
  assign uart0_Ctrl_uartCtrl_1_io_read_queueWithOccupancy_io_flush = 1'b0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bridge_uartConfigReg_clockDivider <= 20'h00000;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(when_BusSlaveFactory_l341) begin
        if(when_BusSlaveFactory_l347) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_1) begin
        if(when_BusSlaveFactory_l347_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(uart0_Ctrl_uartCtrl_1_io_read_isStall) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l155) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_2) begin
        if(when_BusSlaveFactory_l347_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l377) begin
        if(when_BusSlaveFactory_l379) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l341_3) begin
        if(when_BusSlaveFactory_l347_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_apb_PADDR)
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
      if(when_Apb3SlaveFactory_l81) begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_clockDivider[19 : 0] <= io_apb_PWDATA[19 : 0];
        end
      end
    end
  end

  always @(posedge clk) begin
    uart0_Ctrl_uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
    case(io_apb_PADDR)
      5'h0c : begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
          bridge_uartConfigReg_frame_parity <= _zz_bridge_uartConfigReg_frame_parity;
          bridge_uartConfigReg_frame_stop <= _zz_bridge_uartConfigReg_frame_stop;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module nina_riscv_core (
  output wire          io_iBUS_ar_valid,
  input  wire          io_iBUS_ar_ready,
  output wire [31:0]   io_iBUS_ar_payload_addr,
  output wire [2:0]    io_iBUS_ar_payload_size,
  output wire [3:0]    io_iBUS_ar_payload_cache,
  output wire [2:0]    io_iBUS_ar_payload_prot,
  input  wire          io_iBUS_r_valid,
  output wire          io_iBUS_r_ready,
  input  wire [31:0]   io_iBUS_r_payload_data,
  input  wire [1:0]    io_iBUS_r_payload_resp,
  input  wire          io_iBUS_r_payload_last,
  output wire          io_dBUS_arw_valid,
  input  wire          io_dBUS_arw_ready,
  output wire [31:0]   io_dBUS_arw_payload_addr,
  output wire [2:0]    io_dBUS_arw_payload_size,
  output wire [3:0]    io_dBUS_arw_payload_cache,
  output wire [2:0]    io_dBUS_arw_payload_prot,
  output wire          io_dBUS_arw_payload_write,
  output wire          io_dBUS_w_valid,
  input  wire          io_dBUS_w_ready,
  output wire [31:0]   io_dBUS_w_payload_data,
  output wire [3:0]    io_dBUS_w_payload_strb,
  output wire          io_dBUS_w_payload_last,
  input  wire          io_dBUS_b_valid,
  output wire          io_dBUS_b_ready,
  input  wire [1:0]    io_dBUS_b_payload_resp,
  input  wire          io_dBUS_r_valid,
  output wire          io_dBUS_r_ready,
  input  wire [31:0]   io_dBUS_r_payload_data,
  input  wire [1:0]    io_dBUS_r_payload_resp,
  input  wire          io_dBUS_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                regfile_io_wr_valid;
  wire       [31:0]   regfile_io_wr_payload_reg_data;
  wire       [4:0]    regfile_io_wr_payload_reg_addr;
  wire                ex_io_stall;
  wire                ex_io_ex_fw_fw1_en;
  wire                ex_io_ex_fw_fw2_en;
  wire       [31:0]   regfile_io_rd_rsp_rd_data1;
  wire       [31:0]   regfile_io_rd_rsp_rd_data2;
  wire                fd_io_ibus_cmd_valid;
  wire       [31:0]   fd_io_ibus_cmd_payload_pc;
  wire                fd_io_ibus_rsp_ready;
  wire                fd_io_jump_ready;
  wire                fd_io_rd_cmd_valid;
  wire       [4:0]    fd_io_rd_cmd_payload_rd_addr1;
  wire       [4:0]    fd_io_rd_cmd_payload_rd_addr2;
  wire                fd_io_fd2x_valid;
  wire       [19:0]   fd_io_fd2x_payload_imm;
  wire       [10:0]   fd_io_fd2x_payload_module_en;
  wire       [4:0]    fd_io_fd2x_payload_reg_dest;
  wire                fd_io_fd2x_payload_reg_dest_vld;
  wire                ex_io_jump_valid;
  wire       [31:0]   ex_io_jump_payload_new_pc;
  wire                ex_io_mem_valid;
  wire       [4:0]    ex_io_mem_payload_reg_dest;
  wire       [31:0]   ex_io_mem_payload_mem_addr;
  wire       [31:0]   ex_io_mem_payload_mem_data;
  wire       [1:0]    ex_io_mem_payload_size;
  wire                ex_io_mem_payload_usigned_op;
  wire                ex_io_mem_payload_wr_en;
  wire                ex_io_ex2rf_valid;
  wire       [4:0]    ex_io_ex2rf_payload_reg_dest;
  wire       [31:0]   ex_io_ex2rf_payload_reg_data;
  wire                ex_io_fd2x_ready;
  wire                mem_io_dbus_cmd_valid;
  wire                mem_io_dbus_cmd_payload_wr;
  wire       [31:0]   mem_io_dbus_cmd_payload_addr;
  wire       [31:0]   mem_io_dbus_cmd_payload_data;
  wire       [1:0]    mem_io_dbus_cmd_payload_size;
  wire                mem_io_dbus_rsp_ready;
  wire                mem_io_mem_ready;
  wire                mem_io_wb_valid;
  wire       [4:0]    mem_io_wb_payload_reg_dest;
  wire       [31:0]   mem_io_wb_payload_reg_data;
  wire                ibus_iCMD_valid;
  wire                ibus_iCMD_ready;
  wire       [31:0]   ibus_iCMD_payload_pc;
  wire                ibus_iRSP_valid;
  wire                ibus_iRSP_ready;
  wire       [31:0]   ibus_iRSP_payload_instruction;
  wire                dbus_dCMD_valid;
  wire                dbus_dCMD_ready;
  wire                dbus_dCMD_payload_wr;
  wire       [31:0]   dbus_dCMD_payload_addr;
  wire       [31:0]   dbus_dCMD_payload_data;
  wire       [1:0]    dbus_dCMD_payload_size;
  wire                dbus_dRSP_valid;
  wire                dbus_dRSP_ready;
  wire       [31:0]   dbus_dRSP_payload_data;
  wire                dbus_dCMD_fire;
  wire                when_Utils_l694;
  reg                 _zz_when_Utils_l723;
  reg                 _zz_when_Utils_l723_1;
  reg        [0:0]    _zz_dbus_dCMD_ready;
  reg        [0:0]    _zz_dbus_dCMD_ready_1;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire                _zz_dbus_dCMD_ready_2;
  wire                _zz_io_dBUS_arw_valid;
  reg                 _zz_dbus_dCMD_ready_3;
  wire                _zz_io_dBUS_arw_payload_write;
  wire       [31:0]   _zz_io_dBUS_arw_payload_addr;
  wire       [1:0]    _zz_io_dBUS_arw_payload_size;
  wire                _zz_io_dBUS_arw_valid_1;
  wire                _zz_when_Stream_l1020;
  wire                _zz_io_dBUS_w_valid;
  reg                 _zz_when_Stream_l1020_1;
  reg                 _zz_when_Stream_l1020_2;
  reg                 _zz_when_Stream_l1020_3;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                when_Stream_l439;
  reg                 _zz_io_dBUS_w_valid_1;
  reg        [3:0]    _zz_io_dBUS_w_payload_strb;
  wire                cpu_fd_io_fd2x_s2mPipe_valid;
  reg                 cpu_fd_io_fd2x_s2mPipe_ready;
  wire       [19:0]   cpu_fd_io_fd2x_s2mPipe_payload_imm;
  wire       [10:0]   cpu_fd_io_fd2x_s2mPipe_payload_module_en;
  wire       [4:0]    cpu_fd_io_fd2x_s2mPipe_payload_reg_dest;
  wire                cpu_fd_io_fd2x_s2mPipe_payload_reg_dest_vld;
  reg                 cpu_fd_io_fd2x_rValidN;
  reg        [19:0]   cpu_fd_io_fd2x_rData_imm;
  reg        [10:0]   cpu_fd_io_fd2x_rData_module_en;
  reg        [4:0]    cpu_fd_io_fd2x_rData_reg_dest;
  reg                 cpu_fd_io_fd2x_rData_reg_dest_vld;
  wire                cpu_fd_io_fd2x_s2mPipe_m2sPipe_valid;
  wire                cpu_fd_io_fd2x_s2mPipe_m2sPipe_ready;
  wire       [19:0]   cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_imm;
  wire       [10:0]   cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_module_en;
  wire       [4:0]    cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest;
  wire                cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest_vld;
  reg                 cpu_fd_io_fd2x_s2mPipe_rValid;
  reg        [19:0]   cpu_fd_io_fd2x_s2mPipe_rData_imm;
  reg        [10:0]   cpu_fd_io_fd2x_s2mPipe_rData_module_en;
  reg        [4:0]    cpu_fd_io_fd2x_s2mPipe_rData_reg_dest;
  reg                 cpu_fd_io_fd2x_s2mPipe_rData_reg_dest_vld;
  wire                when_Stream_l369;
  wire                cpu_ex_io_mem_s2mPipe_valid;
  reg                 cpu_ex_io_mem_s2mPipe_ready;
  wire       [4:0]    cpu_ex_io_mem_s2mPipe_payload_reg_dest;
  wire       [31:0]   cpu_ex_io_mem_s2mPipe_payload_mem_addr;
  wire       [31:0]   cpu_ex_io_mem_s2mPipe_payload_mem_data;
  wire       [1:0]    cpu_ex_io_mem_s2mPipe_payload_size;
  wire                cpu_ex_io_mem_s2mPipe_payload_usigned_op;
  wire                cpu_ex_io_mem_s2mPipe_payload_wr_en;
  reg                 cpu_ex_io_mem_rValidN;
  reg        [4:0]    cpu_ex_io_mem_rData_reg_dest;
  reg        [31:0]   cpu_ex_io_mem_rData_mem_addr;
  reg        [31:0]   cpu_ex_io_mem_rData_mem_data;
  reg        [1:0]    cpu_ex_io_mem_rData_size;
  reg                 cpu_ex_io_mem_rData_usigned_op;
  reg                 cpu_ex_io_mem_rData_wr_en;
  wire                cpu_ex_io_mem_s2mPipe_m2sPipe_valid;
  wire                cpu_ex_io_mem_s2mPipe_m2sPipe_ready;
  wire       [4:0]    cpu_ex_io_mem_s2mPipe_m2sPipe_payload_reg_dest;
  wire       [31:0]   cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_addr;
  wire       [31:0]   cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_data;
  wire       [1:0]    cpu_ex_io_mem_s2mPipe_m2sPipe_payload_size;
  wire                cpu_ex_io_mem_s2mPipe_m2sPipe_payload_usigned_op;
  wire                cpu_ex_io_mem_s2mPipe_m2sPipe_payload_wr_en;
  reg                 cpu_ex_io_mem_s2mPipe_rValid;
  reg        [4:0]    cpu_ex_io_mem_s2mPipe_rData_reg_dest;
  reg        [31:0]   cpu_ex_io_mem_s2mPipe_rData_mem_addr;
  reg        [31:0]   cpu_ex_io_mem_s2mPipe_rData_mem_data;
  reg        [1:0]    cpu_ex_io_mem_s2mPipe_rData_size;
  reg                 cpu_ex_io_mem_s2mPipe_rData_usigned_op;
  reg                 cpu_ex_io_mem_s2mPipe_rData_wr_en;
  wire                when_Stream_l369_1;
  reg                 cpu_ex_io_ex2rf_valid_regNext;
  wire                wb_conflict;
  reg                 load_stall;
  wire                cpu_ex_io_fd2x_fire;
  wire                when_nina_riscv_core_l63;
  wire                cpu_mem_io_dbus_rsp_fire;
  reg        [4:0]    rd_addr1;
  reg        [4:0]    rd_addr2;
  wire                wb_conflict1;
  wire                wb_conflict2;
  reg                 wb_fw1;
  reg                 wb_fw2;
  reg        [31:0]   wb_fw1_data;
  reg        [31:0]   wb_fw2_data;
  wire                ex_conflict1;
  wire                ex_conflict2;
  reg                 ex_conflict1_regNext;
  reg                 _zz_io_ex_fw_fw1_en;
  reg                 ex_conflict2_regNext;
  reg                 _zz_io_ex_fw_fw2_en;

  regfiles regfile (
    .io_rd_cmd_valid            (fd_io_rd_cmd_valid                  ), //i
    .io_rd_cmd_payload_rd_addr1 (fd_io_rd_cmd_payload_rd_addr1[4:0]  ), //i
    .io_rd_cmd_payload_rd_addr2 (fd_io_rd_cmd_payload_rd_addr2[4:0]  ), //i
    .io_rd_rsp_rd_data1         (regfile_io_rd_rsp_rd_data1[31:0]    ), //o
    .io_rd_rsp_rd_data2         (regfile_io_rd_rsp_rd_data2[31:0]    ), //o
    .io_wr_valid                (regfile_io_wr_valid                 ), //i
    .io_wr_payload_reg_data     (regfile_io_wr_payload_reg_data[31:0]), //i
    .io_wr_payload_reg_addr     (regfile_io_wr_payload_reg_addr[4:0] ), //i
    .clk                        (clk                                 ), //i
    .reset                      (reset                               )  //i
  );
  fd_stage fd (
    .io_ibus_cmd_valid               (fd_io_ibus_cmd_valid               ), //o
    .io_ibus_cmd_ready               (ibus_iCMD_ready                    ), //i
    .io_ibus_cmd_payload_pc          (fd_io_ibus_cmd_payload_pc[31:0]    ), //o
    .io_ibus_rsp_valid               (ibus_iRSP_valid                    ), //i
    .io_ibus_rsp_ready               (fd_io_ibus_rsp_ready               ), //o
    .io_ibus_rsp_payload_instruction (ibus_iRSP_payload_instruction[31:0]), //i
    .io_stall                        (load_stall                         ), //i
    .io_jump_valid                   (ex_io_jump_valid                   ), //i
    .io_jump_ready                   (fd_io_jump_ready                   ), //o
    .io_jump_payload_new_pc          (ex_io_jump_payload_new_pc[31:0]    ), //i
    .io_rd_cmd_valid                 (fd_io_rd_cmd_valid                 ), //o
    .io_rd_cmd_payload_rd_addr1      (fd_io_rd_cmd_payload_rd_addr1[4:0] ), //o
    .io_rd_cmd_payload_rd_addr2      (fd_io_rd_cmd_payload_rd_addr2[4:0] ), //o
    .io_fd2x_valid                   (fd_io_fd2x_valid                   ), //o
    .io_fd2x_ready                   (cpu_fd_io_fd2x_rValidN             ), //i
    .io_fd2x_payload_imm             (fd_io_fd2x_payload_imm[19:0]       ), //o
    .io_fd2x_payload_module_en       (fd_io_fd2x_payload_module_en[10:0] ), //o
    .io_fd2x_payload_reg_dest        (fd_io_fd2x_payload_reg_dest[4:0]   ), //o
    .io_fd2x_payload_reg_dest_vld    (fd_io_fd2x_payload_reg_dest_vld    ), //o
    .clk                             (clk                                ), //i
    .reset                           (reset                              )  //i
  );
  ex_stage ex (
    .io_stall                     (ex_io_stall                                           ), //i
    .io_jump_valid                (ex_io_jump_valid                                      ), //o
    .io_jump_ready                (fd_io_jump_ready                                      ), //i
    .io_jump_payload_new_pc       (ex_io_jump_payload_new_pc[31:0]                       ), //o
    .io_wb_fw_fw1_en              (wb_fw1                                                ), //i
    .io_wb_fw_fw1_data            (wb_fw1_data[31:0]                                     ), //i
    .io_wb_fw_fw2_en              (wb_fw2                                                ), //i
    .io_wb_fw_fw2_data            (wb_fw2_data[31:0]                                     ), //i
    .io_ex_fw_fw1_en              (ex_io_ex_fw_fw1_en                                    ), //i
    .io_ex_fw_fw2_en              (ex_io_ex_fw_fw2_en                                    ), //i
    .io_mem_valid                 (ex_io_mem_valid                                       ), //o
    .io_mem_ready                 (cpu_ex_io_mem_rValidN                                 ), //i
    .io_mem_payload_reg_dest      (ex_io_mem_payload_reg_dest[4:0]                       ), //o
    .io_mem_payload_mem_addr      (ex_io_mem_payload_mem_addr[31:0]                      ), //o
    .io_mem_payload_mem_data      (ex_io_mem_payload_mem_data[31:0]                      ), //o
    .io_mem_payload_size          (ex_io_mem_payload_size[1:0]                           ), //o
    .io_mem_payload_usigned_op    (ex_io_mem_payload_usigned_op                          ), //o
    .io_mem_payload_wr_en         (ex_io_mem_payload_wr_en                               ), //o
    .io_ex2rf_valid               (ex_io_ex2rf_valid                                     ), //o
    .io_ex2rf_payload_reg_dest    (ex_io_ex2rf_payload_reg_dest[4:0]                     ), //o
    .io_ex2rf_payload_reg_data    (ex_io_ex2rf_payload_reg_data[31:0]                    ), //o
    .io_fd2x_valid                (cpu_fd_io_fd2x_s2mPipe_m2sPipe_valid                  ), //i
    .io_fd2x_ready                (ex_io_fd2x_ready                                      ), //o
    .io_fd2x_payload_imm          (cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_imm[19:0]      ), //i
    .io_fd2x_payload_module_en    (cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_module_en[10:0]), //i
    .io_fd2x_payload_reg_dest     (cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest[4:0]  ), //i
    .io_fd2x_payload_reg_dest_vld (cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest_vld   ), //i
    .io_rd_rsp_rd_data1           (regfile_io_rd_rsp_rd_data1[31:0]                      ), //i
    .io_rd_rsp_rd_data2           (regfile_io_rd_rsp_rd_data2[31:0]                      ), //i
    .clk                          (clk                                                   ), //i
    .reset                        (reset                                                 )  //i
  );
  mem_stage mem (
    .io_dbus_cmd_valid         (mem_io_dbus_cmd_valid                               ), //o
    .io_dbus_cmd_ready         (dbus_dCMD_ready                                     ), //i
    .io_dbus_cmd_payload_wr    (mem_io_dbus_cmd_payload_wr                          ), //o
    .io_dbus_cmd_payload_addr  (mem_io_dbus_cmd_payload_addr[31:0]                  ), //o
    .io_dbus_cmd_payload_data  (mem_io_dbus_cmd_payload_data[31:0]                  ), //o
    .io_dbus_cmd_payload_size  (mem_io_dbus_cmd_payload_size[1:0]                   ), //o
    .io_dbus_rsp_valid         (dbus_dRSP_valid                                     ), //i
    .io_dbus_rsp_ready         (mem_io_dbus_rsp_ready                               ), //o
    .io_dbus_rsp_payload_data  (dbus_dRSP_payload_data[31:0]                        ), //i
    .io_mem_valid              (cpu_ex_io_mem_s2mPipe_m2sPipe_valid                 ), //i
    .io_mem_ready              (mem_io_mem_ready                                    ), //o
    .io_mem_payload_reg_dest   (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_reg_dest[4:0] ), //i
    .io_mem_payload_mem_addr   (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_addr[31:0]), //i
    .io_mem_payload_mem_data   (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_data[31:0]), //i
    .io_mem_payload_size       (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_size[1:0]     ), //i
    .io_mem_payload_usigned_op (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_usigned_op    ), //i
    .io_mem_payload_wr_en      (cpu_ex_io_mem_s2mPipe_m2sPipe_payload_wr_en         ), //i
    .io_wb_valid               (mem_io_wb_valid                                     ), //o
    .io_wb_payload_reg_dest    (mem_io_wb_payload_reg_dest[4:0]                     ), //o
    .io_wb_payload_reg_data    (mem_io_wb_payload_reg_data[31:0]                    ), //o
    .clk                       (clk                                                 ), //i
    .reset                     (reset                                               )  //i
  );
  assign ibus_iCMD_valid = fd_io_ibus_cmd_valid;
  assign ibus_iCMD_payload_pc = fd_io_ibus_cmd_payload_pc;
  assign ibus_iRSP_ready = fd_io_ibus_rsp_ready;
  assign ibus_iCMD_ready = io_iBUS_ar_ready;
  assign ibus_iRSP_valid = io_iBUS_r_valid;
  assign ibus_iRSP_payload_instruction = io_iBUS_r_payload_data;
  assign io_iBUS_ar_valid = ibus_iCMD_valid;
  assign io_iBUS_ar_payload_addr = ibus_iCMD_payload_pc;
  assign io_iBUS_ar_payload_size = 3'b111;
  assign io_iBUS_ar_payload_cache = 4'b1111;
  assign io_iBUS_ar_payload_prot = 3'b110;
  assign io_iBUS_r_ready = ibus_iRSP_ready;
  assign dbus_dCMD_valid = mem_io_dbus_cmd_valid;
  assign dbus_dCMD_payload_wr = mem_io_dbus_cmd_payload_wr;
  assign dbus_dCMD_payload_addr = mem_io_dbus_cmd_payload_addr;
  assign dbus_dCMD_payload_data = mem_io_dbus_cmd_payload_data;
  assign dbus_dCMD_payload_size = mem_io_dbus_cmd_payload_size;
  assign dbus_dRSP_ready = mem_io_dbus_rsp_ready;
  assign dbus_dCMD_fire = (dbus_dCMD_valid && dbus_dCMD_ready);
  assign when_Utils_l694 = (dbus_dCMD_fire && dbus_dCMD_payload_wr);
  always @(*) begin
    _zz_when_Utils_l723 = 1'b0;
    if(when_Utils_l694) begin
      _zz_when_Utils_l723 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l723_1 = 1'b0;
    if((io_dBUS_b_valid && 1'b1)) begin
      _zz_when_Utils_l723_1 = 1'b1;
    end
  end

  assign when_Utils_l723 = (_zz_when_Utils_l723 && (! _zz_when_Utils_l723_1));
  always @(*) begin
    if(when_Utils_l723) begin
      _zz_dbus_dCMD_ready_1 = 1'b1;
    end else begin
      if(when_Utils_l725) begin
        _zz_dbus_dCMD_ready_1 = 1'b1;
      end else begin
        _zz_dbus_dCMD_ready_1 = 1'b0;
      end
    end
  end

  assign when_Utils_l725 = ((! _zz_when_Utils_l723) && _zz_when_Utils_l723_1);
  assign _zz_dbus_dCMD_ready_2 = (! ((((_zz_dbus_dCMD_ready != 1'b0) && dbus_dCMD_valid) && (! dbus_dCMD_payload_wr)) || (_zz_dbus_dCMD_ready == 1'b1)));
  assign _zz_io_dBUS_arw_valid = (dbus_dCMD_valid && _zz_dbus_dCMD_ready_2);
  assign dbus_dCMD_ready = (_zz_dbus_dCMD_ready_3 && _zz_dbus_dCMD_ready_2);
  assign _zz_io_dBUS_arw_payload_write = dbus_dCMD_payload_wr;
  assign _zz_io_dBUS_arw_payload_addr = dbus_dCMD_payload_addr;
  assign _zz_io_dBUS_arw_payload_size = dbus_dCMD_payload_size;
  always @(*) begin
    _zz_dbus_dCMD_ready_3 = 1'b1;
    if(when_Stream_l1020) begin
      _zz_dbus_dCMD_ready_3 = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      _zz_dbus_dCMD_ready_3 = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! _zz_when_Stream_l1020) && _zz_when_Stream_l1020_2);
  assign when_Stream_l1020_1 = ((! _zz_when_Stream_l1020_1) && _zz_when_Stream_l1020_3);
  assign _zz_io_dBUS_arw_valid_1 = (_zz_io_dBUS_arw_valid && _zz_when_Stream_l1020_2);
  assign _zz_io_dBUS_w_valid = (_zz_io_dBUS_arw_valid && _zz_when_Stream_l1020_3);
  assign _zz_when_Stream_l1020 = io_dBUS_arw_ready;
  assign when_Stream_l439 = (! _zz_io_dBUS_arw_payload_write);
  always @(*) begin
    _zz_io_dBUS_w_valid_1 = _zz_io_dBUS_w_valid;
    if(when_Stream_l439) begin
      _zz_io_dBUS_w_valid_1 = 1'b0;
    end
  end

  always @(*) begin
    _zz_when_Stream_l1020_1 = io_dBUS_w_ready;
    if(when_Stream_l439) begin
      _zz_when_Stream_l1020_1 = 1'b1;
    end
  end

  always @(*) begin
    case(_zz_io_dBUS_arw_payload_size)
      2'b00 : begin
        _zz_io_dBUS_w_payload_strb = 4'b0001;
      end
      2'b01 : begin
        _zz_io_dBUS_w_payload_strb = 4'b0011;
      end
      default : begin
        _zz_io_dBUS_w_payload_strb = 4'b1111;
      end
    endcase
  end

  assign dbus_dRSP_valid = io_dBUS_r_valid;
  assign dbus_dRSP_payload_data = io_dBUS_r_payload_data;
  assign io_dBUS_arw_valid = _zz_io_dBUS_arw_valid_1;
  assign io_dBUS_arw_payload_addr = _zz_io_dBUS_arw_payload_addr;
  assign io_dBUS_arw_payload_size = {1'd0, _zz_io_dBUS_arw_payload_size};
  assign io_dBUS_arw_payload_cache = 4'b1111;
  assign io_dBUS_arw_payload_prot = 3'b010;
  assign io_dBUS_arw_payload_write = _zz_io_dBUS_arw_payload_write;
  assign io_dBUS_w_valid = _zz_io_dBUS_w_valid_1;
  assign io_dBUS_w_payload_data = dbus_dCMD_payload_data;
  assign io_dBUS_w_payload_strb = (_zz_io_dBUS_w_payload_strb <<< _zz_io_dBUS_arw_payload_addr[1 : 0]);
  assign io_dBUS_w_payload_last = 1'b1;
  assign io_dBUS_b_ready = 1'b1;
  assign io_dBUS_r_ready = dbus_dRSP_ready;
  assign cpu_fd_io_fd2x_s2mPipe_valid = (fd_io_fd2x_valid || (! cpu_fd_io_fd2x_rValidN));
  assign cpu_fd_io_fd2x_s2mPipe_payload_imm = (cpu_fd_io_fd2x_rValidN ? fd_io_fd2x_payload_imm : cpu_fd_io_fd2x_rData_imm);
  assign cpu_fd_io_fd2x_s2mPipe_payload_module_en = (cpu_fd_io_fd2x_rValidN ? fd_io_fd2x_payload_module_en : cpu_fd_io_fd2x_rData_module_en);
  assign cpu_fd_io_fd2x_s2mPipe_payload_reg_dest = (cpu_fd_io_fd2x_rValidN ? fd_io_fd2x_payload_reg_dest : cpu_fd_io_fd2x_rData_reg_dest);
  assign cpu_fd_io_fd2x_s2mPipe_payload_reg_dest_vld = (cpu_fd_io_fd2x_rValidN ? fd_io_fd2x_payload_reg_dest_vld : cpu_fd_io_fd2x_rData_reg_dest_vld);
  always @(*) begin
    cpu_fd_io_fd2x_s2mPipe_ready = cpu_fd_io_fd2x_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369) begin
      cpu_fd_io_fd2x_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! cpu_fd_io_fd2x_s2mPipe_m2sPipe_valid);
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_valid = cpu_fd_io_fd2x_s2mPipe_rValid;
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_imm = cpu_fd_io_fd2x_s2mPipe_rData_imm;
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_module_en = cpu_fd_io_fd2x_s2mPipe_rData_module_en;
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest = cpu_fd_io_fd2x_s2mPipe_rData_reg_dest;
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_reg_dest_vld = cpu_fd_io_fd2x_s2mPipe_rData_reg_dest_vld;
  assign cpu_fd_io_fd2x_s2mPipe_m2sPipe_ready = ex_io_fd2x_ready;
  assign cpu_ex_io_mem_s2mPipe_valid = (ex_io_mem_valid || (! cpu_ex_io_mem_rValidN));
  assign cpu_ex_io_mem_s2mPipe_payload_reg_dest = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_reg_dest : cpu_ex_io_mem_rData_reg_dest);
  assign cpu_ex_io_mem_s2mPipe_payload_mem_addr = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_mem_addr : cpu_ex_io_mem_rData_mem_addr);
  assign cpu_ex_io_mem_s2mPipe_payload_mem_data = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_mem_data : cpu_ex_io_mem_rData_mem_data);
  assign cpu_ex_io_mem_s2mPipe_payload_size = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_size : cpu_ex_io_mem_rData_size);
  assign cpu_ex_io_mem_s2mPipe_payload_usigned_op = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_usigned_op : cpu_ex_io_mem_rData_usigned_op);
  assign cpu_ex_io_mem_s2mPipe_payload_wr_en = (cpu_ex_io_mem_rValidN ? ex_io_mem_payload_wr_en : cpu_ex_io_mem_rData_wr_en);
  always @(*) begin
    cpu_ex_io_mem_s2mPipe_ready = cpu_ex_io_mem_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_1) begin
      cpu_ex_io_mem_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_1 = (! cpu_ex_io_mem_s2mPipe_m2sPipe_valid);
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_valid = cpu_ex_io_mem_s2mPipe_rValid;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_reg_dest = cpu_ex_io_mem_s2mPipe_rData_reg_dest;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_addr = cpu_ex_io_mem_s2mPipe_rData_mem_addr;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_mem_data = cpu_ex_io_mem_s2mPipe_rData_mem_data;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_size = cpu_ex_io_mem_s2mPipe_rData_size;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_usigned_op = cpu_ex_io_mem_s2mPipe_rData_usigned_op;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_payload_wr_en = cpu_ex_io_mem_s2mPipe_rData_wr_en;
  assign cpu_ex_io_mem_s2mPipe_m2sPipe_ready = mem_io_mem_ready;
  assign regfile_io_wr_payload_reg_data = (mem_io_wb_valid ? mem_io_wb_payload_reg_data : ex_io_ex2rf_payload_reg_data);
  assign regfile_io_wr_payload_reg_addr = (mem_io_wb_valid ? mem_io_wb_payload_reg_dest : ex_io_ex2rf_payload_reg_dest);
  assign regfile_io_wr_valid = (mem_io_wb_valid || ex_io_ex2rf_valid);
  assign wb_conflict = (mem_io_wb_valid && cpu_ex_io_ex2rf_valid_regNext);
  assign cpu_ex_io_fd2x_fire = (cpu_fd_io_fd2x_s2mPipe_m2sPipe_valid && ex_io_fd2x_ready);
  assign when_nina_riscv_core_l63 = (cpu_ex_io_fd2x_fire && cpu_fd_io_fd2x_s2mPipe_m2sPipe_payload_module_en[2]);
  assign cpu_mem_io_dbus_rsp_fire = (dbus_dRSP_valid && mem_io_dbus_rsp_ready);
  assign ex_io_stall = (wb_conflict || load_stall);
  assign wb_conflict1 = ((mem_io_wb_payload_reg_dest == rd_addr1) && mem_io_wb_valid);
  assign wb_conflict2 = ((mem_io_wb_payload_reg_dest == rd_addr2) && mem_io_wb_valid);
  assign ex_conflict1 = ((ex_io_ex2rf_payload_reg_dest == rd_addr1) && ex_io_ex2rf_valid);
  assign ex_conflict2 = ((ex_io_ex2rf_payload_reg_dest == rd_addr2) && ex_io_ex2rf_valid);
  assign ex_io_ex_fw_fw1_en = (ex_conflict1_regNext && _zz_io_ex_fw_fw1_en);
  assign ex_io_ex_fw_fw2_en = (ex_conflict2_regNext && _zz_io_ex_fw_fw2_en);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_dbus_dCMD_ready <= 1'b0;
      _zz_when_Stream_l1020_2 <= 1'b1;
      _zz_when_Stream_l1020_3 <= 1'b1;
      cpu_fd_io_fd2x_rValidN <= 1'b1;
      cpu_fd_io_fd2x_s2mPipe_rValid <= 1'b0;
      cpu_ex_io_mem_rValidN <= 1'b1;
      cpu_ex_io_mem_s2mPipe_rValid <= 1'b0;
      load_stall <= 1'b0;
    end else begin
      _zz_dbus_dCMD_ready <= (_zz_dbus_dCMD_ready + _zz_dbus_dCMD_ready_1);
      if((_zz_io_dBUS_arw_valid_1 && _zz_when_Stream_l1020)) begin
        _zz_when_Stream_l1020_2 <= 1'b0;
      end
      if((_zz_io_dBUS_w_valid && _zz_when_Stream_l1020_1)) begin
        _zz_when_Stream_l1020_3 <= 1'b0;
      end
      if(_zz_dbus_dCMD_ready_3) begin
        _zz_when_Stream_l1020_2 <= 1'b1;
        _zz_when_Stream_l1020_3 <= 1'b1;
      end
      if(fd_io_fd2x_valid) begin
        cpu_fd_io_fd2x_rValidN <= 1'b0;
      end
      if(cpu_fd_io_fd2x_s2mPipe_ready) begin
        cpu_fd_io_fd2x_rValidN <= 1'b1;
      end
      if(cpu_fd_io_fd2x_s2mPipe_ready) begin
        cpu_fd_io_fd2x_s2mPipe_rValid <= cpu_fd_io_fd2x_s2mPipe_valid;
      end
      if(ex_io_mem_valid) begin
        cpu_ex_io_mem_rValidN <= 1'b0;
      end
      if(cpu_ex_io_mem_s2mPipe_ready) begin
        cpu_ex_io_mem_rValidN <= 1'b1;
      end
      if(cpu_ex_io_mem_s2mPipe_ready) begin
        cpu_ex_io_mem_s2mPipe_rValid <= cpu_ex_io_mem_s2mPipe_valid;
      end
      if(when_nina_riscv_core_l63) begin
        load_stall <= 1'b1;
      end else begin
        if(cpu_mem_io_dbus_rsp_fire) begin
          load_stall <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(cpu_fd_io_fd2x_rValidN) begin
      cpu_fd_io_fd2x_rData_imm <= fd_io_fd2x_payload_imm;
      cpu_fd_io_fd2x_rData_module_en <= fd_io_fd2x_payload_module_en;
      cpu_fd_io_fd2x_rData_reg_dest <= fd_io_fd2x_payload_reg_dest;
      cpu_fd_io_fd2x_rData_reg_dest_vld <= fd_io_fd2x_payload_reg_dest_vld;
    end
    if(cpu_fd_io_fd2x_s2mPipe_ready) begin
      cpu_fd_io_fd2x_s2mPipe_rData_imm <= cpu_fd_io_fd2x_s2mPipe_payload_imm;
      cpu_fd_io_fd2x_s2mPipe_rData_module_en <= cpu_fd_io_fd2x_s2mPipe_payload_module_en;
      cpu_fd_io_fd2x_s2mPipe_rData_reg_dest <= cpu_fd_io_fd2x_s2mPipe_payload_reg_dest;
      cpu_fd_io_fd2x_s2mPipe_rData_reg_dest_vld <= cpu_fd_io_fd2x_s2mPipe_payload_reg_dest_vld;
    end
    if(cpu_ex_io_mem_rValidN) begin
      cpu_ex_io_mem_rData_reg_dest <= ex_io_mem_payload_reg_dest;
      cpu_ex_io_mem_rData_mem_addr <= ex_io_mem_payload_mem_addr;
      cpu_ex_io_mem_rData_mem_data <= ex_io_mem_payload_mem_data;
      cpu_ex_io_mem_rData_size <= ex_io_mem_payload_size;
      cpu_ex_io_mem_rData_usigned_op <= ex_io_mem_payload_usigned_op;
      cpu_ex_io_mem_rData_wr_en <= ex_io_mem_payload_wr_en;
    end
    if(cpu_ex_io_mem_s2mPipe_ready) begin
      cpu_ex_io_mem_s2mPipe_rData_reg_dest <= cpu_ex_io_mem_s2mPipe_payload_reg_dest;
      cpu_ex_io_mem_s2mPipe_rData_mem_addr <= cpu_ex_io_mem_s2mPipe_payload_mem_addr;
      cpu_ex_io_mem_s2mPipe_rData_mem_data <= cpu_ex_io_mem_s2mPipe_payload_mem_data;
      cpu_ex_io_mem_s2mPipe_rData_size <= cpu_ex_io_mem_s2mPipe_payload_size;
      cpu_ex_io_mem_s2mPipe_rData_usigned_op <= cpu_ex_io_mem_s2mPipe_payload_usigned_op;
      cpu_ex_io_mem_s2mPipe_rData_wr_en <= cpu_ex_io_mem_s2mPipe_payload_wr_en;
    end
    cpu_ex_io_ex2rf_valid_regNext <= ex_io_ex2rf_valid;
    if(fd_io_rd_cmd_valid) begin
      rd_addr1 <= fd_io_rd_cmd_payload_rd_addr1;
    end
    if(fd_io_rd_cmd_valid) begin
      rd_addr2 <= fd_io_rd_cmd_payload_rd_addr2;
    end
    wb_fw1 <= wb_conflict1;
    wb_fw2 <= wb_conflict2;
    if(wb_conflict1) begin
      wb_fw1_data <= mem_io_wb_payload_reg_data;
    end
    if(wb_conflict2) begin
      wb_fw2_data <= mem_io_wb_payload_reg_data;
    end
    ex_conflict1_regNext <= ex_conflict1;
    _zz_io_ex_fw_fw1_en <= (! fd_io_fd2x_payload_reg_dest_vld);
    ex_conflict2_regNext <= ex_conflict2;
    _zz_io_ex_fw_fw2_en <= (! fd_io_fd2x_payload_reg_dest_vld);
  end


endmodule

//StreamFifoLowLatency replaced by StreamFifoLowLatency_1

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [16:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [16:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire          io_inputs_1_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [16:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_3 fifo (
    .io_push_valid   (io_push_valid            ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (io_pop_ready             ), //i
    .io_flush        (io_flush                 ), //i
    .io_occupancy    (fifo_io_occupancy[2:0]   ), //o
    .io_availability (fifo_io_availability[2:0]), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter_1 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [27:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [27:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input  wire          io_axi_arw_valid,
  output wire          io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [3:0]    io_axi_arw_payload_cache,
  input  wire [2:0]    io_axi_arw_payload_prot,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h00);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_arw_fire) begin
      remaining <= 8'h00;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [2:0]    io_axi_ar_payload_size,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h00);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_ar_fire) begin
      remaining <= 8'h00;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module InterruptCtrl (
  input  wire [3:0]    io_inputs,
  input  wire [3:0]    io_clears,
  input  wire [3:0]    io_masks,
  output wire [3:0]    io_pendings,
  input  wire          clk,
  input  wire          reset
);

  reg        [3:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendings <= 4'b0000;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

//Timer_3 replaced by Timer_1

//Timer_2 replaced by Timer_1

module Timer_1 (
  input  wire          io_tick,
  input  wire          io_clear,
  input  wire [15:0]   io_limit,
  output wire          io_full,
  output wire [15:0]   io_value,
  input  wire          clk,
  input  wire          reset
);

  wire       [15:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {15'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 16'h0000;
    end
  end


endmodule

module Timer (
  input  wire          io_tick,
  input  wire          io_clear,
  input  wire [31:0]   io_limit,
  output wire          io_full,
  output wire [31:0]   io_value,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {31'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h00000000;
    end
  end


endmodule

module Prescaler (
  input  wire          io_clear,
  input  wire [15:0]   io_limit,
  output wire          io_overflow,
  input  wire          clk,
  input  wire          reset
);

  reg        [15:0]   counter;
  wire                when_Prescaler_l17;

  assign when_Prescaler_l17 = (io_clear || io_overflow);
  assign io_overflow = (counter == io_limit);
  always @(posedge clk) begin
    counter <= (counter + 16'h0001);
    if(when_Prescaler_l17) begin
      counter <= 16'h0000;
    end
  end


endmodule

module BufferCC (
  input  wire          io_dataIn_clear,
  input  wire          io_dataIn_tick,
  output wire          io_dataOut_clear,
  output wire          io_dataOut_tick,
  input  wire          clk,
  input  wire          reset
);

  (* async_reg = "true" *) reg                 buffers_0_clear;
  (* async_reg = "true" *) reg                 buffers_0_tick;
  (* async_reg = "true" *) reg                 buffers_1_clear;
  (* async_reg = "true" *) reg                 buffers_1_tick;

  assign io_dataOut_clear = buffers_1_clear;
  assign io_dataOut_tick = buffers_1_tick;
  always @(posedge clk) begin
    buffers_0_clear <= io_dataIn_clear;
    buffers_0_tick <= io_dataIn_tick;
    buffers_1_clear <= buffers_0_clear;
    buffers_1_tick <= buffers_0_tick;
  end


endmodule

//StreamFifo_1 replaced by StreamFifo

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:15];

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h00;
      logic_ptr_pop <= 5'h00;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h00;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h00;
        logic_ptr_pop <= 5'h00;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h00;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module UartCtrl (
  input  wire [2:0]    io_config_frame_dataLength,
  input  wire [0:0]    io_config_frame_stop,
  input  wire [1:0]    io_config_frame_parity,
  input  wire [19:0]   io_config_clockDivider,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_readError,
  input  wire          io_writeBreak,
  output wire          io_readBreak,
  input  wire          clk,
  input  wire          reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_cts;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_write_valid            (io_write_thrown_valid          ), //i
    .io_write_ready            (tx_io_write_ready              ), //o
    .io_write_payload          (io_write_thrown_payload[7:0]   ), //i
    .io_cts                    (tx_io_cts                      ), //i
    .io_txd                    (tx_io_txd                      ), //o
    .io_break                  (io_writeBreak                  ), //i
    .clk                       (clk                            ), //i
    .reset                     (reset                          )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_read_valid             (rx_io_read_valid               ), //o
    .io_read_ready             (io_read_ready                  ), //i
    .io_read_payload           (rx_io_read_payload[7:0]        ), //o
    .io_rxd                    (io_uart_rxd                    ), //i
    .io_rts                    (rx_io_rts                      ), //o
    .io_error                  (rx_io_error                    ), //o
    .io_break                  (rx_io_break                    ), //o
    .clk                       (clk                            ), //i
    .reset                     (reset                          )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h00000);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign tx_io_cts = 1'b0;
  assign io_readBreak = rx_io_break;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter <= 20'h00000;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module mem_stage (
  output wire          io_dbus_cmd_valid,
  input  wire          io_dbus_cmd_ready,
  output wire          io_dbus_cmd_payload_wr,
  output wire [31:0]   io_dbus_cmd_payload_addr,
  output wire [31:0]   io_dbus_cmd_payload_data,
  output wire [1:0]    io_dbus_cmd_payload_size,
  input  wire          io_dbus_rsp_valid,
  output wire          io_dbus_rsp_ready,
  input  wire [31:0]   io_dbus_rsp_payload_data,
  input  wire          io_mem_valid,
  output wire          io_mem_ready,
  input  wire [4:0]    io_mem_payload_reg_dest,
  input  wire [31:0]   io_mem_payload_mem_addr,
  input  wire [31:0]   io_mem_payload_mem_data,
  input  wire [1:0]    io_mem_payload_size,
  input  wire          io_mem_payload_usigned_op,
  input  wire          io_mem_payload_wr_en,
  output wire          io_wb_valid,
  output wire [4:0]    io_wb_payload_reg_dest,
  output wire [31:0]   io_wb_payload_reg_data,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   _zz__zz_rsp_data_remap;
  wire       [31:0]   _zz__zz_rsp_data_remap_1;
  wire       [31:0]   _zz__zz_rsp_data_remap_2;
  wire       [31:0]   _zz__zz_rsp_data_remap_3;
  wire       [31:0]   _zz__zz_rsp_data_remap_4;
  wire       [31:0]   _zz__zz_rsp_data_remap_5;
  wire       [31:0]   _zz__zz_rsp_data_remap_6;
  wire       [31:0]   _zz__zz_rsp_data_remap_7;
  wire       [31:0]   _zz__zz_rsp_data_remap_8;
  wire       [31:0]   _zz__zz_rsp_data_remap_9;
  wire       [31:0]   _zz__zz_rsp_data_remap_10;
  wire       [31:0]   _zz__zz_rsp_data_remap_11;
  reg        [4:0]    dest_temp;
  reg        [1:0]    size_temp;
  reg                 op_temp;
  reg        [1:0]    addr_align;
  wire       [3:0]    switch_Misc_l241;
  wire                _zz_rsp_data_remap;
  reg        [31:0]   _zz_rsp_data_remap_1;
  wire                _zz_rsp_data_remap_2;
  reg        [31:0]   _zz_rsp_data_remap_3;
  wire                _zz_rsp_data_remap_4;
  reg        [31:0]   _zz_rsp_data_remap_5;
  wire                _zz_rsp_data_remap_6;
  reg        [31:0]   _zz_rsp_data_remap_7;
  wire                _zz_rsp_data_remap_8;
  reg        [31:0]   _zz_rsp_data_remap_9;
  wire                _zz_rsp_data_remap_10;
  reg        [31:0]   _zz_rsp_data_remap_11;
  reg        [31:0]   rsp_data_remap;
  wire       [1:0]    switch_Misc_l241_1;
  reg        [31:0]   _zz_io_dbus_cmd_payload_data;

  assign _zz__zz_rsp_data_remap = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_1 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_2 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_3 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_4 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_5 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_6 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_7 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_8 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_9 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_10 = io_dbus_rsp_payload_data;
  assign _zz__zz_rsp_data_remap_11 = io_dbus_rsp_payload_data;
  assign switch_Misc_l241 = {size_temp,addr_align};
  assign _zz_rsp_data_remap = (_zz__zz_rsp_data_remap[7] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_1[31] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[30] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[29] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[28] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[27] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[26] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[25] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[24] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[23] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[22] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[21] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[20] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[19] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[18] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[17] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[16] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[15] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[14] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[13] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[12] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[11] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[10] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[9] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[8] = _zz_rsp_data_remap;
    _zz_rsp_data_remap_1[7 : 0] = _zz__zz_rsp_data_remap_1[7 : 0];
  end

  assign _zz_rsp_data_remap_2 = (_zz__zz_rsp_data_remap_2[15] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_3[31] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[30] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[29] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[28] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[27] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[26] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[25] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[24] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[23] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[22] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[21] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[20] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[19] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[18] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[17] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[16] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[15] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[14] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[13] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[12] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[11] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[10] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[9] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[8] = _zz_rsp_data_remap_2;
    _zz_rsp_data_remap_3[7 : 0] = _zz__zz_rsp_data_remap_3[15 : 8];
  end

  assign _zz_rsp_data_remap_4 = (_zz__zz_rsp_data_remap_4[23] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_5[31] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[30] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[29] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[28] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[27] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[26] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[25] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[24] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[23] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[22] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[21] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[20] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[19] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[18] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[17] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[16] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[15] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[14] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[13] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[12] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[11] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[10] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[9] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[8] = _zz_rsp_data_remap_4;
    _zz_rsp_data_remap_5[7 : 0] = _zz__zz_rsp_data_remap_5[23 : 16];
  end

  assign _zz_rsp_data_remap_6 = (_zz__zz_rsp_data_remap_6[31] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_7[31] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[30] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[29] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[28] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[27] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[26] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[25] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[24] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[23] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[22] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[21] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[20] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[19] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[18] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[17] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[16] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[15] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[14] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[13] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[12] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[11] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[10] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[9] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[8] = _zz_rsp_data_remap_6;
    _zz_rsp_data_remap_7[7 : 0] = _zz__zz_rsp_data_remap_7[31 : 24];
  end

  assign _zz_rsp_data_remap_8 = (_zz__zz_rsp_data_remap_8[15] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_9[31] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[30] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[29] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[28] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[27] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[26] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[25] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[24] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[23] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[22] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[21] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[20] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[19] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[18] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[17] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[16] = _zz_rsp_data_remap_8;
    _zz_rsp_data_remap_9[15 : 0] = _zz__zz_rsp_data_remap_9[15 : 0];
  end

  assign _zz_rsp_data_remap_10 = (_zz__zz_rsp_data_remap_10[31] && (! op_temp));
  always @(*) begin
    _zz_rsp_data_remap_11[31] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[30] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[29] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[28] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[27] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[26] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[25] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[24] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[23] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[22] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[21] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[20] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[19] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[18] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[17] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[16] = _zz_rsp_data_remap_10;
    _zz_rsp_data_remap_11[15 : 0] = _zz__zz_rsp_data_remap_11[31 : 16];
  end

  always @(*) begin
    casez(switch_Misc_l241)
      4'b0000 : begin
        rsp_data_remap = _zz_rsp_data_remap_1;
      end
      4'b0001 : begin
        rsp_data_remap = _zz_rsp_data_remap_3;
      end
      4'b0010 : begin
        rsp_data_remap = _zz_rsp_data_remap_5;
      end
      4'b0011 : begin
        rsp_data_remap = _zz_rsp_data_remap_7;
      end
      4'b010? : begin
        rsp_data_remap = _zz_rsp_data_remap_9;
      end
      4'b011? : begin
        rsp_data_remap = _zz_rsp_data_remap_11;
      end
      default : begin
        rsp_data_remap = io_dbus_rsp_payload_data;
      end
    endcase
  end

  assign io_wb_payload_reg_data = rsp_data_remap;
  assign io_wb_payload_reg_dest = dest_temp;
  assign io_wb_valid = io_dbus_rsp_valid;
  assign io_dbus_rsp_ready = 1'b1;
  assign io_dbus_cmd_payload_wr = io_mem_payload_wr_en;
  assign io_dbus_cmd_payload_size = io_mem_payload_size;
  assign switch_Misc_l241_1 = io_mem_payload_size;
  always @(*) begin
    case(switch_Misc_l241_1)
      2'b00 : begin
        _zz_io_dbus_cmd_payload_data = {{{io_mem_payload_mem_data[7 : 0],io_mem_payload_mem_data[7 : 0]},io_mem_payload_mem_data[7 : 0]},io_mem_payload_mem_data[7 : 0]};
      end
      2'b01 : begin
        _zz_io_dbus_cmd_payload_data = {io_mem_payload_mem_data[15 : 0],io_mem_payload_mem_data[15 : 0]};
      end
      default : begin
        _zz_io_dbus_cmd_payload_data = io_mem_payload_mem_data;
      end
    endcase
  end

  assign io_dbus_cmd_payload_data = _zz_io_dbus_cmd_payload_data;
  assign io_dbus_cmd_payload_addr = io_mem_payload_mem_addr;
  assign io_dbus_cmd_valid = io_mem_valid;
  assign io_mem_ready = io_dbus_cmd_ready;
  always @(posedge clk) begin
    if(io_mem_valid) begin
      dest_temp <= io_mem_payload_reg_dest;
    end
    if(io_mem_valid) begin
      size_temp <= io_mem_payload_size;
    end
    if(io_mem_valid) begin
      op_temp <= io_mem_payload_usigned_op;
    end
    if(io_mem_valid) begin
      addr_align <= io_mem_payload_mem_addr[1 : 0];
    end
  end


endmodule

module ex_stage (
  input  wire          io_stall,
  output wire          io_jump_valid,
  input  wire          io_jump_ready,
  output wire [31:0]   io_jump_payload_new_pc,
  input  wire          io_wb_fw_fw1_en,
  input  wire [31:0]   io_wb_fw_fw1_data,
  input  wire          io_wb_fw_fw2_en,
  input  wire [31:0]   io_wb_fw_fw2_data,
  input  wire          io_ex_fw_fw1_en,
  input  wire          io_ex_fw_fw2_en,
  output wire          io_mem_valid,
  input  wire          io_mem_ready,
  output wire [4:0]    io_mem_payload_reg_dest,
  output wire [31:0]   io_mem_payload_mem_addr,
  output wire [31:0]   io_mem_payload_mem_data,
  output wire [1:0]    io_mem_payload_size,
  output wire          io_mem_payload_usigned_op,
  output wire          io_mem_payload_wr_en,
  output wire          io_ex2rf_valid,
  output wire [4:0]    io_ex2rf_payload_reg_dest,
  output wire [31:0]   io_ex2rf_payload_reg_data,
  input  wire          io_fd2x_valid,
  output wire          io_fd2x_ready,
  input  wire [19:0]   io_fd2x_payload_imm,
  input  wire [10:0]   io_fd2x_payload_module_en,
  input  wire [4:0]    io_fd2x_payload_reg_dest,
  input  wire          io_fd2x_payload_reg_dest_vld,
  input  wire [31:0]   io_rd_rsp_rd_data1,
  input  wire [31:0]   io_rd_rsp_rd_data2,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   _zz__zz_brancher_new_pc_2;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_1;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_2;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_3;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_4;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_5;
  wire       [11:0]   _zz__zz_brancher_new_pc_2_6;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_7;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_8;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_9;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_10;
  wire       [12:0]   _zz__zz_brancher_new_pc_2_11;
  wire       [31:0]   _zz__zz_brancher_new_pc_2_12;
  wire       [31:0]   _zz_brancher_branch_op;
  wire       [31:0]   _zz_brancher_branch_op_1;
  wire       [31:0]   _zz_brancher_branch_op_2;
  wire       [31:0]   _zz_brancher_branch_op_3;
  wire       [31:0]   _zz__zz_pc_regfile_regfile_wdata;
  wire       [31:0]   _zz__zz_pc_regfile_regfile_wdata_1;
  wire       [31:0]   _zz__zz_pc_regfile_regfile_wdata_2;
  wire       [31:0]   _zz__zz_alu_result_2;
  wire       [31:0]   _zz__zz_alu_result_2_1;
  wire       [31:0]   _zz__zz_alu_result_2_2;
  wire       [0:0]    _zz__zz_alu_result_2_3;
  wire       [62:0]   _zz__zz_alu_result_2_4;
  wire       [0:0]    _zz__zz_alu_result_2_5;
  wire       [31:0]   _zz__zz_alu_result_2_6;
  wire       [31:0]   _zz__zz_alu_result_2_7;
  wire       [0:0]    _zz__zz_alu_result_2_8;
  wire       [31:0]   _zz__zz_alu_result_2_9;
  wire       [11:0]   _zz__zz_alu_result_2_10;
  wire       [31:0]   _zz__zz_alu_result_2_11;
  wire       [32:0]   _zz__zz_alu_result_2_12;
  wire       [32:0]   _zz__zz_alu_result_2_13;
  wire       [31:0]   _zz_mem_addr;
  wire       [31:0]   _zz_mem_addr_1;
  wire       [31:0]   _zz_mem_addr_2;
  wire       [1:0]    fw_ctrl1;
  wire       [1:0]    fw_ctrl2;
  reg        [31:0]   io_ex2rf_payload_reg_data_regNext;
  reg        [31:0]   rs1_data;
  reg        [31:0]   io_ex2rf_payload_reg_data_regNext_1;
  reg        [31:0]   rs2_data;
  reg        [31:0]   PC;
  wire                io_jump_fire;
  wire                io_fd2x_fire;
  wire       [31:0]   brancher_PC;
  wire       [31:0]   brancher_rs1;
  wire       [31:0]   brancher_rs2;
  wire       [2:0]    brancher_select;
  wire       [19:0]   brancher_imm;
  wire       [31:0]   brancher_new_pc;
  wire                brancher_jump_pc;
  wire                _zz_brancher_new_pc;
  reg        [10:0]   _zz_brancher_new_pc_1;
  reg        [31:0]   _zz_brancher_new_pc_2;
  wire       [2:0]    switch_Misc_l241;
  reg                 brancher_branch_op;
  wire                when_ex_stage_l86;
  reg        [31:0]   _zz_io_jump_payload_new_pc;
  reg                 jumper;
  wire                when_ex_stage_l90;
  wire       [31:0]   pc_regfile_PC;
  wire       [3:0]    pc_regfile_select;
  wire       [19:0]   pc_regfile_imm;
  wire       [31:0]   pc_regfile_regfile_wdata;
  reg        [31:0]   _zz_pc_regfile_regfile_wdata;
  wire                alu_src_sel;
  wire       [31:0]   alu_rs1;
  wire       [31:0]   alu_rs2;
  wire       [19:0]   alu_imm;
  wire       [31:0]   alu_result;
  wire                _zz_alu_imm_extend;
  reg        [19:0]   _zz_alu_imm_extend_1;
  wire       [31:0]   alu_imm_extend;
  wire       [3:0]    alu_alu_op;
  wire       [31:0]   alu_op_data;
  reg        [31:0]   _zz_alu_op_data;
  wire       [2:0]    switch_Misc_l241_1;
  wire                _zz_alu_result;
  reg        [31:0]   _zz_alu_result_1;
  reg        [31:0]   _zz_alu_result_2;
  wire       [19:0]   mem_imm;
  wire       [31:0]   mem_rs1;
  wire       [31:0]   mem_rs2;
  wire       [31:0]   mem_addr;
  wire       [1:0]    mem_size;
  wire                mem_usigned_op;
  wire       [4:0]    mem_load_dest;
  wire                _zz_mem_imm_extend;
  reg        [19:0]   _zz_mem_imm_extend_1;
  wire       [31:0]   mem_imm_extend;

  assign _zz__zz_brancher_new_pc_2 = ($signed(_zz__zz_brancher_new_pc_2_1) + $signed(_zz__zz_brancher_new_pc_2_2));
  assign _zz__zz_brancher_new_pc_2_1 = {{_zz_brancher_new_pc_1,brancher_imm},1'b0};
  assign _zz__zz_brancher_new_pc_2_2 = brancher_PC;
  assign _zz__zz_brancher_new_pc_2_3 = _zz__zz_brancher_new_pc_2_4;
  assign _zz__zz_brancher_new_pc_2_4 = ($signed(_zz__zz_brancher_new_pc_2_5) + $signed(_zz__zz_brancher_new_pc_2_7));
  assign _zz__zz_brancher_new_pc_2_6 = brancher_imm[11 : 0];
  assign _zz__zz_brancher_new_pc_2_5 = {{20{_zz__zz_brancher_new_pc_2_6[11]}}, _zz__zz_brancher_new_pc_2_6};
  assign _zz__zz_brancher_new_pc_2_7 = brancher_rs1;
  assign _zz__zz_brancher_new_pc_2_9 = ($signed(_zz__zz_brancher_new_pc_2_10) + $signed(_zz__zz_brancher_new_pc_2_12));
  assign _zz__zz_brancher_new_pc_2_8 = _zz__zz_brancher_new_pc_2_9[31 : 0];
  assign _zz__zz_brancher_new_pc_2_11 = {brancher_imm[11 : 0],1'b0};
  assign _zz__zz_brancher_new_pc_2_10 = {{19{_zz__zz_brancher_new_pc_2_11[12]}}, _zz__zz_brancher_new_pc_2_11};
  assign _zz__zz_brancher_new_pc_2_12 = brancher_PC;
  assign _zz_brancher_branch_op = brancher_rs1;
  assign _zz_brancher_branch_op_1 = brancher_rs2;
  assign _zz_brancher_branch_op_2 = brancher_rs2;
  assign _zz_brancher_branch_op_3 = brancher_rs1;
  assign _zz__zz_pc_regfile_regfile_wdata = (pc_regfile_PC + {pc_regfile_imm,12'h000});
  assign _zz__zz_pc_regfile_regfile_wdata_1 = (pc_regfile_PC + 32'h00000004);
  assign _zz__zz_pc_regfile_regfile_wdata_2 = (pc_regfile_PC + 32'h00000004);
  assign _zz__zz_alu_result_2 = (_zz__zz_alu_result_2_1 + _zz__zz_alu_result_2_2);
  assign _zz__zz_alu_result_2_1 = (alu_rs1 + (alu_alu_op[3] ? (alu_op_data ^ _zz_alu_result_1) : alu_op_data));
  assign _zz__zz_alu_result_2_3 = alu_alu_op[3];
  assign _zz__zz_alu_result_2_2 = {31'd0, _zz__zz_alu_result_2_3};
  assign _zz__zz_alu_result_2_4 = ({31'd0,alu_rs1} <<< alu_op_data[4 : 0]);
  assign _zz__zz_alu_result_2_5 = ($signed(_zz__zz_alu_result_2_6) < $signed(_zz__zz_alu_result_2_7));
  assign _zz__zz_alu_result_2_6 = alu_rs1;
  assign _zz__zz_alu_result_2_7 = alu_op_data;
  assign _zz__zz_alu_result_2_8 = (alu_src_sel ? (alu_rs1 < _zz__zz_alu_result_2_9) : (alu_rs1 < alu_op_data));
  assign _zz__zz_alu_result_2_10 = alu_imm[11 : 0];
  assign _zz__zz_alu_result_2_9 = {20'd0, _zz__zz_alu_result_2_10};
  assign _zz__zz_alu_result_2_12 = ($signed(_zz__zz_alu_result_2_13) >>> alu_op_data[4 : 0]);
  assign _zz__zz_alu_result_2_11 = _zz__zz_alu_result_2_12[31 : 0];
  assign _zz__zz_alu_result_2_13 = {(alu_alu_op[3] && alu_rs1[31]),alu_rs1};
  assign _zz_mem_addr = ($signed(_zz_mem_addr_1) + $signed(_zz_mem_addr_2));
  assign _zz_mem_addr_1 = mem_rs1;
  assign _zz_mem_addr_2 = mem_imm_extend;
  assign fw_ctrl1 = {io_wb_fw_fw1_en,io_ex_fw_fw1_en};
  assign fw_ctrl2 = {io_wb_fw_fw2_en,io_ex_fw_fw2_en};
  always @(*) begin
    case(fw_ctrl1)
      2'b10 : begin
        rs1_data = io_wb_fw_fw1_data;
      end
      2'b01 : begin
        rs1_data = io_ex2rf_payload_reg_data_regNext;
      end
      2'b11 : begin
        rs1_data = io_wb_fw_fw1_data;
      end
      default : begin
        rs1_data = io_rd_rsp_rd_data1;
      end
    endcase
  end

  always @(*) begin
    case(fw_ctrl2)
      2'b10 : begin
        rs2_data = io_wb_fw_fw2_data;
      end
      2'b01 : begin
        rs2_data = io_ex2rf_payload_reg_data_regNext_1;
      end
      default : begin
        rs2_data = io_rd_rsp_rd_data2;
      end
    endcase
  end

  assign io_fd2x_ready = (io_mem_ready && (! io_stall));
  assign io_jump_fire = (io_jump_valid && io_jump_ready);
  assign io_fd2x_fire = (io_fd2x_valid && io_fd2x_ready);
  assign _zz_brancher_new_pc = brancher_imm[19];
  always @(*) begin
    _zz_brancher_new_pc_1[10] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[9] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[8] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[7] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[6] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[5] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[4] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[3] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[2] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[1] = _zz_brancher_new_pc;
    _zz_brancher_new_pc_1[0] = _zz_brancher_new_pc;
  end

  always @(*) begin
    case(brancher_select)
      3'b001 : begin
        _zz_brancher_new_pc_2 = _zz__zz_brancher_new_pc_2;
      end
      3'b010 : begin
        _zz_brancher_new_pc_2 = {_zz__zz_brancher_new_pc_2_3[31 : 1],1'b0};
      end
      3'b100 : begin
        _zz_brancher_new_pc_2 = _zz__zz_brancher_new_pc_2_8;
      end
      default : begin
        _zz_brancher_new_pc_2 = brancher_PC;
      end
    endcase
  end

  assign brancher_new_pc = _zz_brancher_new_pc_2;
  assign switch_Misc_l241 = brancher_imm[14 : 12];
  always @(*) begin
    case(switch_Misc_l241)
      3'b000 : begin
        brancher_branch_op = (brancher_rs1 == brancher_rs2);
      end
      3'b001 : begin
        brancher_branch_op = (brancher_rs1 != brancher_rs2);
      end
      3'b100 : begin
        brancher_branch_op = ($signed(_zz_brancher_branch_op) < $signed(_zz_brancher_branch_op_1));
      end
      3'b101 : begin
        brancher_branch_op = ($signed(_zz_brancher_branch_op_2) <= $signed(_zz_brancher_branch_op_3));
      end
      3'b110 : begin
        brancher_branch_op = (brancher_rs1 < brancher_rs2);
      end
      3'b111 : begin
        brancher_branch_op = (brancher_rs2 <= brancher_rs1);
      end
      default : begin
        brancher_branch_op = 1'b0;
      end
    endcase
  end

  assign brancher_jump_pc = (((brancher_branch_op && brancher_select[2]) || brancher_select[1]) || brancher_select[0]);
  assign brancher_PC = PC;
  assign brancher_rs1 = rs1_data;
  assign brancher_rs2 = rs2_data;
  assign brancher_select = {{io_fd2x_payload_module_en[1],io_fd2x_payload_module_en[3]},io_fd2x_payload_module_en[5]};
  assign brancher_imm = io_fd2x_payload_imm;
  assign when_ex_stage_l86 = (brancher_jump_pc && io_fd2x_fire);
  assign io_jump_payload_new_pc = _zz_io_jump_payload_new_pc;
  assign when_ex_stage_l90 = (brancher_jump_pc && io_fd2x_fire);
  assign io_jump_valid = jumper;
  always @(*) begin
    case(pc_regfile_select)
      4'b0001 : begin
        _zz_pc_regfile_regfile_wdata = {pc_regfile_imm,12'h000};
      end
      4'b0010 : begin
        _zz_pc_regfile_regfile_wdata = _zz__zz_pc_regfile_regfile_wdata;
      end
      4'b0100 : begin
        _zz_pc_regfile_regfile_wdata = _zz__zz_pc_regfile_regfile_wdata_1;
      end
      4'b1000 : begin
        _zz_pc_regfile_regfile_wdata = _zz__zz_pc_regfile_regfile_wdata_2;
      end
      default : begin
        _zz_pc_regfile_regfile_wdata = {pc_regfile_imm,12'h000};
      end
    endcase
  end

  assign pc_regfile_regfile_wdata = _zz_pc_regfile_regfile_wdata;
  assign pc_regfile_PC = PC;
  assign pc_regfile_select = {{{io_fd2x_payload_module_en[5],io_fd2x_payload_module_en[3]},io_fd2x_payload_module_en[9]},io_fd2x_payload_module_en[4]};
  assign pc_regfile_imm = io_fd2x_payload_imm;
  assign _zz_alu_imm_extend = alu_imm[11];
  always @(*) begin
    _zz_alu_imm_extend_1[19] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[18] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[17] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[16] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[15] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[14] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[13] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[12] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[11] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[10] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[9] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[8] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[7] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[6] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[5] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[4] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[3] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[2] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[1] = _zz_alu_imm_extend;
    _zz_alu_imm_extend_1[0] = _zz_alu_imm_extend;
  end

  assign alu_imm_extend = {_zz_alu_imm_extend_1,alu_imm[11 : 0]};
  assign alu_alu_op = (alu_src_sel ? {1'b0,alu_imm[14 : 12]} : {alu_imm[13],alu_imm[7 : 5]});
  always @(*) begin
    case(alu_src_sel)
      1'b1 : begin
        _zz_alu_op_data = alu_imm_extend;
      end
      default : begin
        _zz_alu_op_data = alu_rs2;
      end
    endcase
  end

  assign alu_op_data = _zz_alu_op_data;
  assign switch_Misc_l241_1 = alu_alu_op[2 : 0];
  assign _zz_alu_result = alu_alu_op[3];
  always @(*) begin
    _zz_alu_result_1[31] = _zz_alu_result;
    _zz_alu_result_1[30] = _zz_alu_result;
    _zz_alu_result_1[29] = _zz_alu_result;
    _zz_alu_result_1[28] = _zz_alu_result;
    _zz_alu_result_1[27] = _zz_alu_result;
    _zz_alu_result_1[26] = _zz_alu_result;
    _zz_alu_result_1[25] = _zz_alu_result;
    _zz_alu_result_1[24] = _zz_alu_result;
    _zz_alu_result_1[23] = _zz_alu_result;
    _zz_alu_result_1[22] = _zz_alu_result;
    _zz_alu_result_1[21] = _zz_alu_result;
    _zz_alu_result_1[20] = _zz_alu_result;
    _zz_alu_result_1[19] = _zz_alu_result;
    _zz_alu_result_1[18] = _zz_alu_result;
    _zz_alu_result_1[17] = _zz_alu_result;
    _zz_alu_result_1[16] = _zz_alu_result;
    _zz_alu_result_1[15] = _zz_alu_result;
    _zz_alu_result_1[14] = _zz_alu_result;
    _zz_alu_result_1[13] = _zz_alu_result;
    _zz_alu_result_1[12] = _zz_alu_result;
    _zz_alu_result_1[11] = _zz_alu_result;
    _zz_alu_result_1[10] = _zz_alu_result;
    _zz_alu_result_1[9] = _zz_alu_result;
    _zz_alu_result_1[8] = _zz_alu_result;
    _zz_alu_result_1[7] = _zz_alu_result;
    _zz_alu_result_1[6] = _zz_alu_result;
    _zz_alu_result_1[5] = _zz_alu_result;
    _zz_alu_result_1[4] = _zz_alu_result;
    _zz_alu_result_1[3] = _zz_alu_result;
    _zz_alu_result_1[2] = _zz_alu_result;
    _zz_alu_result_1[1] = _zz_alu_result;
    _zz_alu_result_1[0] = _zz_alu_result;
  end

  always @(*) begin
    case(switch_Misc_l241_1)
      3'b000 : begin
        _zz_alu_result_2 = _zz__zz_alu_result_2[31 : 0];
      end
      3'b001 : begin
        _zz_alu_result_2 = _zz__zz_alu_result_2_4[31 : 0];
      end
      3'b010 : begin
        _zz_alu_result_2 = {31'd0, _zz__zz_alu_result_2_5};
      end
      3'b011 : begin
        _zz_alu_result_2 = {31'd0, _zz__zz_alu_result_2_8};
      end
      3'b100 : begin
        _zz_alu_result_2 = (alu_rs1 ^ alu_op_data);
      end
      3'b101 : begin
        _zz_alu_result_2 = _zz__zz_alu_result_2_11;
      end
      3'b110 : begin
        _zz_alu_result_2 = (alu_rs1 | alu_op_data);
      end
      default : begin
        _zz_alu_result_2 = (alu_rs1 & alu_op_data);
      end
    endcase
  end

  assign alu_result = _zz_alu_result_2;
  assign alu_src_sel = io_fd2x_payload_module_en[10];
  assign alu_imm = io_fd2x_payload_imm;
  assign alu_rs1 = rs1_data;
  assign alu_rs2 = rs2_data;
  assign _zz_mem_imm_extend = mem_imm[11];
  always @(*) begin
    _zz_mem_imm_extend_1[19] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[18] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[17] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[16] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[15] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[14] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[13] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[12] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[11] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[10] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[9] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[8] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[7] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[6] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[5] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[4] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[3] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[2] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[1] = _zz_mem_imm_extend;
    _zz_mem_imm_extend_1[0] = _zz_mem_imm_extend;
  end

  assign mem_imm_extend = {_zz_mem_imm_extend_1,mem_imm[11 : 0]};
  assign mem_addr = _zz_mem_addr;
  assign mem_usigned_op = mem_imm[14];
  assign mem_size = mem_imm[13 : 12];
  assign mem_load_dest = mem_imm[19 : 15];
  assign mem_imm = io_fd2x_payload_imm;
  assign mem_rs1 = rs1_data;
  assign mem_rs2 = rs2_data;
  assign io_ex2rf_payload_reg_data = (io_fd2x_payload_reg_dest_vld ? pc_regfile_regfile_wdata : alu_result);
  assign io_ex2rf_payload_reg_dest = (io_fd2x_payload_reg_dest_vld ? io_fd2x_payload_reg_dest : io_fd2x_payload_imm[19 : 15]);
  assign io_ex2rf_valid = (io_fd2x_fire && ((io_fd2x_payload_module_en[10] || io_fd2x_payload_module_en[6]) || io_fd2x_payload_reg_dest_vld));
  assign io_mem_payload_size = mem_size;
  assign io_mem_payload_usigned_op = mem_usigned_op;
  assign io_mem_payload_reg_dest = mem_load_dest;
  assign io_mem_payload_wr_en = io_fd2x_payload_module_en[8];
  assign io_mem_payload_mem_addr = mem_addr;
  assign io_mem_payload_mem_data = rs2_data;
  assign io_mem_valid = ((io_fd2x_fire && (io_fd2x_payload_module_en[8] || io_fd2x_payload_module_en[2])) && (! io_jump_valid));
  always @(posedge clk) begin
    io_ex2rf_payload_reg_data_regNext <= io_ex2rf_payload_reg_data;
    io_ex2rf_payload_reg_data_regNext_1 <= io_ex2rf_payload_reg_data;
    if(when_ex_stage_l86) begin
      _zz_io_jump_payload_new_pc <= brancher_new_pc;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      PC <= 32'h80000000;
      jumper <= 1'b0;
    end else begin
      if(io_jump_fire) begin
        PC <= io_jump_payload_new_pc;
      end else begin
        if(io_fd2x_fire) begin
          PC <= (PC + 32'h00000004);
        end
      end
      if(io_jump_fire) begin
        jumper <= 1'b0;
      end else begin
        if(when_ex_stage_l90) begin
          jumper <= 1'b1;
        end
      end
    end
  end


endmodule

module fd_stage (
  output wire          io_ibus_cmd_valid,
  input  wire          io_ibus_cmd_ready,
  output wire [31:0]   io_ibus_cmd_payload_pc,
  input  wire          io_ibus_rsp_valid,
  output wire          io_ibus_rsp_ready,
  input  wire [31:0]   io_ibus_rsp_payload_instruction,
  input  wire          io_stall,
  input  wire          io_jump_valid,
  output wire          io_jump_ready,
  input  wire [31:0]   io_jump_payload_new_pc,
  output wire          io_rd_cmd_valid,
  output wire [4:0]    io_rd_cmd_payload_rd_addr1,
  output wire [4:0]    io_rd_cmd_payload_rd_addr2,
  output wire          io_fd2x_valid,
  input  wire          io_fd2x_ready,
  output wire [19:0]   io_fd2x_payload_imm,
  output wire [10:0]   io_fd2x_payload_module_en,
  output wire [4:0]    io_fd2x_payload_reg_dest,
  output wire          io_fd2x_payload_reg_dest_vld,
  input  wire          clk,
  input  wire          reset
);

  wire       [14:0]   _zz_operation_1;
  reg        [31:0]   PC;
  wire                io_jump_fire;
  wire                io_ibus_cmd_fire;
  wire                inner_stream_valid;
  reg                 inner_stream_ready;
  wire       [31:0]   inner_stream_payload_instruction;
  wire                inner_stream_fire;
  wire       [31:0]   _zz_operation;
  reg        [10:0]   module_en;
  reg        [19:0]   operation;
  wire       [6:0]    switch_instruction_decode_l79;
  reg                 inner_stream_thrown_valid;
  wire                inner_stream_thrown_ready;
  wire       [31:0]   inner_stream_thrown_payload_instruction;
  reg                 resetDone;

  assign _zz_operation_1 = {{{{_zz_operation[14 : 12],_zz_operation[31]},_zz_operation[7]},_zz_operation[30 : 25]},_zz_operation[11 : 8]};
  assign io_jump_fire = (io_jump_valid && io_jump_ready);
  assign io_ibus_cmd_fire = (io_ibus_cmd_valid && io_ibus_cmd_ready);
  assign io_jump_ready = io_ibus_cmd_ready;
  assign inner_stream_valid = io_ibus_rsp_valid;
  assign io_ibus_rsp_ready = inner_stream_ready;
  assign inner_stream_payload_instruction = io_ibus_rsp_payload_instruction;
  assign io_rd_cmd_payload_rd_addr1 = inner_stream_payload_instruction[19 : 15];
  assign io_rd_cmd_payload_rd_addr2 = inner_stream_payload_instruction[24 : 20];
  assign inner_stream_fire = (inner_stream_valid && inner_stream_ready);
  assign io_rd_cmd_valid = inner_stream_fire;
  assign _zz_operation = inner_stream_payload_instruction;
  always @(*) begin
    module_en = 11'h000;
    case(switch_instruction_decode_l79)
      7'h73 : begin
        module_en[0] = 1'b1;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h33 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b1;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h23 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b1;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h63 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b1;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h6f : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b1;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h37 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b1;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h17 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b1;
        module_en[10] = 1'b0;
      end
      7'h67 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b1;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h03 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b1;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      7'h13 : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b0;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b1;
      end
      7'h0f : begin
        module_en[0] = 1'b0;
        module_en[1] = 1'b0;
        module_en[2] = 1'b0;
        module_en[3] = 1'b0;
        module_en[4] = 1'b0;
        module_en[5] = 1'b0;
        module_en[6] = 1'b0;
        module_en[7] = 1'b1;
        module_en[8] = 1'b0;
        module_en[9] = 1'b0;
        module_en[10] = 1'b0;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    operation = 20'h00000;
    case(switch_instruction_decode_l79)
      7'h73 : begin
        operation = {{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 20]};
      end
      7'h33 : begin
        operation = {{{_zz_operation[11 : 7],_zz_operation[31 : 25]},_zz_operation[14 : 12]},5'h00};
      end
      7'h23 : begin
        operation = {{{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 25]},_zz_operation[11 : 7]};
      end
      7'h63 : begin
        operation = {5'd0, _zz_operation_1};
      end
      7'h6f : begin
        operation = {{{_zz_operation[31],_zz_operation[19 : 12]},_zz_operation[20]},_zz_operation[30 : 21]};
      end
      7'h37 : begin
        operation = _zz_operation[31 : 12];
      end
      7'h17 : begin
        operation = _zz_operation[31 : 12];
      end
      7'h67 : begin
        operation = {{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 20]};
      end
      7'h03 : begin
        operation = {{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 20]};
      end
      7'h13 : begin
        operation = {{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 20]};
      end
      7'h0f : begin
        operation = {{_zz_operation[11 : 7],_zz_operation[14 : 12]},_zz_operation[31 : 20]};
      end
      default : begin
      end
    endcase
  end

  assign switch_instruction_decode_l79 = _zz_operation[6 : 0];
  always @(*) begin
    inner_stream_thrown_valid = inner_stream_valid;
    if(io_jump_valid) begin
      inner_stream_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    inner_stream_ready = inner_stream_thrown_ready;
    if(io_jump_valid) begin
      inner_stream_ready = 1'b1;
    end
  end

  assign inner_stream_thrown_payload_instruction = inner_stream_payload_instruction;
  assign io_fd2x_valid = inner_stream_thrown_valid;
  assign inner_stream_thrown_ready = io_fd2x_ready;
  assign io_fd2x_payload_imm = operation;
  assign io_fd2x_payload_module_en = module_en;
  assign io_fd2x_payload_reg_dest = inner_stream_payload_instruction[11 : 7];
  assign io_fd2x_payload_reg_dest_vld = (((module_en[5] || module_en[3]) || module_en[9]) || module_en[4]);
  assign io_ibus_cmd_valid = (resetDone && (! io_stall));
  assign io_ibus_cmd_payload_pc = (io_jump_valid ? io_jump_payload_new_pc : PC);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      PC <= 32'h80000000;
      resetDone <= 1'b0;
    end else begin
      if(io_jump_fire) begin
        PC <= (io_jump_payload_new_pc + 32'h00000004);
      end else begin
        if(io_ibus_cmd_fire) begin
          PC <= (PC + 32'h00000004);
        end
      end
      resetDone <= 1'b1;
    end
  end


endmodule

module regfiles (
  input  wire          io_rd_cmd_valid,
  input  wire [4:0]    io_rd_cmd_payload_rd_addr1,
  input  wire [4:0]    io_rd_cmd_payload_rd_addr2,
  output wire [31:0]   io_rd_rsp_rd_data1,
  output wire [31:0]   io_rd_rsp_rd_data2,
  input  wire          io_wr_valid,
  input  wire [31:0]   io_wr_payload_reg_data,
  input  wire [4:0]    io_wr_payload_reg_addr,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   _zz_regFile_port0;
  reg        [31:0]   _zz_regFile_port1;
  wire       [4:0]    _zz_regFile_port;
  reg                 _zz_1;
  wire                when_regfiles_l36;
  reg [31:0] regFile [0:31];

  assign _zz_regFile_port = io_wr_payload_reg_addr;
  initial begin
    $readmemb("axi_nina_riscv.v_toplevel_cpu_regfile_regFile.bin",regFile);
  end
  always @(posedge clk) begin
    if(io_rd_cmd_valid) begin
      _zz_regFile_port0 <= regFile[io_rd_cmd_payload_rd_addr1];
    end
  end

  always @(posedge clk) begin
    if(io_rd_cmd_valid) begin
      _zz_regFile_port1 <= regFile[io_rd_cmd_payload_rd_addr2];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      regFile[_zz_regFile_port] <= io_wr_payload_reg_data;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_regfiles_l36) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_rd_rsp_rd_data1 = _zz_regFile_port0;
  assign io_rd_rsp_rd_data2 = _zz_regFile_port1;
  assign when_regfiles_l36 = (io_wr_valid && (io_wr_payload_reg_addr != 5'h00));

endmodule

//StreamFifo_2 replaced by StreamFifo_3

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module UartCtrlRx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  input  wire          io_rxd,
  output wire          io_rts,
  output reg           io_error,
  output wire          io_break,
  input  wire          clk,
  input  wire          reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC_1 io_rxd_buffercc (
    .io_dataIn  (io_rxd                    ), //i
    .io_dataOut (io_rxd_buffercc_io_dataOut), //o
    .clk        (clk                       ), //i
    .reset      (reset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h00;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h00;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  input  wire          io_cts,
  output wire          io_txd,
  input  wire          io_break,
  input  wire          clk,
  input  wire          reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  wire       [2:0]    _zz_stateMachine_state;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  reg [47:0] _zz_stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_stateMachine_state)
      UartCtrlTxState_IDLE : _zz_stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : _zz_stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : _zz_stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : _zz_stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : _zz_stateMachine_state_string = "STOP  ";
      default : _zz_stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign _zz_stateMachine_state = (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
  assign io_txd = _zz_io_txd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= _zz_stateMachine_state;
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge clk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          clk,
  input  wire          reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
