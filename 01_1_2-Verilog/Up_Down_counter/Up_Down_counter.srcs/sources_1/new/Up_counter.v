`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:44:51 PM
// Design Name: 
// Module Name: Up_counter
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


module Up_counter
    #(parameter BITS = 4)(
      input clk,
      input reset_n,
      output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;    
    end
    
    // next state logic
    always @(Q_reg)
    begin
        Q_next = Q_reg + 1;
    end
    
    // output logic
    assign Q = Q_reg;
    
endmodule
