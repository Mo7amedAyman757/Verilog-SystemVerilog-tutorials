`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 12:18:06 AM
// Design Name: 
// Module Name: overflow_design
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


module overflow_design(
        input x, y, s,
        output ov_sign
    );
    
    assign ov_sign = (~x & ~y & s) | (x & y & ~s);
endmodule
