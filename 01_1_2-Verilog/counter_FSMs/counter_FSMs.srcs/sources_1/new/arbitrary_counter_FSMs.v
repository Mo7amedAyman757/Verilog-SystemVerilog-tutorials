`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 04:06:24 PM
// Design Name: 
// Module Name: arbitrary_counter_FSMs
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


module arbitrary_counter_FSMs(
    input clk,
    input reset_n,
    input en,
    output [2 : 0] num
    );
    
    reg [2:0] state_reg, state_next;
    localparam s1 = 1,
               s2 = 2,
               s3 = 3,
               s4 = 4,
               s5 = 5,
               s6 = 6;
    
    //state register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s1;
        else
            state_reg<= state_next;    
    end
    
    //next state logic
    always @(*)
    begin
        if(en)
            case(state_reg)
                s1: state_next = s6;
                s2: state_next = s1;
                s3: state_next = s5;
                s4: state_next = s2;
                s5: state_next = s4;
                s6: state_next = s3;
                default: state_next = state_reg;
            endcase
        else
            state_next = state_reg;        
    end
    // output logic
    assign num = state_reg;
endmodule
