`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 10:25:55 AM
// Design Name: 
// Module Name: register_4bits_load
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


module register_4bits_load
    #(parameter N = 4)(
        input clk,
        input [N - 1: 0] I,
        input load,
        output [N - 1: 0] Q
    );
    
    reg [N - 1: 0] Q_next, Q_reg;
    
    always @(posedge clk)
    begin 
        Q_reg <= Q_next;
    end
    
    // next state logic
    always @(I, load)
    begin
        Q_next = Q_reg;  // hold data
        if(load)
            Q_next = I;
        else
            Q_next = Q_reg;    
    end
    
    // output logic
    assign Q = Q_reg;
endmodule
