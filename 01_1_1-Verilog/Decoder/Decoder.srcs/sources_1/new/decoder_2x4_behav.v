`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 01:08:23 AM
// Design Name: 
// Module Name: decoder_2x4_behav
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


module decoder_2x4_behav(
          input [1:0] w,
          output reg [0:3] z
    );
    
    //1- we use priority working 
    always @(w)
    begin
        z = 4'b0000;
//        if(w == 0)
//          z[0] = 1'b1;
//        else if (w == 1)
//          z[1] = 1'b1; 
//        else if (w == 2)
//          z[2] = 1'b1; 
//        else if (w == 3)
//          z[3] = 1'b1;
//        else
//          z=4'b0000;    

    //2- we use parallel case statement
       case(w)
          2'b00: z = 4'b1000;
           2'b01: z = 4'b0100;
            2'b10: z = 4'b0010;
             2'b11: z = 4'b0001;
       endcase 
    
    // 3- straightforward implementation   
       //z[w] = 1'b1;
    end
    
endmodule
