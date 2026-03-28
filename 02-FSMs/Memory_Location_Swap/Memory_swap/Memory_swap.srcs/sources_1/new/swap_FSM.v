`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 08:34:06 PM
// Design Name: 
// Module Name: swap_FSM
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


module swap_FSM(
    input clk,
    input reset_n,
    input swap,
    output [1:0] sel,
    output w
    );
    
    reg [1:0] state_reg, state_next;
    localparam s0 = 0,
               s1 = 1,
               s2 = 2,
               s3 = 3;
               
    // Seqeuntial register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;    
    end   
    
    // Next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if(swap)
                    state_next = s1;
                else    
                    state_next = s0;
            s1: state_next = s2;
            s2: state_next = s3;
            s3: state_next = s0;
            default: state_next = s0;        
        endcase
    end        
    
    //output logic
    assign sel = state_reg;
    assign w = (state_reg != s0);
    
endmodule
