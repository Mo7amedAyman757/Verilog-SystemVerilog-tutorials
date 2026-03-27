`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 10:16:47 AM
// Design Name: 
// Module Name: register_4bits_tb
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


module register_4bits_tb(

    );
    
    // 1- Declare local reg and wire identifiers
        localparam N = 4;
        reg clk;
        reg [N -1 : 0] I;      
        wire [N - 1 : 0] Q;
        
    // 2- Instatiate the module under test   
    register_4bits #(.N(N)) RS(
        .clk(clk),
        .I(I),
        .Q(Q)
    ); 
    
    // 3- General stimuli, using always and initial
    initial 
    begin
        #100 $stop;
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
      I = 4'b0001;
      
      #20;
      
      I = 4'b0010;
      
      #20;
      
      I = 4'b0011;
      
      #20;
      
      I = 4'b0100;
      
    end
    
endmodule
