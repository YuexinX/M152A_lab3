`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 10:20:09 AM
// Design Name: 
// Module Name: counter
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


module counter(
//input
onehz_clk,
twohz_clk,
rst,
pause,
adj,
sel,
//output
secCntr,
minCntr 
    );
    
input onehz_clk;
input twohz_clk;
input adj;
input rst;
input sel;
input pause;
output [5:0] second;
output [5:0] minute;

reg [5:0] secCntr = 5'b0;
reg [5:0] minCntr = 5'b0;
reg pause_sig = 0;
wire clk;


chose_clk choose(.onehz_clk(onehz_clk), .twohz_clk(twohz_clk), .adj(adj), .clk(clk));



always@ (posedge pause) begin
    pause_sig <= ~pause_sig;
end

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        secCntr <= 5'b0;
        minCntr <= 5'b0;
    end
    else if (pause_sig) begin
        secCntr <= secCntr;
        minCntr <= minCntr;
    end
    else begin
        secCntr <= second;
        minCntr <= minute;
        if(adj) begin
            if (sel) begin
                if (secCntr == 59)
                    secCntr <= 5'b0;
                else
                    secCntr <= secCntr + 1;
            end    
            else begin
                if (minCntr == 59)
                    minCntr <= 5'b0;
                else
                    minCntr <= minCntr + 1;
            end
        end
        else begin
            if (secCntr == 59) begin
            
                secCntr <= 5'b0;
                if (minCntr == 59)
                    minCntr <= 5'b0;
                else 
                    minCntr <= minCntr + 1;
            end   
            else 
                secCntr <= secCntr + 1;
        end
    end
end

assign minute = minCntr;
assign second = secCntr;
    
endmodule
