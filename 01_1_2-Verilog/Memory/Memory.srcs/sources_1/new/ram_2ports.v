`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 01:07:23 AM
// Design Name: 
// Module Name: ram_2ports
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 2-port: 1 async Read / 1 synch write
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_2ports
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)(
        input clk,
        input we,
        input [ADDR_WIDTH-1 : 0] r_addr,
        input [ADDR_WIDTH-1 : 0] w_addr,
        input [DATA_WIDTH-1 : 0] w_data,
        output [DATA_WIDTH-1 : 0] r_data
    );
    
    reg [DATA_WIDTH-1 : 0] memory [0 : 2**ADDR_WIDTH - 1];
    
    //write operation
    always @(posedge clk)
    begin
        if(we)
            memory[w_addr] <= w_data;    
    end
    
    //read operation
    assign r_data = memory[r_addr];
    
endmodule
