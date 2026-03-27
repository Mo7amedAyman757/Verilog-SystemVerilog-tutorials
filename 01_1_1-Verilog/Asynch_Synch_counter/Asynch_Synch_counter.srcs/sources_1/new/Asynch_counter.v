`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:06:24 PM
// Design Name: 
// Module Name: Asynch_counter
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


module Asynch_counter(
       input clk,
       input reset_n,
       output [3 : 0] Q
    );
    
   clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_100MHZ(clk_100MHZ),     // output clk_100MHZ
    .clk_25MHZ(clk_25MHZ),     // output clk_25MHZ
    .clk_400MHZ(clk_400MHZ),     // output clk_400MHZ
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk)      // input clk_in1
);

    T_FF FF0(
        .T(1'b1),
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q[0])
    );
    
    T_FF FF1(
        .T(1'b1),
        .clk(~Q[0]),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    
     T_FF FF2(
        .T(1'b1),
        .clk(~Q[1]),
        .reset_n(reset_n),
        .Q(Q[2])
    );
    
     T_FF FF3(
        .T(1'b1),
        .clk(~Q[2]),
        .reset_n(reset_n),
        .Q(Q[3])
    );
endmodule
