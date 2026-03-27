`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 05:58:15 PM
// Design Name: 
// Module Name: bram_synch_dual_port
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


module bram_synch_dual_port
    #(parameter ADDR_WIDTH =10, DATA_WIDTH= 8)(
        input clk,
        input W_a, W_b,
        input [ADDR_WIDTH - 1: 0] addr_a, addr_b,
        input [DATA_WIDTH - 1: 0] din_a , din_b,
        output reg [DATA_WIDTH - 1: 0] dout_a, dout_b
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0 : 2**ADDR_WIDTH - 1];
    
    //ports
    
    //porta
    always @(posedge clk)
    begin
        if(W_a)
            memory[addr_a] <= din_a;    
        dout_a <= memory[addr_a];     
    end
    
    //portb
    always @(posedge clk)
    begin
        if(W_b)
            memory[addr_b] <= din_b;    
        dout_b <= memory[addr_b];     
    end
    
    
endmodule
