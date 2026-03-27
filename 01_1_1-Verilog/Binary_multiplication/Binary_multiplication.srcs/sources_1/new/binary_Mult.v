`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 04:01:22 AM
// Design Name: 
// Module Name: binary_Mult
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


module binary_Mult
     #(parameter n  = 4)(
            input[n-1 :0] A,
            input[n-2 :0] B,
            output cout,
            output [2 * n -2 : 0] P
    );
    
    wire [n-1:0] anded_res1, anded_res2, anded_res3, res1,res2;
    wire  c;
    
    anded a0(
      .A(A),
      .B(B[0]),
      .And_res(anded_res1)
    );
    
     anded a1(
      .A(A),
      .B(B[1]),
      .And_res(anded_res2)
    );
    
     anded a2(
      .A(A),
      .B(B[2]),
      .And_res(anded_res3)
    );
    
    adder_nbit FA0(
       .x({1'b0, anded_res1[3:1]}),
       .y(anded_res2),
       .cin(1'b0),
       .cout(c),
       .s(res1)
    );
    
     adder_nbit FA1(
       .x({1'b0, res1[3:1]}),
       .y(anded_res3),
       .cin(c),
       .cout(cout),
       .s(res2)
    );

   assign P = {res2,res1[0],anded_res1[0]};
   
endmodule
