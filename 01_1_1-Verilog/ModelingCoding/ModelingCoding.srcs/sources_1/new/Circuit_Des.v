`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 02:39:13 PM
// Design Name: 
// Module Name: Circuit_Des
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


module Circuit_Des(
         input a,b,c,
         input clk,
         output f,g
    );
    
    reg f_next, f_reg, g_next, g_reg;
    
    always @(posedge clk)
    begin
  
     f_reg <= f_next;
  
     g_reg <= g_next;
    
    end
   
   always @(a,b,c,g_reg)
   begin
   
    f_next = a & ~g_reg;
    g_next = b | c;
   
   end
   
   assign f = f_reg;
   assign g = g_reg;
    
endmodule
