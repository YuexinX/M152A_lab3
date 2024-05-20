`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 11:15:10 AM
// Design Name: 
// Module Name: seperate_digit
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


module seperate_digit(
//output
left, middle_left, middle_right, right,
//input
minute, second
    );
    
    input [5:0] minute;
    input [5:0] second;
    output [3:0] left;
    output [3:0] middle_left;
    output [3:0] middle_right;
    output [3:0] right;
    
    assign left = minute/10;
    assign middle_left = minute - (10*left);
    assign middle_right = second/10;
    assign right = second- 10*middle_right;
    
endmodule
