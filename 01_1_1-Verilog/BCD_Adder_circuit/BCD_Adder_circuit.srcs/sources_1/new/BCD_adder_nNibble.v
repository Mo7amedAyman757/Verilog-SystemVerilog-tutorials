`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 02:46:08 AM
// Design Name: 
// Module Name: BCD_adder_nNibble
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


module BCD_adder_nNibble
    #(parameter n = 3) // number of nibbles (dafault 4 digits)
    ( 
         input [n * 4 -1 : 0] A,B,
         output cout,
         output [n *4 -1 : 0] S
    );
    
    wire [n  : 0] c; // carry between nibbles
    assign c[0] = 1'b0;
    
    generate
      genvar k;
      for(k = 0; k < n; k = k + 1)
       begin
         
         BCD_adder1nibble BCD(
            .A(A[k*4 +: 4]),
            .B(B[k*4 +: 4]),
            .cin(c[k]),
            .cout(c[k+1]),
            .S(S[k*4 +: 4])
         ); 
         
       end
    endgenerate
    
    assign cout = c[n];
    
endmodule
