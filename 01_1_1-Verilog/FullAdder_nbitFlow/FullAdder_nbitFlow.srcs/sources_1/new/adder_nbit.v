`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 11:29:16 PM
// Design Name: 
// Module Name: adder_nbit
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


module adder_nbit #(parameter n = 4)(
      input [n-1 : 0] x,y,
      input cin,
      output [n-1 : 0] s,
      output cout
    );
    
    wire [n  : 0] c;
    
    assign c[0] = cin;
    assign cout = c[n];
    
    generate 
      genvar k;
      for (k =0; k < n; k = k + 1)
      begin 
          full_adder FA4 (
             .x(x[k]),
             .y(y[k]),
            .cin(c[k]),
            .s(s[k]),
            .cout(c[k + 1])
          );
    
      end
    endgenerate
    
endmodule
