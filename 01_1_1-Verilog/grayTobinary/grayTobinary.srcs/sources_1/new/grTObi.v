`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 04:14:06 AM
// Design Name: 
// Module Name: grTObi
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


module grTObi #(parameter n =4)(
       input [n-1 : 0] gray,
       output [n-1 : 0] binary
    );
    
    assign binary[n-1] = gray[n-1];
    
    generate
     genvar k;
     for(k = n - 2; k >= 0; k = k - 1)
     begin
      
       assign binary[k] = gray[k] ^ binary[k + 1];
     
     end
    endgenerate 
     
 
endmodule
