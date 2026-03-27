`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 08:52:27 AM
// Design Name: 
// Module Name: detector_tb
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


module detector_tb(

    );
 // 1-Declare local reg and wire identifiers
        reg clk,reset_n,x;
        wire y_moore, y_mealy, y_moore_3ff;
        wire [1 : 0] Q_moore, Q_mealy;
         wire [2 : 0] Q_moore_3ff;
    
    // 2- Instatiate the module under test
        mealy_011_detector uu0(
            .clk(clk),
            .reset_n(reset_n),
            .x(x),
            .y(y_mealy),
            .Q(Q_mealy)
        );  
        
         moore_011_detector uu1(
            .clk(clk),
            .reset_n(reset_n),
            .x(x),
            .y(y_moore),
            .Q(Q_moore)
        );   
        
         moore_3ff_011_detector uu2(
            .clk(clk),
            .reset_n(reset_n),
            .x(x),
            .y(y_moore_3ff),
            .Q(Q_moore_3ff)
        );   
        
      // 3-General stimuli using always and initial
            localparam T = 10;
            
            always
            begin
                clk = 1'b0;
                #(T / 2);
                clk = 1'b1;
                #(T / 2);
            end  
            
        initial
        begin
        reset_n = 1'b0;
        x = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
        
            x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  $finish;
        
    end
           
endmodule
