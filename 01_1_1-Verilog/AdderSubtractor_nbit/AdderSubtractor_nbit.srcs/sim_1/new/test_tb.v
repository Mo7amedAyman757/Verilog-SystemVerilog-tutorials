`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 12:49:13 AM
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
     parameter n = 4;
     reg [n-1 : 0] x,y;
     reg n_signal, m_signal;
     wire [n-1 : 0] s;
     wire cout, neg_sign, ov_sign;
     
    // 2- Instantiate the module under test
    adder_subtractor_nbit #(.n(n)) test(
      .x(x),
      .y(y),
      .n_signal(n_signal),
      .m_signal(m_signal),
      .s(s),
      .cout(cout),
      .neg_sign(neg_sign),
      .ov_sign(ov_sign)
    );
    
    // 3- Specify stopwatch to stop simulation
    initial
    begin
    
     #40 $finish;
     
    end
   
   // 4- Generate stimuli using initial and always
    initial 
    begin
     n_signal = 0; 
     m_signal = 0;
     x = 4'd5;
     y = 4'd6;
     
     #10
     m_signal = 1;
     
     #10
     m_signal = 0;
     n_signal = 1;
     
      #10
     m_signal = 1;
     n_signal = 1;
  
    end

     
endmodule
