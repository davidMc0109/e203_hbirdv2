`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 19:10:15
// Design Name: 
// Module Name: IOBUF
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


module IOBUF(
    input en,
    input in,
    output out,
    inout pin_pad);

    assign pin_pad = en? out: 1'bz;
    assign in = en? out: pin_pad;

endmodule


module IOBUF_VECTOR #(parameter WIDTH=32)(
    input   [WIDTH-1:0]   en,
    input   [WIDTH-1:0]   in,
    output  [WIDTH-1:0]   out,
    inout   [WIDTH-1:0]   pin_pad);

    genvar i;
    generate 
        for(i=0; i<WIDTH; i=i+1) begin : units
            IOBUF unit(
                .en(en[i]),
                .in(in[i]),
                .out(out[i]),
                .pin_pad(pin_pad[i])
            );
        end
    endgenerate

endmodule
