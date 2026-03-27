`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 11:15:02 AM
// Design Name: 
// Module Name: BCD_counter_tb
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


module BCD_counter_tb(

    );
    
     // 1- Declare local reg and wire identifiers
        
        reg clk, reset_n, enable;
        wire done;
        wire [3 : 0] Q;
        
    // 2- Instatiate the module under test
        BCD_counter B1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .done(done),
            .Q(Q)
        );    
    // 3- General stimuli using initial and always
        initial
        begin
            #500 $stop;
        end
        
        localparam T = 20;
        
        always
        begin
            clk =1'b0;
            #(T /2);
            clk =1'b1;
            #(T /2);
        end 
        
        initial 
        begin
            reset_n = 1'b0;
            enable = 1'b1;
            #2 reset_n = 1'b1;
        end       
endmodule
