`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 02:40:18 PM
// Design Name: 
// Module Name: shift_reg
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

module shift_reg
	#(parameter WIDTH = 8)(
	input clk, reset_n,
	input in,
	output reg out,
	output [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] Q_reg, Q_next;

always @(posedge clk or negedge reset_n)
 begin
	if(!reset_n)
		Q_reg <= 'b0;
	else
		Q_reg <= Q_next;
end

always @(*)
begin
	Q_next = {in,Q_reg[WIDTH-1:1]};
	out = Q_reg[0];
end

assign data_out = Q_reg;

endmodule
