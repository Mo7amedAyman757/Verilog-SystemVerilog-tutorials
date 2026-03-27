`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 12:33:15 AM
// Design Name: 
// Module Name: decoder_2x4_struc
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


module decoder_2x4_struc(
          input x,y,
          output [0:3] z
    );
    
    assign z[0] = (~x & ~y) ;
    assign z[1] = (x & ~y) ;
    assign z[2] = (~x & y) ;
    assign z[3] = (x & y);
    
endmodule
