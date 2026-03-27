`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 01:35:38 AM
// Design Name: 
// Module Name: decoder_generic
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


module decoder_generic
       #(parameter n = 4)(
       input [n - 1:0] w,
       input en,
       output reg [0: 2 ** n -1] z
    );
    
    //integer k;
    always @(w,en)
    begin
     z = 'b0;  
       if(en)
//       begin
//          for (k = 0; k < 2**n; k = k + 1)
//             if (w == k)
//               z[k] = 1'b1;
//      end
   z[w] = 1'b1;
    end   
    
endmodule
