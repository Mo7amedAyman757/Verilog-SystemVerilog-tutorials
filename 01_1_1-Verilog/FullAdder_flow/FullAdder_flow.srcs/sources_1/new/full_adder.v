`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:49:11 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
      input x,y,cin,
      output s, cout
    );
    
    wire c1,s1,c2;
    
    half_adder F0(
      .x(x),
      .y(y),
      .c(c1),
      .s(s1)
    );
    
     half_adder F1(
      .x(cin),
      .y(s1),
      .c(c2),
      .s(s)
    );
    
    assign cout = c1 | c2;
    
endmodule
