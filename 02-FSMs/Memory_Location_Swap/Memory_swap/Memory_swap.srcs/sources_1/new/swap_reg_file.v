`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 09:54:10 PM
// Design Name: 
// Module Name: swap_reg_file
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


module swap_reg_file
    #(parameter DATA_WIDTH = 8, ADDRESS_BITS = 7)(
        input clk,
        input reset_n,
        input WE,
        input swap,
        input [DATA_WIDTH-1: 0] data_w,
        input [ADDRESS_BITS-1 :0] address_w, address_r,
        input [ADDRESS_BITS-1 :0] address_A, address_B,
        output [DATA_WIDTH-1: 0] data_r
    );
    
    wire W;
    wire [1:0] sel;
    wire [ADDRESS_BITS-1 :0] MUXA, MUXB;
    
    swap_FSM F(
        .clk(clk),
        .reset_n(reset_n),
        .swap(swap),
        .sel(sel),
        .w(W)
    );
    
    MUX_4x1_nbits #(.BITS(ADDRESS_BITS)) muxA(
        .w0(address_r),
        .w1(address_A),
        .w2(address_B),
        .w3({ADDRESS_BITS{1'b0}}),
        .se(sel),
        .y(MUXA)
    );
    
     MUX_4x1_nbits #(.BITS(ADDRESS_BITS)) muxB(
        .w0(address_w),
        .w1({ADDRESS_BITS{1'b0}}),
        .w2(address_A),
        .w3(address_B),
        .se(sel),
        .y(MUXB)
    );
    
    
    mem_reg #(.DATA_WIDTH(DATA_WIDTH), .ADDRESS_BITS(ADDRESS_BITS)) mem(
        .clk(clk),
        .reset_n(reset_n),
        .WE(W? 1'b1 : WE),
        .address_w(MUXB),
        .address_r(MUXA), 
        .data_w(W? data_r: data_w),
        .data_r(data_r)   
    );
    
endmodule
