`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2026 10:46:34 PM
// Design Name: 
// Module Name: always_comb
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


module always_combs(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [1:0] op_code,
    output logic [3:0] result
    );
    
    always_comb begin
        case(op_code) 
            2'b00: begin
                result = a + b;
            end
            2'b01: begin
                result = a - b;
            end
            2'b10: begin
                result = a & b;
            end
            2'b11: begin
                result = a | b;
            end
            default: result = 4'b0000;
        endcase
    end  
endmodule
