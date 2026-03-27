`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 03:18:28 AM
// Design Name: 
// Module Name: pipelining_4stages
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


module pipelining_4stages(
    input clk1,
    input clk2,
    input reset_n,
    input [3:0] rs1, rs2, rd_addr, func,
    input wr,
    input [7:0] addr,
    output [15:0] Z
    );
    
    // stage1_register
        reg [15:0] S1_A, S1_B;
        reg [3:0] S1_rd, S1_func;
        reg [7:0] S1_addr;
   
   // stage2 register
        reg [15:0] S2_alu;
        reg [3:0] S2_rd;
        reg [7:0] S2_addr;
        
   // stage3 register
       reg [7:0] S3_addr;
       reg [15:0] S3_alu;
       
  // stage4 register
      reg [15:0] S4_Z;
  
  // register bank
  reg [15:0] regbank [0:15];
  
  // memory
  reg [15:0] mem [0:255];    
      
    // stage 1
    always @(posedge clk1 or negedge reset_n) begin
        if (!reset_n) begin
            S1_A <= 0;
            S1_B <= 0;
            S1_rd <= 0;
            S1_func <= 0;
            S1_addr <= 0;
        end
        else begin
            S1_A <= regbank[rs1];
            S1_B <= regbank[rs2];
            S1_rd <= rd_addr;
            S1_func <= func;
            S1_addr <= addr;
        end      
    end
    
    // stage 2
    always @(posedge clk2 or negedge reset_n) begin
        if (!reset_n) begin
            S2_alu <= 0;
            S2_rd <= 0;
            S2_addr <= 0;
        end
        else begin
            case(S1_func)
                4'b0000: S2_alu <= S1_A + S1_B;
                4'b0001: S2_alu <= S1_A - S1_B;
                4'b0010: S2_alu <= S1_A * S1_B;
                4'b0011: S2_alu <= S1_A;
                4'b0100: S2_alu <= S1_A;
                4'b0101: S2_alu <= S1_A & S1_B;
                4'b0110: S2_alu <= S1_A | S1_B;
                4'b0111: S2_alu <= S1_A ^ S1_B;
                4'b1000: S2_alu <= ~S1_A;
                4'b1001: S2_alu <= ~S1_A;
                4'b1010: S2_alu <= S1_A >> 1;
                4'b1011: S2_alu <= S1_A << 1;
                default: S2_alu <= 16'b0;
            endcase
            S2_rd <= S1_rd;
            S2_addr <= S1_addr;            
        end      
    end
    
    // stage 3
    always @(posedge clk1 or negedge reset_n) begin
        if (!reset_n) begin
            S3_addr <= 0;
            S3_alu <= 0;
        end
        else begin
            regbank[S2_rd] <= S2_alu; 
            S3_addr <= S2_addr; 
            S3_alu <= S2_alu;
        end      
    end
    
    // stage 4
    always @(posedge clk2 or negedge reset_n) begin
        if (!reset_n) begin
            S4_Z <= 0;
        end
        else begin
            if(wr)
                mem[S3_addr] <= S3_alu;  
            S4_Z <= S3_alu;
        end      
    end
    
    assign Z = S4_Z;
    
endmodule
