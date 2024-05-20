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
seconds,
minutes 
    );
    
input onehz_clk;
input twohz_clk;
input adj;
input rst;
input sel;
input pause;
output [5:0] seconds;
output [5:0] minutes;

reg [5:0] minutes_temp = 5'b0;
reg [5:0] seconds_temp = 5'b0;
reg is_pause = 0;
wire used_clk;

chose_clk choose(.onehz_clk(onehz_clk), .twohz_clk(twohz_clk), .adj(adj), .sel_clk(used_clk));


always @ (posedge pause) begin
        is_pause <= ~is_pause;
    end
	always @ (posedge used_clk or posedge rst) begin
		// Reset 
		if (rst) begin
			minutes_temp <= 5'b0;
			seconds_temp <= 5'b0;
		end
		// Not reset (Clock mode)
		else begin
		if (~is_pause) begin
			minutes_temp <= minutes;
			seconds_temp <= seconds;
			// Adjust Clock Mode
			if (adj) begin
				// Adjust seconds, freeze minutes
				if (sel) begin
					// If max seconds, then reset seconds
					if (seconds_temp == 59) begin
						seconds_temp <= 5'b0;
					end
					// No overflow in seconds, so increment seconds
					else begin
						seconds_temp <= seconds_temp + 5'b1;
					end
				end
				// Adjust minutes, freeze seconds
				else begin
					// If max minutes, then reset minutes
					if (minutes_temp == 59) begin
						minutes_temp <= 5'b0;
					end
					// No overflow in minutes, so increment minutes
					else begin
						minutes_temp <= minutes_temp + 5'b1;
					end
				end
			end
			// Normal Clock Mode
			else begin
                // If max stopwatch time, then reset both minutes and seconds
                if (minutes_temp == 59 && seconds_temp == 59) begin
                    minutes_temp <= 5'b0;
                    seconds_temp <= 5'b0;
                end
                // If max seconds, then reset seconds, increment minutes
                else if (minutes_temp != 59 && seconds_temp == 59) begin
                    minutes_temp <= minutes_temp + 5'b1;
                    seconds_temp <= 5'b0;
                end
                // No overflow in minutes or seconds, so increment seconds
                else begin
                    seconds_temp <= seconds_temp + 5'b1;
                end
			end
		end
		end
	end

	assign minutes = minutes_temp;
	assign seconds = seconds_temp;

endmodule
