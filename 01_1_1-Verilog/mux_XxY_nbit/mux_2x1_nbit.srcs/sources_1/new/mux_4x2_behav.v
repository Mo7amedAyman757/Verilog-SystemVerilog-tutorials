`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 07:36:13 PM
// Design Name: 
// Module Name: mux_4x2_behav
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


module mux_4x2_behav(
       input [3:0] x,
       input [1:0] s,
       output reg z
    );
    
    always @(x,s)
    begin
  
     case(s)
       2'b00 : z = x[0];
       2'b01 : z = x[1];
       2'b10 : z = x[2];
       2'b11 : z = x[3];
       default: z =1'b0;
     endcase 
    end
endmodule
