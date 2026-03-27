`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 06:55:10 PM
// Design Name: 
// Module Name: mux_2x1_struc
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


module mux_2x1_struc(
       input x,y,
       input s,
       output z
    );
    
    assign z = (x & ~s) | (y & s);
    
endmodule
