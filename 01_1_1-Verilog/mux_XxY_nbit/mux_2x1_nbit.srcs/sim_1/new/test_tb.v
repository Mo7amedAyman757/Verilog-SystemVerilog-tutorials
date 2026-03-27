`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 06:57:28 PM
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
     reg [n-1:0]  x;
     reg [$clog2(n) - 1:0] s;
     wire y;
    
    // 2- Instantiate the module under test
    Mux_generic #(.n(n)) test(
      .x(x),
      .s(s),
      .y(y)
    );
    
    // 3- Specify stopwatch to stop simulation
    initial
    begin
    
     #80 $finish;
    
    end
    
    // 4- General stimuli, using initial and always
       initial 
       begin
       
       x = 4'b0001;
       s = 2'b00;
       
       #10
       x = 4'b0000;
       s = 2'b00;
       
       #10
       x = 4'b0000;
       s = 2'b01;
       
       #10
       x = 4'b0010;
       s = 2'b01;
       
       #10
       x = 4'b0000;
       s = 2'b10;
       
       #10
       x = 4'b0100;
       s = 2'b10;
       
       #10
        x = 4'b0000;
       s = 2'b11;
       
       #10
       x = 4'b1000;
       s = 2'b11;
       end
    
    
endmodule
