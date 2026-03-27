`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 10:25:06 AM
// Design Name: 
// Module Name: timer_tb
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


module timer_tb(

    );
    // 1-declare local reg and wire indentifiers
        localparam TIMER_BITS = 16;
        reg clk, reset_n,enable;
        reg [TIMER_BITS-1 : 0] FINAL_VALUE;
        wire done;
    
    // 2-Instatiate the module under test
        Timer #(.TIMER_BITS(TIMER_BITS)) T1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .FINAL_VALUE(FINAL_VALUE),
            .done(done)
        );    
    
    // 3-general stimuli using initial and always
        initial
        begin
            #50000000 $stop;
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
            
            FINAL_VALUE = 25000;
            reset_n = 1'b0;
            enable = 1'b1;
            #5 reset_n = 1'b1;
            
           
            wait(done ==  1);
                
            #20 $stop;
            
        end
endmodule
