`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 05:41:15 AM
// Design Name: 
// Module Name: FIFO_sync
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


module FIFO_sync
    #(parameter FIFO_DEPTH = 8, DATA_WIDTH = 32)(
        input clk,
        input reset_n,
        input cs,
        input wr_en,
        input rd_en,
        input  [DATA_WIDTH-1 : 0] data_in,
        output reg [DATA_WIDTH-1 : 0] data_out,
        output fifo_full,
        output fifo_empty
    );
    
    localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH); // FIFO_DEPTH_LOG = 3 (no.of bits required to represent 8 (000 to 111))
    
    reg [DATA_WIDTH-1 : 0] fifo [0:FIFO_DEPTH-1]; // DEPTH 8 => 32 bit of elements
    
    // Wr/Rd pointer have 1 extra bits at MSB
    reg [FIFO_DEPTH_LOG : 0] wr_ptr;
    reg [FIFO_DEPTH_LOG : 0] rd_ptr;
    
    //write operation
    always @(posedge clk or negedge reset_n)
    begin
        if(!reset_n) 
            wr_ptr <= 0; 
        else if(cs && !fifo_full && wr_en)
        begin
            fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end
    end
    
    //read operation
    always @(posedge clk or negedge reset_n)
    begin
        if(!reset_n) 
            rd_ptr <= 0; 
        else if(cs && !fifo_empty && rd_en)
        begin
            data_out <= fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]] ;
            rd_ptr <= rd_ptr + 1;
        end
    end
    
    assign fifo_full =  (rd_ptr == {~wr_ptr[FIFO_DEPTH_LOG],wr_ptr[FIFO_DEPTH_LOG-1:0]});
    assign fifo_empty = (rd_ptr == wr_ptr);
    
endmodule
