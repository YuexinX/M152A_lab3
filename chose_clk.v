`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 10:47:06 AM
// Design Name: 
// Module Name: chose_clk
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


module chose_clk(
//input
onehz_clk,
twohz_clk,
adj,
//output
sel_clk
    );
input onehz_clk;
input twohz_clk;
input adj;
output sel_clk;
reg clk_temp;

always @ (*) begin
    if (adj)
        clk_temp = twohz_clk;
    else
        clk_temp = onehz_clk;
end

assign sel_clk = clk_temp;

    
endmodule
