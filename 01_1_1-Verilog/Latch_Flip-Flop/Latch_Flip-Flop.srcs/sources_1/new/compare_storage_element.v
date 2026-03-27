`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 01:46:11 AM
// Design Name: 
// Module Name: compare_storage_element
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


module compare_storage_element(
          input D,
          input clk,
          output  Q_a, Q_b, Q_c
    );
    
    D_latch L0(
        .D(D),
        .clk(clk),
        .Q(Q_a)
    );
    
    D_FF_pos FF0(
        .D(D),
        .clk(clk),
        .Q(Q_b)
    );
    
    D_FF_neg FF1(
        .D(D),
        .clk(clk),
        .Q(Q_c)
    );
endmodule
