`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 11:05:02 AM
// Design Name: 
// Module Name: shift_register_4bits_load
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


module shift_register_4bits_load
    #(parameter N = 4)(
      input clk,
      input SI,
      input [N - 1: 0] I,
      input load,
      input reset_n,
      output SO,
      output [N - 1: 0] Q
    );
    
    reg [N - 1: 0] Q_reg, Q_next;
    
    // state register
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;    
    end
    
    // next state logic
    always @(*)
    begin
        Q_next = Q_reg;
        if(load)
            Q_next = I;  // parallel load
        else
            Q_next = {SI, Q_reg[N-1:1]}; // shift right    
    end
    
    // output logic
    assign SO = Q_reg[0];  // serial output LSB
    assign Q = Q_reg;
    
endmodule
