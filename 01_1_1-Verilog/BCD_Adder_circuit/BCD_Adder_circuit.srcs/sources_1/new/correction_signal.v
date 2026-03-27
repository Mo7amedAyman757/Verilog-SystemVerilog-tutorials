`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 02:45:43 AM
// Design Name: 
// Module Name: correction_signal
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


module correction_signal(
         input s1,s2,s3,carry1,
         output cs
    );
    
    assign cs = ((s1 | s2) & s3) | carry1;
    
endmodule
