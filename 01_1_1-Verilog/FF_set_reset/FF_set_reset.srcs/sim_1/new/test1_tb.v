`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 04:23:25 PM
// Design Name: 
// Module Name: test1_tb
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


module test1_tb(

    );
    
    // 1- Declare local reg and wire identifiers
     reg clk , D, reset_n , clear_n;
     wire Q;
     
   // 2- Instatiate the module under test
     D_FF_reset test(
        .clk(clk),
        .D(D),
        .reset_n(reset_n),
        .clear_n(clear_n),
        .Q(Q)
     );
     
   // 3- General stimuli, using always and initial
     localparam T = 20; // clock period
     
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
     reset_n = 1'b1;
     clear_n = 1'b1;
     
     #10 D = 1'b0;
     #2  D = 1'b1;
     #3  D = 1'b0;
     #2  D = 1'b1;
   
     
     #5 reset_n = 1'b0;
     #3 reset_n = 1'b1;
     
     #35 clear_n =1'b0;
     
     #5 clear_n = 1'b1;
     
     #25 $stop;
     
     
     end
     
endmodule
