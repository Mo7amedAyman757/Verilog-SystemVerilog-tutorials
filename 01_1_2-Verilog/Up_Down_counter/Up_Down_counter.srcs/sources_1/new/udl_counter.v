`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 03:20:06 PM
// Design Name: 
// Module Name: udl_counter
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


module udl_counter
    #(parameter BITS = 4)(
      input clk,
      input reset_n,
      input [BITS - 1: 0] I,
      input enable,
      input up,
      input load,
      output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;        
    end
    
    // next state logic
    always @(*)
    begin
        casex({load,up})
            2'b00: Q_next = Q_reg - 1;
            2'b01: Q_next = Q_reg + 1;
            2'b1x: Q_next = I;
            default: Q_next = Q_reg;
        endcase
    end
    
    // output logic
    assign Q = Q_reg;
endmodule
