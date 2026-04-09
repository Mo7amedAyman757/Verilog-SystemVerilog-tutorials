`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2026 10:51:07 PM
// Design Name: 
// Module Name: always_latch
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


module always_latchs(
    input wire a,
    input wire b,
    input wire sel,
    input wire enable,
    output reg data_out
    );
    
    wire max_out;
    assign max_out = sel? a:b;
    
    always_latch begin
        if(enable) begin
            data_out = max_out;
        end
        else begin
            data_out = data_out;    
        end
    end
endmodule
