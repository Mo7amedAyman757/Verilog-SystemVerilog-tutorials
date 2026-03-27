`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:06:53 PM
// Design Name: 
// Module Name: T_FF
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


module T_FF(
      input T,
      input clk,
      input reset_n,
      output Q
    );
    
    reg Q_reg;
    wire Q_next;
    
    localparam C2Q_DELAY = 2;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else
           #C2Q_DELAY Q_reg <= Q_next;    
    end
    
    //next logic state
    assign Q_next = T ? ~Q_reg: Q_reg;
    
    // output logic
    assign Q = Q_reg;
    
endmodule
