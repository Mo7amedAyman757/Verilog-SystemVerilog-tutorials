`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 02:46:32 AM
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
      parameter n = 3;
      reg[n * 4 -1 :  0] A;
      reg[n * 4 -1 :  0] B;
      wire cout;
      wire[n * 4 -1 : 0 ] s;
    
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
     #30 $finish;
    end
    
    // 4- Generate stimuli using initial and always
    initial
    begin
    
    A = 12'b0101_1001_1001;
    B = 12'b0000_0001_0101;
    #10
  
    A = 12'b0001_0010_0011;
    B = 12'b0100_0101_0110;
    #10
  
    A = 12'b1001_1001_1001;
    B = 12'b0000_0000_0001;

    end 
    
endmodule

