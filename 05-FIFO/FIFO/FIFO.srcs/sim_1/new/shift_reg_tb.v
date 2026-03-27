`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 02:46:28 PM
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb(

    );
    localparam WIDTH = 8;
    reg clk, reset_n;
	reg in;
    wire out;
	wire [WIDTH-1:0] data_out;
	
	
	
	shift_reg 
	#(.WIDTH(WIDTH)) uut(
        .clk(clk),
        .reset_n(reset_n),
        .in(in),
        .out(out),
        .data_out(data_out)	
	);
	
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
	in = 1'b0;
	#10;
	reset_n = 1;
	in = 1'b1;
	repeat(15) @(negedge clk) in = 1'b1;
	
	@(posedge clk) $stop;
	end
	
    
endmodule
