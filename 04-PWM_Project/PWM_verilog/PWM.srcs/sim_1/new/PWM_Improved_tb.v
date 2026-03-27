`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 10:58:04 AM
// Design Name: 
// Module Name: PWM_Improved_tb
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


module PWM_Improved_tb(

    );
     // 1-declare local reg and wire indentifiers
        localparam R = 8;
        localparam TIMER_BITS = 8;
        
        reg clk, reset_n;
        reg [R : 0] duty;
        reg [TIMER_BITS-1 : 0] FINAL_VALUE;
        wire PWM_out;
    
    // 2-Instatiate the module under test
        PWM_Improved #( .R(R), .TIMER_BITS(TIMER_BITS)) PWM1(
            .clk(clk),
            .reset_n(reset_n),
            .duty(duty),
            .FINAL_VALUE(FINAL_VALUE),
            .PWM_out(PWM_out)
        );    
    
    // 3-general stimuli using initial and always
        initial
            #(7 * 2**R * T * 200) $stop;
        
        localparam T = 10;
        always
        begin
            clk = 1'b0;
            #(T /2);
            clk = 1'b1;
            #(T /2);
        end    
        
        initial
        begin
            
            FINAL_VALUE = 8'd194;
            reset_n = 1'b0;
            #10 reset_n = 1'b1;
            
            duty = (2**R)/4;
            repeat(2 * 2**R * FINAL_VALUE) @(negedge clk);

            duty = (2**R)/2; 
            repeat(2 * 2**R * FINAL_VALUE) @(negedge clk);
            
            duty = (3*(2**R))/4;
            repeat(2 * 2**R * FINAL_VALUE) @(negedge clk);
           

        end
endmodule
