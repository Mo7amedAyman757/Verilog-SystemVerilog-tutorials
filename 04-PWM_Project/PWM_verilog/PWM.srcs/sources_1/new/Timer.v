`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 10:19:34 AM
// Design Name: 
// Module Name: Timer
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


module Timer
    #(parameter TIMER_BITS = 8)(
        input clk,
        input reset_n,
        input enable,
        input [TIMER_BITS-1 : 0] FINAL_VALUE,
        output done
    );
    
    
    reg [TIMER_BITS-1 : 0] Q_next,Q_reg;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;        
    end
    
    assign done = Q_reg == FINAL_VALUE;
      
    always @(*)
    begin
        Q_next = done? 'b0: Q_reg + 1;
    end
    
endmodule
