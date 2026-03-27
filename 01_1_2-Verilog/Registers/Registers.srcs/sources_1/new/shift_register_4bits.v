`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 10:40:34 AM
// Design Name: 
// Module Name: shift_register_4bits
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


module shift_register_4bits
    #(parameter N = 4)(
      input clk,
      input IN,
      output OUT,
      output [N - 1: 0] Q // if we care about content
    );
    
    reg [N - 1: 0] Q_reg, Q_next;
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // next state logic
    always @(IN,Q_reg)
    begin
        Q_next = {IN,Q_reg[N - 1 : 1]};  // shift right
        //Q_next = {Q_reg[N -2 : 0],IN}; // shift left
    end
    
    // output logic
    assign OUT = Q_reg[0];
    assign Q = Q_reg;
endmodule
