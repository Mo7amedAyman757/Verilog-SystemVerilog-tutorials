`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 08:26:13 PM
// Design Name: 
// Module Name: MUX_4x1_nbits
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


module MUX_4x1_nbits
    #(parameter BITS = 4)(
        input [BITS-1 : 0] w0, w1, w2, w3,
        input [1:0] se,
        output reg [BITS-1 : 0] y
    );
    
    always @(w0,w1,w2,w3,se)
    begin
        case(se)
            2'b00: y = w0;
            2'b01: y = w1;
            2'b10: y = w2;
            2'b11: y = w3;
            default: y = {BITS{1'bx}};
        endcase
    end
    
endmodule
