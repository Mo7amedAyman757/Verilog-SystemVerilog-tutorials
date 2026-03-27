`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2025 02:43:48 AM
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
      parameter n = 4;
      reg[2**4 -1 : 0] A;
      reg[2**4 -1 : 0] B;
      wire cout;
      wire[2**4 -1 : 0] s;
    
    // 2- Instatiate the module under test
    BCD_adder_nNibble #(.n(n)) test(
     .A(A),
     .B(B),
     .cout(cout),
     .S(s)
    );
    
    // 3- Specify stopwatch to stop simulation
    initial 
    begin
     #40 $finish;
    end
    
    // 4- Generate stimuli using initial and always
    initial
    begin
    
    A = 16'd599;
    B = 16'd15;
    #10
    
     A = 16'd599;
    B = 16'd15;
    #10
    
      A = 16'd599;
    B = 16'd15;
    #10
   
    A = 16'd599;
    B = 16'd15;

    end 
    
endmodule
