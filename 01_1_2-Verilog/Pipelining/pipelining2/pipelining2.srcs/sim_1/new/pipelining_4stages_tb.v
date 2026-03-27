`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 03:42:14 AM
// Design Name: 
// Module Name: pipelining_4stages_tb
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


module pipelining_4stages_tb();

// 1- declare local wire and reg
    reg clk1;
    reg clk2;
    reg reset_n;
    
    reg [3:0] rs1;
    reg [3:0] rs2;
    reg [3:0] rd_addr;
    reg [3:0] func;
    reg wr;
    
    reg [7:0] addr;
    
    wire [15:0] Z;

// 2- Instantiate DUT
pipelining_4stages DUT (
    .clk1(clk1),
    .clk2(clk2),
    .reset_n(reset_n),
    .rs1(rs1),
    .rs2(rs2),
    .rd_addr(rd_addr),
    .func(func),
    .wr(wr),
    .addr(addr),
    .Z(Z)
);

// 3- general stimuli using always and initial
    always begin
        #5 clk1 = 1; #5 clk1 = 0;
        #5 clk2 = 1; #5 clk2 = 0;
    end
    
     /////////////////////////////////////////////////////
    // Initialize register bank 
    /////////////////////////////////////////////////////
    integer k;
    initial
    for (k = 0; k < 16; k = k + 1)
        DUT.regbank[k] = k;
    
    initial begin
    clk1 =0;
    clk2 = 0;
    reset_n = 0;
    rs1 = 0;
    rs2 = 0;
    rd_addr = 0;
    func = 0;
    addr = 0;
    wr = 0;

    #20;
    reset_n = 1;
    
    #5 rs1 = 3; rs2 = 5; rd_addr = 10; func = 0; addr = 125; 
    #20 rs1 = 3; rs2 = 8; rd_addr = 12; func = 2; addr = 126;
    #20 rs1 = 10; rs2 = 5; rd_addr = 14; func = 1; addr = 128;
    #20 rs1 = 7; rs2 = 3; rd_addr = 13; func = 11; addr = 127;
    #20 rs1 = 10; rs2 = 5; rd_addr = 15; func = 1; addr = 129;
    #20 rs1 = 12; rs2 = 13; rd_addr = 16; func = 0; addr = 130;
    #200;
    $stop;

end

endmodule
