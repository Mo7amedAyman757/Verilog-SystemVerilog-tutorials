`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 07:20:00 PM
// Design Name: 
// Module Name: Serial_adder
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


module Serial_adder(
        input [3 : 0] A,
        input [3 : 0] B,
        input D,
        input clk,
        output reg [3 : 0] s,
        output Q
    );
    
    reg Q_reg, Q_next;
    always @(posedge clk)
    begin 
    
      Q_reg <= Q_next;
    
    end
    
    
endmodule
