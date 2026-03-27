`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 02:54:14 AM
// Design Name: 
// Module Name: pipeline_3stages
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


module pipeline_3stages(
    input clk,
    input reset_n,
    input [3:0] A,B,C,D,
    output [7:0] F
    );
    
    //stage 1
    // x1 = A+B , x2 = C-D
    
    //stag2 2
    // x3 = x1 + x2
    
    // stage 3
    // f = x3 * D
    
    reg [3:0] L12_x1, L12_x2, L12_D; // stage1_registers
    reg [3:0] L23_x3, L23_D; // stage2_registers
    reg [7:0] l3_F; // stage3_registers
    
    // stage 1
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            L12_x1 <= 0;
            L12_x2 <= 0;
            L12_D <= 0;
        end
        else begin
            L12_x1 <= A + B;
            L12_x2 <= C - D;
            L12_D <= D;
        end
    end
    
    // stage 2
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            L23_x3 <= 0;
            L23_D <= 0;
        end 
        else begin
            L23_x3 <= L12_x1 + L12_x2;
            L23_D <= L12_D;
        end
    end
    
    // stage 3
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
           l3_F <= 0;
        end
        else begin
            l3_F <= L23_x3 * L23_D;
        end
    end
   
   assign F = l3_F;
    
endmodule
