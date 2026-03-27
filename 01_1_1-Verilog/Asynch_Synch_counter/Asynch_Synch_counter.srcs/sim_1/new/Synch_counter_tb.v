`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:27:03 PM
// Design Name: 
// Module Name: Synch_counter_tb
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


module Synch_counter_tb();

  // 1- Declare local reg and wire identifiers
        reg clk, reset_n;
        wire [3 : 0] Q;
        
    // 2- Instatiate the module under test
        Synch_counter C0(
            .clk(clk),
            .reset_n(reset_n),
            .Q(Q)
        );
    // 3- General stimuli,using always and initial
    initial
    begin
        #200 $stop;
    end
    
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
         #2 reset_n = 1'b1;
    end
    
endmodule
