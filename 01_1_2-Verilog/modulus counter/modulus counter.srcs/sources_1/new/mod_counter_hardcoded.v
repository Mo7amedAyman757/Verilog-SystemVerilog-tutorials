`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 03:44:15 PM
// Design Name: 
// Module Name: mod_counter_hardcoded
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


module mod_counter_hardcoded
    #(parameter BITS = 4)(
        input clk,
        input reset_n,
        input enable,
        output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
    wire done;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;        
    end
    
    assign done = Q_reg == 4'd8;
    
    always @(*)
    begin
        Q_next = done ? 4'b0: Q_reg + 1;
    end
    
    assign Q = Q_reg;
endmodule
