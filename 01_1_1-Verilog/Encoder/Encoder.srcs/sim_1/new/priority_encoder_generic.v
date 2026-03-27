`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 03:02:09 AM
// Design Name: 
// Module Name: priority_encoder_generic
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


module priority_encoder_generic
      #(parameter n = 4)(
       input [n - 1:0] x,
       output z,
       output reg[$clog2(n) - 1:0] y
    );
    
    assign z = |x;
    integer k;
    
    always @(x)
    begin
      y='bx;
      for(k = 0; k < n; k = k + 1)
        if(x[k])
          y = k;
    end  
    
endmodule
