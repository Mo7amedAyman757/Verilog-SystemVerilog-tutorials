`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 06:28:26 PM
// Design Name: 
// Module Name: synch_rom
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


module synch_rom(
    input clk,
    input[2:0] addr,
    output reg[1:0] data
    );
    
    (*rom_style = "block"*)reg[1:0] rom [0:7];
    
    initial
        $readmemb("truth_table.mem", rom);
       
    always @(posedge clk)
    begin
        data <= rom[addr];
    end
    
endmodule
