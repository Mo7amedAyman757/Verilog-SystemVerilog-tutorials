`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 09:11:58 PM
// Design Name: 
// Module Name: FIFO_sync_tb
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


module FIFO_sync_tb(

    );
    
    // 1- Delcare local reg and wire
    parameter FIFO_DEPTH = 8;
    parameter DATA_WIDTH =32;
    reg clk = 0;
    reg reset_n;
    reg cs;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1 : 0] data_in;
    wire [DATA_WIDTH-1 : 0] data_out;
    wire empty;
    wire full;
    
    integer i;
    
    // 2- Intantiate the module under test
    FIFO_sync
    #(.FIFO_DEPTH(FIFO_DEPTH),
      .DATA_WIDTH(DATA_WIDTH)) uut(
        .clk(clk),
        .reset_n(reset_n),
        .cs(cs),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );
    
    // 3- General stimuli using always and initial
    localparam T = 10;
    
    always 
    begin
        clk = 1'b0;
        # (T / 2);
        clk = 1'b1;
        # (T / 2);
    end
    
    task write_data(input[DATA_WIDTH-1:0] d_in);
        begin
            @(posedge clk)
            cs = 1; wr_en = 1;
            data_in = d_in;
            @(posedge clk)
            cs = 1; wr_en = 0;
        end
    endtask
    
    task read_data();
        begin
            @(posedge clk)
            cs = 1; rd_en = 1;
            @(posedge clk)
            cs = 1; rd_en = 0;
        end
    endtask
    
    
    initial 
    begin
        #1;
        reset_n = 0; rd_en = 0; wr_en = 0;
        
        @(posedge clk)
        reset_n = 1;
        // scenario 1
        write_data(1);
        write_data(10);
        write_data(100);
        
        read_data();
        read_data();
        read_data();
        
        // scenario 2
        
        for(i = 0; i < FIFO_DEPTH; i = i+1)
        begin
            write_data(2**i);
            read_data();
        end
        
        // scenario 3
        
        for(i = 0; i < FIFO_DEPTH; i = i+1)
        begin
            write_data(2**i-1);
        end
        
        for(i = 0; i < FIFO_DEPTH; i = i+1)
        begin
            read_data();
        end
        
        #40 $finish;
    end
    
  
endmodule
