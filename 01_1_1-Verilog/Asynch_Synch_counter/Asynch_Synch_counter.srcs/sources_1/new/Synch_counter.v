`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:23:24 PM
// Design Name: 
// Module Name: Synch_counter
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


module Synch_counter(
       input clk,
       input reset_n,
       output [3 : 0] Q
    );
     
     wire Q0_next, Q1_next, Q2_next, Q3_next; 
     
     assign Q0_next = 1'b1;
     T_FF FF0(
        .T(Q0_next),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q[0])
    );
    
    assign Q1_next = Q0_next & Q[0];
    T_FF FF1(
        .T(Q1_next),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    
     assign Q2_next = Q1_next & Q[1];
     T_FF FF2(
        .T(Q2_next),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q[2])
    );
    
     assign Q3_next = Q2_next & Q[2];
     T_FF FF3(
        .T(Q3_next),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q[3])
    );
    
endmodule
