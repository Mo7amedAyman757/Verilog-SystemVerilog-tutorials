`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 02:53:48 PM
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb(

    );
     // 1- Declare local wire and reg identifiers
   localparam BITS = 4; 
   reg clk, reset_n,up, enable;
   wire [3 : 0] Q;
 
 // 2- Instatiate the module block under test
 up_down_counter #(.BITS(BITS)) UC(
     .clk(clk),
     .up(up),
     .enable(enable),
     .reset_n(reset_n),
     .Q(Q)
 );
 
 // 3- General stimuli, using always and intital
     
    initial
    begin
    
     #200 $stop;
    
    end
 
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
    #2 reset_n = 1'b1;
    up = 1'b1;
    enable = 1'b0;
    
    @(posedge clk) enable = 1'b1;
    
    wait(Q == 15);
    enable = 1'b0;
    up = 1'b0;
    
    repeat(3) @(posedge clk);
    enable = 1'b1;
    end
    
endmodule
