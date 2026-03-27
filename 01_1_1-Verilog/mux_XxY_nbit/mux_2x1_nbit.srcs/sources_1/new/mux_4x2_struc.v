`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 07:08:20 PM
// Design Name: 
// Module Name: mux_4x2_struc
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

module mux_4x2_struc(
       input [3:0] x,
       input [1:0] s,
       output z
    );
    
    assign z = x[0] & ~s[0] & ~s[1] | x[1] & s[0] & ~s[1] | x[2] & ~s[0] & s[1] | x[3] & s[0] & s[1];
    
   
endmodule
