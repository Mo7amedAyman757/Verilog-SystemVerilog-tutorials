`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:40:01 PM
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
    
    // 1- declare local reg and wire identifiers
    reg x,y;
    wire s ,c;
    
    // 2- instantiate the module under test
    half_adder test(
      .x(x),
      .y(y),
      .c(c),
      .s(s)
    );
    
    // 3- specify a stopwatch to stop simulation
    initial
    begin
    #40 $finish;
    end
    
    // 4- Generate stimuli, using initial and always
    initial
    begin
    x = 0;
    y=0;
    
    #10
    
    x = 1;
    y=0;
    
     #10
    
    x = 0;
    y=1;
    
     #10
    
    x = 1;
    y=1;
    
    end
    
endmodule
