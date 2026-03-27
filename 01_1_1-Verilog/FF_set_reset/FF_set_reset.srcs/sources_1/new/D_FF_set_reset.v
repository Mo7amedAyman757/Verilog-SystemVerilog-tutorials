`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 05:36:34 PM
// Design Name: 
// Module Name: D_FF_set_reset
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


module D_FF_set_reset(
         input D,
         input clk,
         input reset_n, //Asynchronous 
         input set_n, // synchronous
         output Q
    );
    
    reg Q_reg , Q_next;
    
    always @(negedge clk, negedge reset_n)
    begin
     if(!reset_n)
       Q_reg <= 1'b0;
     else
       Q_reg <= Q_next;  
    end
    
    always @(*)
    begin
     Q_next = Q_reg;
     if(!set_n)
       Q_next = 1'b1;
     else
       Q_next = D;   
    
    end
    
    assign Q = Q_reg;
endmodule
