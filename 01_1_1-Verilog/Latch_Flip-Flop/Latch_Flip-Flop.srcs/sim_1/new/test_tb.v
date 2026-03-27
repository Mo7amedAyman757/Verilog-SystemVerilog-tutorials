`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 01:51:33 AM
// Design Name: 
// Module Name: test_tb
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


module test_tb(

    );
    
    // 1- Declare local reg and wire identifiers
     reg clk,D;
     wire Q_latch, Q_FF_pos, Q_FF_neg;
     
    // 2- Instatiate module under test
    compare_storage_element test(
        .clk(clk),
        .D(D),
        .Q_a(Q_latch),
        .Q_b(Q_FF_pos),
        .Q_c(Q_FF_neg)
    );  
    
    // 3- General Stimuli, using initial and always
     localparam T = 20;  // clock period
     
    always
     begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
     end
     
     initial 
     begin
     
     D = 1'b1;
     
     # (2 * T) D = 1'b0;
     
     @(posedge clk)
     D = 1'b1;
     
     
     
     
     #2 D = 1'b0;
     #3 D = 1'b1;
     #4 D = 1'b0;
     
      @(posedge clk);
      D = 1'b1;
      
      @(posedge clk)
     D = 1'b0;
      
     
     repeat(2) @(negedge clk);
     D = 1'b1;
     
     #10 $stop;
   
     end
     
endmodule
