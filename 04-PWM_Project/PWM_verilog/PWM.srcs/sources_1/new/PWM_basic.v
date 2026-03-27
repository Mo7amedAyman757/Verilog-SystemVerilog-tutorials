`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 09:56:16 AM
// Design Name: 
// Module Name: PWM_basic
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


module PWM_basic
    #(parameter R = 8)(
        input clk,
        input reset_n,
        input [R-1 : 0] duty,
        output PWM_out
    );
    
    reg [R-1 : 0] Q_reg , Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;    
    end
    
    //next state
    always @(*)
    begin
        Q_next = Q_reg + 1;
    end
    
    // output logic
    assign PWM_out = Q_reg < duty;
    
endmodule
