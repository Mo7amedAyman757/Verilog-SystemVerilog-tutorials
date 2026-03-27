`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 02:44:36 AM
// Design Name: 
// Module Name: full_Adder4bit
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


module Full_adder4bit(
       input[3:0] x,y,
       input cin,
       output cout,
       output[3:0] s
    );
    
    wire[4:0] c;
    assign c[0] = cin;
    assign cout = c[4];
    
    generate
      genvar k;
      for(k = 0; k < 4; k = k + 1)
        begin
          Full_Adder FA4(
            .x(x[k]),
            .y(y[k]),
            .cin(c[k]),
            .cout(c[k + 1]),
            .s(s[k])
          ); 
        end
    endgenerate
    
endmodule
