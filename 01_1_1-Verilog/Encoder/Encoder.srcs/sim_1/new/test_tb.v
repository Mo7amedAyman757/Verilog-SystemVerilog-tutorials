`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 02:32:11 AM
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
      parameter n = 6;
      reg [n-1:0] x;
      wire [$clog2(n) - 1:0] y;
      wire z;
      integer k;
    
    // 2- Instantiate the module under test
     priority_encoder_generic #(.n(n)) test(
        .x(x),
        .z(z),
        .y(y)
     ); 
     
     // 3- specify stopwatch to stop simulation
     initial 
     begin
     
      #170 $finish;
     
     end
     
     // 4- General stimuli using initial and always
     initial
     begin
       x = 0;
       for(k=0; k < 2**n; k = k + 1)
       begin
         #5 x = x + 1;
       end
     end 
    
endmodule
