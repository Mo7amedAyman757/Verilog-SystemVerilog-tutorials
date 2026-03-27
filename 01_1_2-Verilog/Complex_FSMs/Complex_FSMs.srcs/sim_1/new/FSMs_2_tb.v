`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 03:37:04 PM
// Design Name: 
// Module Name: FSMs_2_tb
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


module FSMs_2_tb(

    );
    // 1-declare local reg and wire identifiers
        reg clk, reset_n, x;
        wire y;
    
   // 2-Instatiate the module under test
      FSMs_2 uu1(
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y)
      );      
      
   // 3-General stimuli, using always and initial
        localparam T = 10;
        always
        begin
            clk = 1'b0;
            #(T / 2);
            clk = 1'b1;
            #(T / 2);
        end  
        
        initial
    begin
        reset_n = 1'b0;
        x = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
        
            x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #2  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;        
        #T  $finish;
    end
endmodule
