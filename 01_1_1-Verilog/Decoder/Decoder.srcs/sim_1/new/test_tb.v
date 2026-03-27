`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 12:38:45 AM
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
    
    // 1- delare local reg and wire identifiers
    parameter n = 4;
    reg [n:0] w;
    reg en;
    wire [0:2 ** n -1]z;
    
    // 2- Instantiate the module under test
       decoder_generic test(
         .w(w),
         .en(en),
         .z(z)
       );
    // 3- Specify a stopwatch to stop simulation
       initial 
       begin
        #50 $finish;
       end 
    // 4- General stimuli, using initial and always
    initial 
    begin
       w = 0;
       en = 0;
       #10
       en = 1;
       #10
       w = 1;
       en = 1;
       #10
       w = 2;
       en = 1;
       #10
       w = 3;
       en = 1;
    end
endmodule
