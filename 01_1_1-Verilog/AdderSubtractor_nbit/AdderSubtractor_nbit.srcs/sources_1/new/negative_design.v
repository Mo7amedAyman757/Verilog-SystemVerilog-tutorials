`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 12:18:26 AM
// Design Name: 
// Module Name: negative_design
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


module negative_design(
       input m , cout , s3,
       output neg_sign
    );
    
    assign neg_sign = (s3 | m) & (~cout);
    
endmodule
