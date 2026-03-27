`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 06:11:28 PM
// Design Name: 
// Module Name: bram_sync_one_port
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


module bram_sync_one_port#(parameter ADDR_WIDTH =10, DATA_WIDTH= 8)(
        input clk,
        input We,
        input [ADDR_WIDTH - 1: 0] addr,
        input [DATA_WIDTH - 1: 0] din_w,
        output reg [DATA_WIDTH - 1: 0] dout
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0 : 2**ADDR_WIDTH - 1];
    
    //ports

    always @(posedge clk)
    begin
        if(We)
            memory[addr] <= din_w;    
        dout <= memory[addr];     
    end
 
endmodule
