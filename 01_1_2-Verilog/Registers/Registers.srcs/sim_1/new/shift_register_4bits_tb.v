`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 10:48:11 AM
// Design Name: 
// Module Name: shift_register_4bits_tb
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


module shift_register_4bits_tb(

    );
     // 1- Declare local reg and wire identifiers
        localparam N = 4;
        reg clk;
        reg IN;
        wire OUT;      
        wire [N - 1 : 0] Q;
        
    // 2- Instatiate the module under test   
    shift_register_4bits #(.N(N)) RS(
        .clk(clk),
        .IN(IN),
        .OUT(OUT),
        .Q(Q)
    ); 
    
    // 3- General stimuli, using always and initial
    initial 
    begin
        #140 $stop;
    end
    
    localparam T = 20; //clock period
    
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial 
    begin
      
      @(posedge clk) IN = 1'b1;
      @(posedge clk) IN = 1'b0;
      @(posedge clk) IN = 1'b1;
      @(posedge clk) IN = 1'b0;
      @(posedge clk) IN = 1'b1;
      @(posedge clk) IN = 1'b0;
      
     
    end  
endmodule
