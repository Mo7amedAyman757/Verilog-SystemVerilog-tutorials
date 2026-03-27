`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 03:10:14 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR
    #(parameter WIDTH = 4)(
	input clk, reset_n,
	input in,
	input en,
	output x,
	output [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] Q_reg, Q_next;

always @(posedge clk or negedge reset_n)
 begin
	if(!reset_n)
		Q_reg <= 4'b1111;
	else
		Q_reg <= Q_next;
end

always @(*)
begin
	if(en)
	  Q_next = {x,Q_reg[WIDTH-1:1]};
	else
	  Q_next = {in,Q_reg[WIDTH-1:1]};
	   
end

assign data_out = Q_reg;
assign x = data_out[0] ^ data_out[WIDTH-1];

endmodule
