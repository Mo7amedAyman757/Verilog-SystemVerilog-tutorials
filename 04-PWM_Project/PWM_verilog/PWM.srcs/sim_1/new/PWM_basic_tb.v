`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 10:01:41 AM
// Design Name: 
// Module Name: PWM_basic_tb
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


module PWM_basic_tb(

    );
    
    // 1-declare local reg and wire indentifiers
        localparam R = 8;
        reg clk, reset_n;
        reg [R-1 : 0] duty;
        wire PWM_out;
    
    // 2-Instatiate the module under test
        PWM_basic #(.R(R)) PWM1(
            .clk(clk),
            .reset_n(reset_n),
            .duty(duty),
            .PWM_out(PWM_out)
        );    
    
    // 3-general stimuli using initial and always
        initial
        begin
            #5000000 $stop;
        end  
        
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
        
            reset_n = 1'b0;
            #5 reset_n = 1'b1;
            
        
            duty = 127;
            
            duty = (0.25 * (2**R)) - 1;
            
            repeat(2*(2**R)) @(negedge clk);
            
            duty = (0.5 * (2**R)) - 1;
            
            repeat(2*(2**R)) @(negedge clk);
            
            duty = (0.75 * (2**R)) - 1;
            
            repeat(2*(2**R)) @(negedge clk);
                
            #20 $stop;
            
        end
        
endmodule
