`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 10:49:01 AM
// Design Name: 
// Module Name: stopWatch
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


module stopWatch(
//output
seg, an,
//input
sel, adj, rst, pause, clk
    );
    
    input sel;
    input adj;
    input rst;
    input pause;
    input clk;
    output [6:0] seg;
    output [3:0] an;
    
    wire onehz_clk;
    wire tick_clk;
    wire blink_clk;
    wire display_clk;


    
    SetClk setClk(.sys_clk(clk), .rst(rst), .onehz_clk(onehz_clk), .twohz_clk(tick_clk), .blink_clk(blink_clk), .fast_clk(display_clk));
    
    wire [5:0] second;
    wire [5:0] minute;
    counter counter(.onehz_clk(onehz_clk), .twohz_clk(tick_clk), .rst(rst), .pause(pause), .adj(adj), .sel(sel), .seconds(second), .minutes(minute));
    
    
    wire [3:0] minute_10;
    wire [3:0] minute_1;
    wire [3:0] second_10;
    wire [3:0] second_1;
    
    seperate_digit digits(.minute(minute), .second(second), .left(minute_10), .middle_left(minute_1), .middle_right(second_10), .right(second_1));
    
    wire [6:0] left_num;
    wire [6:0] middle_left_num;
    wire [6:0] middle_right_num;
    wire [6:0] right_num;
    
//    always @(*) begin
//        $display("top is called");
//    end
    
    
    digit_to_segment tens_minute(.num(minute_10), .segment(left_num));
    digit_to_segment ones_minute(.num(minute_1), .segment(middle_left_num));
    digit_to_segment tens_second(.num(second_10), .segment(middle_right_num));
    digit_to_segment ones_second(.num(second_1), .segment(right_num));
    


    
    seven_segment display(.seg(seg), .an(an), .display_clk(display_clk), .blink_clk(blink_clk), .sel(sel), .adj(adj), .left(left_num), .middle_left(middle_left_num), .middle_right(middle_right_num), .right(right_num));
    
    
endmodule
