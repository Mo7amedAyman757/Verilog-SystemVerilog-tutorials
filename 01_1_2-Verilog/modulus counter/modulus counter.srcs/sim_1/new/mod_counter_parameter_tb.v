`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 04:12:23 PM
// Design Name: 
// Module Name: mod_counter_parameter_tb
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


module mod_counter_parameter_tb(

    );
     // 1- Declare local reg and wire identifiers
        localparam Final_Val = 24;
        localparam BITS = $clog2(Final_Val);
        reg clk, reset_n, enable;
        wire [BITS - 1: 0] Q;
        
    // 2- Instatiate the module under test
        mod_counter_parameter #(.Final_Val(Final_Val)) B1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .Q(Q)
        );    
    // 3- General stimuli using initial and always
        initial
        begin
            #500 $stop;
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
        end       
        
endmodule
