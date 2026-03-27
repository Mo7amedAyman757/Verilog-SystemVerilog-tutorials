`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 01:43:03 AM
// Design Name: 
// Module Name: D_FF_pos
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


module D_FF_pos(
          input D,
          input clk,
          output reg Q,
          output  Q_n
    );
    
    assign Q_n = ~ Q;
    always @(posedge clk)
    begin
        Q = D;
    end
    
    
endmodule
