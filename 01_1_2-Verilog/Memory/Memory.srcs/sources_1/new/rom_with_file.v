`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 06:19:09 PM
// Design Name: 
// Module Name: rom_with_file
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


module rom_with_file(
    input[2:0] addr,
    output[1:0] data
    );
    
    reg[1:0] rom [0:7];
    
    initial
        $readmemb("truth_table.mem", rom);
       
    assign data = rom[addr];
    
endmodule
