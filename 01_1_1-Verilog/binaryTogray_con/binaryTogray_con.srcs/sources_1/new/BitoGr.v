`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 03:54:04 AM
// Design Name: 
// Module Name: BitoGr
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


module BitoGr #(parameter n = 4)(
      input [n - 1 : 0] binary,
      output [n - 1 : 0] gray
    );
    
    assign gray[n - 1] = binary[n - 1];
    
    generate
     genvar k;
     for(k = n - 2; k >= 0; k =k - 1)
     begin
      assign gray[k] = binary[k] ^ binary[k + 1];
     end
    endgenerate
    
endmodule
