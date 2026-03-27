`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 01:17:35 AM
// Design Name: 
// Module Name: ram_3ports
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
// 2-port: 2 async Read / 1 synch write

module ram_3ports
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)(
        input clk,
        input we,
        input [ADDR_WIDTH-1 : 0] r_addr0,
        input [ADDR_WIDTH-1 : 0] r_addr1,
        input [ADDR_WIDTH-1 : 0] w_addr,
        input [DATA_WIDTH-1 : 0] w_data,
        output [DATA_WIDTH-1 : 0] r_data0,
        output [DATA_WIDTH-1 : 0] r_data1
    );
    
    reg [DATA_WIDTH-1 : 0] memory [0 : 2**ADDR_WIDTH - 1];
    
    //write operation
    always @(posedge clk)
    begin
        if(we)
            memory[w_addr] <= w_data;    
    end
    
    //read operation
    assign r_data0 = memory[r_addr0];
    assign r_data1 = memory[r_addr1];
    
endmodule
