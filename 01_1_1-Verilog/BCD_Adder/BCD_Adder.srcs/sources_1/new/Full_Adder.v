`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2025 02:50:36 AM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
      input x,y,cin,
      output s,cout
    );
    
    wire c1,c2,s1;
    
    half_adder HA1(
       .x(x),
       .y(y),
       .c(c1),
       .s(s1)
    );
    
    half_adder HA2(
       .x(cin),
       .y(s1),
       .c(c2),
       .s(s)
    );
    
    assign cout = c1  | c2;
endmodule
