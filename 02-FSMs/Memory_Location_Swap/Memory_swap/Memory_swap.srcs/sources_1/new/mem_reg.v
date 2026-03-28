`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 08:19:31 PM
// Design Name: 
// Module Name: mem_reg
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


module mem_reg
    #(parameter DATA_WIDTH = 8, ADDRESS_BITS = 7)(
    input clk,
    input reset_n,
    input WE,
    input [ADDRESS_BITS -1: 0] address_w,address_r,
    input [DATA_WIDTH - 1: 0] data_w,
    output [DATA_WIDTH - 1: 0] data_r
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2** ADDRESS_BITS - 1];
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            memory[address_w] <= {DATA_WIDTH{1'b0}}; 
        else
            //Synchronous write port
            if(WE)
                memory[address_w] <= data_w;         
    end
    
    //Asynchronous read port
    assign data_r = memory[address_r];
    
endmodule
