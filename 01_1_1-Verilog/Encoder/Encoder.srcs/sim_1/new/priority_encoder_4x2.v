`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 02:47:30 AM
// Design Name: 
// Module Name: priority_encoder_4x2
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


module priority_encoder_4x2(
       input [3:0] x,
       output z,
       output reg[1:0] y
    );
    
    assign z = |x;
    
    always @(x)
    begin
       y = 2'bxx;
       casex(x)  // used for selection that has a bunch of x 
        4'b0001: y = 2'b00;
        4'b001x: y = 2'b01;
        4'b01xx: y = 2'b10;
        4'b1xxx: y = 2'b11;
        default: y =2'bxx;
       endcase
    end
    
    
endmodule
