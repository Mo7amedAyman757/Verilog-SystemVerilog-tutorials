`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 03:20:33 PM
// Design Name: 
// Module Name: udl_counter_tb
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


module udl_counter_tb(

    );
    
    // 1- Delcare local reg and wire identifiers
    localparam BITS  = 4;
    reg clk, reset_n, enable, up,load;
    reg [BITS - 1 :0]  I;
    wire [BITS - 1: 0] Q;
// 2- Instatiate the module under test
    udl_counter #(.BITS(BITS)) UDL(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .up(up),
        .load(load),
        .I(I),
        .Q(Q)
    );  
// 3- General stimuli using always and initial
 
    initial 
    begin
        #450 $stop;
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
        enable = 1'b0;
        up = 1'b1;
        #2 reset_n = 1'b1; 
        
        repeat(2) @(negedge clk);
        enable = 1'b1;
        
        wait (Q == 15);
        enable = 1'b0;
        
        repeat(2) @(negedge clk);
        up = 1'b0;
        enable = 1'b1;
        
         repeat(2) @(negedge clk);
         I = 9;
         load = 1'b1;
         
         @(negedge clk);
         load = 1'b0;
         
         wait(Q == 2);
         I = 7;
         load = 1'b1;
         
         repeat(2)@(negedge clk);
         load = 1'b0;
         
        repeat(2) @(negedge clk);
        up = 1'b0;
        
    end       
    
endmodule
