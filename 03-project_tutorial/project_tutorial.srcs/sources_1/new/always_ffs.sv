`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2026 10:55:31 PM
// Design Name: 
// Module Name: always_ffs
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


module always_ffs(
    input  wire clk,
    input  wire reset_n, // Active-low reset
    output reg  [2:0] count
    );
    
    // This is the sequential always block, triggered on a clock edge
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // Asynchronous reset: sets the count to 0 when reset_n is low
            count <= 3'b000;
        end else begin
            // On the positive edge of the clock, increment the count
            count <= count + 1'b1;
        end
    end
    
endmodule
