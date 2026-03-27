module pipeline (
	input clk1, 
	input clk2,
	input [3:0] rs1, rs2, rd, func;
	input [7:0] addr;
	input wr,
	output [15:0] Zout
);

	reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
	reg [3:0]  L12_rd, L12_func, L23_rd;
	reg [7:0] L12_addr, L23_addr, L34_addr;
	
	reg [15:0] regbank [0:15];
	reg [15:0] mem [0:255];
	
	assign Zout = L34_Z;
	
	// Stage 1
	always @(posedge clk1) begin
		L12_A    <= regbank[rs1];
		L12_B    <= regbank[rs2];
		L12_rd   <= rd;
		L12_func <= func;
		L12_addr <= addr;
	end
	
	// Stage 2
	always @(posedge clk2) begin
		case(L12_func2) 
			4'b0000: L23_Z <= L12_A + L12_B;
			4'b0001: L23_Z <= L12_A - L12_B;
			4'b0010: L23_Z <= L12_A * L12_B;
			4'b0011: L23_Z <= L12_A;
			4'b0100: L23_Z <= L12_B;
			4'b0101: L23_Z <= L12_A & L12_B;
			4'b0110: L23_Z <= L12_A | L12_B;
			4'b0111: L23_Z <= L12_A ^ L12_B;
			4'b1000: L23_Z <= ~L12_A;
			4'b1001: L23_Z <= ~L12_B;
			4'b1010: L23_Z <= L12_A >> 1;
			4'b1011: L23_Z <= L12_A << 1;
			default: L23_Z <= 16'b0;
		endcase
		L23_rd <= L12_rd;
		L23_addr <= L12_addr;
	end
	

	// Stage 3
	always @(posedge clk1) begin
		regbank[L23_rd] <= L23_Z;
		L34_Z <= L23_Z;
		L34_addr <= L23_addr;
	end
	
	// Stage 4
	always @(posedge clk2) begin
		mem[L34_addr] <= L34_Z;
	end
	
endmodule