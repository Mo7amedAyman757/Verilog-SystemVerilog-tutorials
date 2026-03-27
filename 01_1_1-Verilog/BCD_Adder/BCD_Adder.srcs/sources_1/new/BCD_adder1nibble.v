`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 01:53:21 AM
// Design Name: 
// Module Name: BCD_adder1nibble
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


module BCD_adder1nibble (
        input [3:0] A,B,
        input cin,
        output cout,
        output [3:0]S
    );
    
    wire carry1,cs;
    wire [3:0] s,correction;
    
    Full_adder4bit BCD1(
       .x(A),
       .y(B),
       .cin(1'b0),
       .cout(carry1),
       .s(s)
    );

   correction_signal CS(
      .s1(s[1]),
      .s2(s[2]),
      .s3(s[3]),
      .carry1(carry1),
      .cs(cs)
   );
  
  assign correction = {1'b0,cs,cs,1'b0};
  
     Full_adder4bit BCD2(
       .x(s),
       .y(correction),
       .cin(1'b0),
       .s(S)
    );
    
    assign cout = cs;
endmodule

