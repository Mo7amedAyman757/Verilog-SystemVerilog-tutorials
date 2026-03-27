`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 11:41:38 PM
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
       parameter n = 16;
       reg [n-1 : 0] x,y,cin;
       reg cin;
       wire [n-1 : 0] s;
       wire cout;
       
     // 2- Instantiate the module under test
    adder_nbit #(.n(n)) test(
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    // 3- Specify stopwatch to stop simulation
    initial
    begin
     #40 $finish;
    end 
    
    // 4- Generate stimuli using initial and always
    initial
    begin
    
     x = 16'd12;
     y = 16'd13;
     cin = 16'b0;
     
     #10
     x = 16'd55;
     y = 16'd13;
     cin = 16'b0;
     
     #10
     x = 16'd52;
     y = 16'd33;
     cin = 16'b0;
     
     #10
     x = 16'd65535;
     y = 16'd1;
     cin = 16'b0;
    end
    
endmodule
