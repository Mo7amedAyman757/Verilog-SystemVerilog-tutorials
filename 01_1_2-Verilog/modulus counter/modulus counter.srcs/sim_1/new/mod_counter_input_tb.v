`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 03:52:36 PM
// Design Name: 
// Module Name: mod_counter_input_tb
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


module mod_counter_input_tb(

    );
    // 1- Declare local reg and wire identifiers
        localparam BITS = 4;
        reg clk, reset_n, enable;
        reg [BITS - 1: 0] Final_Val;
        wire [BITS - 1: 0] Q;
        
    // 2- Instatiate the module under test
        mod_counter_input #(.BITS(BITS)) B1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .Final_Val(Final_Val),
            .Q(Q)
        );    
    // 3- General stimuli using initial and always
        initial
        begin
            #300 $stop;
        end
        
        localparam T = 20;
        
        always
        begin
            clk =1'b0;
            #(T /2);
            clk =1'b1;
            #(T /2);
        end 
        
        initial 
        begin
            reset_n = 1'b0;
            enable = 1'b1;
            #2 reset_n = 1'b1;
            
            Final_Val = 'd5;
            
            repeat(Final_Val + 3) @(negedge clk);
            Final_Val  = 'd7;
            
        end       
        
endmodule
