`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 19:10:15
// Design Name: 
// Module Name: ddr_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ddr_top(
    // clk & rst
    input wire clk100m,
    input wire fpga_rst_n,
    input wire mcu_rst_n,

    // qspi
    output wire qspi0_cs,
    output wire qspi0_sck,
    inout wire [3:0] qspi0_dq,

    // gpio
    inout wire [31:0] gpioA,
    inout wire [31:0] gpioB,

    // jtag
    inout wire mcu_TDO,
    inout wire mcu_TCK,
    inout wire mcu_TDI,
    inout wire mcu_TMS,

    // pmu wakeup
    inout wire pmu_paden,
    inout wire pmu_padrst,
    inout wire mcu_wakeup
    );
    
    // soc clock & reset
    wire clk16m, clk32k;
    wire reset_periph;
    wire mmcm_locked;
    wire mmcm_rst_n;

    // soc clock
    parameter __32768_prescale = 16000000/32768;
    wire mmcm_clk_out;
    reg [9:0] mmcm_clk32_cnt;
    soc_mmcm soc_mmcm_ins(
        .clk_out1(mmcm_clk_out),
        .reset(mmcm_rst_n),
        .locked(mmcm_locked),
        .clk_in1(clk100m)
        );
    assign mmcm_rst_n = fpga_rst_n & mcu_rst_n;     //!( !fpga_rst_n + !mcu_rst_n )
    assign clk16m = mmcm_locked?mmcm_clk_out:1'b0;
    always @ (posedge clk16m or negedge mmcm_rst_n) begin
        if(clk32_cnt<__32768_prescale)
            clk32_cnt <= clk32_cnt + 1;
        else
            clk32_cnt <= 0;
    end
    assign clk32k = clk32_cnt >= __32768_prescale/2;
    
    // system reset generator
    reset_sys reset_sys_ins(
        .slowest_sync_clk(clk16m),
        .ext_reset_in(mmcm_rst_n),
        .aux_reset_in(1'b1),
        .mb_debug_sys_rst(1'b0),
        .dcm_locked(mmcm_locked),
        .bus_struct_reset(),
        .peripheral_reset(reset_periph),
        .interconnect_aresetn(),
        .peripheral_aresetn()
    );

    // QSPI0
    wire [3:0] qspi0_ui_dq_o;
    wire [3:0] qspi0_ui_dq_oe;
    wire [3:0] qspi0_ui_dq_i;
    IOBUF_VECTOR #(WIDTH=4) qspi_iobuf(
        .en(qspi0_ui_dq_oe),
        .in(qspi0_ui_dq_i),
        .out(qspi0_ui_dq_o),
        .pin_pad(qspi_dq)
    );


endmodule
