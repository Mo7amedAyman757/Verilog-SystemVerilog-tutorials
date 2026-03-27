`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 02:15:12 PM
// Design Name: 
// Module Name: moore_101_detector
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


module moore_101_detector(
input clk,
    input reset_n,
    input x,
    output y
    );
    
    // define states
    localparam s0 = 0,
               s1 = 1,
               s2 = 2,
               s3 = 3;
    
    // Flip-Flop
    reg [1 : 0] state_reg,state_next;          
    
    // state_register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;    
    end
    
    // next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if(x)
                    state_next = s1;
                else
                    state_next = s0;
            s1: if(x)
                    state_next = s1;
                else
                    state_next = s2;
            s2: if(x)
                    state_next = s3;
                else
                    state_next = s0;
            s3: if(x)
                    state_next = s1;
                else
                    state_next = s2;            
            default: state_next = state_reg;                                     
        endcase
    end
    
    //output logic
    assign y = (state_reg == s3);
    
endmodule