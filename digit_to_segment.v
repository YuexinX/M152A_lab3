`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 11:24:32 AM
// Design Name: 
// Module Name: digit_to_segment
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


module digit_to_segment(
//input
num,
//output
segment
    );
    
    input [3:0] num;
    output [6:0] segment;
    reg [6:0] segment_temp;
    
    always @ (num) begin
        case (num) 
            0: segment_temp = 7'b1000000; 
            1: segment_temp = 7'b1111001; 
            2: segment_temp = 7'b0100100; 
            3: segment_temp = 7'b0110000; 
            4: segment_temp = 7'b0011001; 
            5: segment_temp = 7'b0010010; 
            6: segment_temp = 7'b0000010; 
            7: segment_temp = 7'b1111000; 
            8: segment_temp = 7'b0000000; 
            9: segment_temp = 7'b0010000; 
        endcase
    end
    assign segment = segment_temp;
endmodule
