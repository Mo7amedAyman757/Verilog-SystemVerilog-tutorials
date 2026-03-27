`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 12:08:53 AM
// Design Name: 
// Module Name: Mux_generic
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


module Mux_generic
    #(parameter n = 16)(
        input [n-1 : 0] x,
        input [$clog2(n) - 1 : 0] s,
        output reg y
    );
    
    integer k;
    
    always @(x, s)
    begin
      y = 1'bx;    //default unkown
      for(k = 0; k < n; k = k + 1)
        if(s == k)
           y = x[k];
    end
    
endmodule
