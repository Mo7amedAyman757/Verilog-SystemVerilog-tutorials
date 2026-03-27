`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 06:08:35 PM
// Design Name: 
// Module Name: bram_simple_synch_dual_port
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


module bram_simple_synch_dual_port
#(parameter ADDR_WIDTH =10, DATA_WIDTH= 8)(
        input clk,
        input We,
        input [ADDR_WIDTH - 1: 0] addr_r, addr_w,
        input [DATA_WIDTH - 1: 0] din_w,
        output reg [DATA_WIDTH - 1: 0] dout
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0 : 2**ADDR_WIDTH - 1];
    
    //ports

    always @(posedge clk)
    begin
        if(We)
            memory[addr_w] <= din_w;    
        dout <= memory[addr_r];     
    end
 
endmodule
