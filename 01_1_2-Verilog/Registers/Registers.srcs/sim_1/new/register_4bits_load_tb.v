`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 10:29:59 AM
// Design Name: 
// Module Name: register_4bits_load_tb
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


module register_4bits_load_tb(

    );
       
    // 1- Declare local reg and wire identifiers
        localparam N = 4;
        reg clk;
        reg load;
        reg [N -1 : 0] I;      
        wire [N - 1 : 0] Q;
        
    // 2- Instatiate the module under test   
    register_4bits_load #(.N(N)) RS(
        .clk(clk),
        .load(load),
        .I(I),
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
      
      #20;
      I = 4'b0001;
      load = 1'b0;
      
      #40;
      I = 4'b0010;
      load = 1'b1;
      
      #20;
      
      I = 4'b0100;
      
      
    end
    
endmodule
