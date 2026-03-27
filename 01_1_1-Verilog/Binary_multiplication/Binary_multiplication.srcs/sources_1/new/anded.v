`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 04:09:11 AM
// Design Name: 
// Module Name: anded
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


module anded(
       input [3:0]A,
       input B,
       output[3:0] And_res
    );
    
    assign And_res = A & {4{B}};
    
endmodule
