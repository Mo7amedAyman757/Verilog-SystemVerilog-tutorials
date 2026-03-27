`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 07:04:25 PM
// Design Name: 
// Module Name: mux_2x1_behav
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


module mux_2x1_behav(
       input x,y,
       input s,
       output reg z
    );
    
    always @(x , y, s)
    begin
     z = 1'b0;
    case(s)
      1'b0: z = x;
      1'b1: z = y;
      //default: z = 1'bx;
    endcase
    
    end
    
endmodule
