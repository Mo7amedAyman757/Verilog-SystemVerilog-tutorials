`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 11:43:45 AM
// Design Name: 
// Module Name: LFSR
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


module LFSR
    #(parameter N = 3)(
        input clk,
        input reset_n,
        output [1 : N] Q
    );
    
    reg [1 : N] Q_reg, Q_next;
    wire X;
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b1; //LFSR shouldn't start with 0 
        else
            Q_reg <= Q_next;    
    end
    
    always @(X,Q_reg)
    begin
        Q_next = {X, Q_reg[1:N - 1]};
    end
    
    assign X = Q[2] ^ Q[3];
    
    assign Q = Q_reg;
    
endmodule
