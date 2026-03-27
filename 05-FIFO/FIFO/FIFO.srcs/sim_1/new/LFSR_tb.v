`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 03:16:35 PM
// Design Name: 
// Module Name: LFSR_tb
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


module LFSR_tb(

    );
    
    //1- Declare local reg and wire
     localparam WIDTH = 4;
    reg clk, reset_n;
	reg in;
	reg en;
	wire x;
	wire [WIDTH-1:0] data_out;
	
	
	//2- Instantiate the module under test
	LFSR #(.WIDTH(WIDTH)) uut(
	   .clk(clk),
	   .reset_n(reset_n),
	   .in(in),
	   .en(en),
	   .x(x),
	   .data_out(data_out)
	);
    
    //3- general stimuli using always and intial
    localparam T = 20;
	always 
	begin
	   clk = 1'b0;
	   #(T / 2);
	   clk = 1'b1;
	   #(T / 2);
	end
	
	initial
	begin
	reset_n = 0;
	en = 1'b0;
	in = 1'b0;
	#5;
	reset_n = 1;
	in = 1'b1;
	en = 1'b1;
	
    @(negedge clk) in = 1'b0;
     en = 1'b0;
     
     @(negedge clk) in = 1'b1;
     en = 1'b1;
     
      @(negedge clk) in = 1'b0;
     en = 1'b0;
     
     @(negedge clk) in = 1'b1;
     en = 1'b1;
     
     @(negedge clk) in = 1'b0;
     en = 1'b0;
     
     @(negedge clk) in = 1'b1;
     en = 1'b1;
	
	@(negedge clk) $stop;
	end
    
    
endmodule
