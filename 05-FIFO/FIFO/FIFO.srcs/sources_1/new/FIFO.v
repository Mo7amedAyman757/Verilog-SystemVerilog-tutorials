`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 07:21:47 PM
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input clk,
    input reset_n,
    input wr_en,
    input rd_en,
    input [7:0] buf_in,
    output reg [7:0] buf_out,
    output reg buf_empty,buf_full,
    output reg [7:0] fifo_counter
    );
    
    reg [5:0] wr_ptr, rd_ptr;
    reg [7:0] buf_mem[63:0];
    
    always @(fifo_counter) 
    begin
        buf_empty <= (fifo_counter == 0);
        buf_full <= (fifo_counter == 63);
    end
    
    //Counter status
    always @(posedge clk or negedge reset_n)
    begin
        if(~reset_n)
        begin
            fifo_counter <= 0; 
            buf_full <= 0;
            buf_empty <= 1;
        end
        else if ((!buf_empty && rd_en) && (!buf_full && wr_en))  
            fifo_counter <= fifo_counter;
        else if (!buf_empty && rd_en)
            fifo_counter <= fifo_counter - 1;
        else if (!buf_full && wr_en)
            fifo_counter <= fifo_counter + 1;
        else
            fifo_counter <= fifo_counter;          
    end

    //Read operation
    always @(posedge clk or negedge reset_n)
    begin
        if(~reset_n)
            buf_out <= 0; 
        else if (!buf_empty && rd_en)
            buf_out <= buf_mem[rd_ptr];
        else
            buf_out <= buf_out;       
    end
    
    //Write operation
    always @(posedge clk)
    begin
        if (!buf_full && wr_en)
           buf_mem[wr_ptr] <= buf_in;
        else
            buf_mem[wr_ptr] <= buf_mem[wr_ptr];       
    end
    
    //Managing pointer
    always @(posedge clk or negedge reset_n)
    begin
        if(~reset_n) 
            begin
                wr_ptr <= 0; 
                rd_ptr <= 0;
            end
        else
            begin
                if(!buf_full && wr_en)
                    wr_ptr <= (wr_ptr == 63) ? 0: wr_ptr + 1;
                else
                    wr_ptr <= wr_ptr;
                if(!buf_empty && rd_en)
                    rd_ptr <= (rd_ptr == 63) ? 0: rd_ptr + 1;
                else
                    rd_ptr <= rd_ptr;                
            end
    end
 
endmodule
