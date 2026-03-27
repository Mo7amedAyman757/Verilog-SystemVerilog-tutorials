`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 11:06:16 PM
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
    reg x,y,cin;
    wire s, cout;
    
    // 2- Instantiate the module under test
    full_adder test(
     .x(x),
     .y(y),
     .cin(cin),
     .s(s),
     .cout(cout)
    );
    
    // 3- Specify a stopwatch to stop simulatin
    initial
    begin
     #80 $finish;
    end
    
    // 4- General stimuli using initial and always
    initial
    begin
    
    x = 0;
    y = 0;
    cin = 0;
    
    #10
    x = 1;
    y = 0;
    cin = 0;
    
    #10
    x = 0;
    y = 1;
    cin = 0;
    
    #10
    x = 1;
    y = 1;
    cin = 0;
    
    #10
    x = 0;
    y = 0;
    cin = 1;
    
    #10
    x = 1;
    y = 0;
    cin = 1;
    
    #10
    x = 0;
    y = 1;
    cin = 1;
    
    #10
    x = 1;
    y = 1;
    cin = 1;
    end
endmodule
