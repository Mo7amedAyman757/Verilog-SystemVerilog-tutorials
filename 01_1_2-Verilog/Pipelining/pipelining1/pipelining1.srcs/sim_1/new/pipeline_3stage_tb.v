`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 03:05:11 AM
// Design Name: 
// Module Name: pipeline_3stage_tb
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


module pipeline_3stage_tb();

// 1- declare local wire and reg

    reg clk_tb, reset_tb;
    reg [3:0] A_tb,B_tb,C_tb,D_tb;
    wire [7:0] F_tb;
    
// 2- Instantiate the module under test
   pipeline_3stages uut(
        clk_tb,
        reset_tb,
        A_tb,
        B_tb,
        C_tb,
        D_tb,
        F_tb
   ); 
   
// General stimuli using inital and always

   always #5 clk_tb = ~clk_tb;
   
   
   initial begin
        // Initialize
        clk_tb = 0;
        reset_tb = 1;
        A_tb = 0;
        B_tb = 0;
        C_tb = 0;
        D_tb = 0;
        
        #10;
        reset_tb = 0;
        
        #10;
        reset_tb = 1;
        
        @(negedge clk_tb);
        A_tb = 4;
        B_tb = 2;
        C_tb = 7;
        D_tb = 3;
        
        @(negedge clk_tb);
        A_tb = 6;
        B_tb = 1;
        C_tb = 5;
        D_tb = 2;  
        
        @(negedge clk_tb);
        A_tb = 8;
        B_tb = 3;
        C_tb = 4;
        D_tb = 1;
        
        @(negedge clk_tb);
        A_tb = 9;
        B_tb = 4;
        C_tb = 6;
        D_tb = 2;
        
        #100; 
        $stop;
   end
endmodule
