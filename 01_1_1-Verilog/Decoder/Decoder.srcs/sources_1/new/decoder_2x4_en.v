`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 01:25:40 AM
// Design Name: 
// Module Name: decoder_2x4_en
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


module decoder_2x4_en(
          input [1:0] w,
          input en,
          output reg [0:3] z
    );
    
    always @(w,en)
    begin
       z = 4'b0000;
       if(en)
       begin
          case(w)
            2'b00: z = 4'b1000;
             2'b01: z = 4'b0100;
              2'b10: z = 4'b0010;
               2'b11: z = 4'b0001;
          endcase
       end 
       else
          z = 4'b0000;
    end
    
endmodule
