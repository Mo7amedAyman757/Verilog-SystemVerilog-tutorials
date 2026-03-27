`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 08:15:15 PM
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb(

    );
    
    // 1- Delcare local reg and wire
        reg clk;
        reg reset_n;
        reg wr_en;
        reg rd_en;
        reg [7:0] buf_in;
        wire [7:0] buf_out;
        wire buf_empty, buf_full;
        wire [7:0] fifo_counter;
        
    // 2- Intantiate the module under test
    FIFO uut (
        .clk(clk),
        .reset_n(reset_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .buf_empty(buf_empty),
        .buf_full(buf_full),
        .fifo_counter(fifo_counter)
    );
    
    // 3- General stimuli using always and initial
    localparam T = 20;
    
    always 
    begin
        clk = 1'b0;
        # (T / 2);
        clk = 1'b1;
        # (T / 2);
    end
    
    initial begin
        // Initialize
        clk = 0;
        reset_n = 1;
        wr_en = 0;
        rd_en = 0;
        buf_in = 8'd0;

        // Apply reset
        #20;
        reset_n = 0;
        #10;

        // Write 5 bytes into FIFO
        $display("=== Writing data to FIFO ===");
        repeat (5) begin
            @(posedge clk);
            wr_en = 1;
            buf_in = buf_in + 8'd10;   // Data pattern: 10, 20, 30, ...
            $display("[%0t ns] WRITE: buf_in = %0d, fifo_counter = %0d", 
                      $time, buf_in, fifo_counter);
        end
        @(posedge clk);
        wr_en = 0;

        // Wait a few cycles
        #20;

        // Read 5 bytes from FIFO
        $display("\n=== Reading data from FIFO ===");
        repeat (5) begin
            @(posedge clk);
            rd_en = 1;
            $display("[%0t ns] READ: buf_out = %0d, fifo_counter = %0d", 
                      $time, buf_out, fifo_counter);
        end
        @(posedge clk);
        rd_en = 0;

        // Wait and finish
        #20;
        $display("\n=== Simulation Complete ===");
        $stop;
    end

    
endmodule
