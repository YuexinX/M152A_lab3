`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 10:20:09 AM
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
//output
seg, an,
//input
display_clk, blink_clk, sel, adj, left, middle_left, middle_right, right);
    
    output [6:0] seg;
    output [3:0] an;
    
    input display_clk;
    input blink_clk;
    input sel;
    input adj;
    input [6:0] left;
    input [6:0] middle_left;
    input [6:0] middle_right;
    input [6:0] right;
    
    reg [1:0] cur_seg = 2'b0;
    reg [3:0] an_temp;
    reg [6:0] seg_temp;
    
    always @ (posedge display_clk) begin
        if (cur_seg == 0)begin
            cur_seg <= cur_seg+1;
            an_temp <= 4'b0111;
            if (adj && !sel)begin
                if (blink_clk)
                    seg_temp <= left;
                else
                    seg_temp <= 7'b1111111;
            end
            else
                seg_temp <= left;
        end
        else if (cur_seg == 1)begin
            cur_seg <= cur_seg+1;
            an_temp <= 4'b1011;
            if (adj && !sel)begin
                if (blink_clk)
                    seg_temp <= middle_left;
                else
                    seg_temp <= 7'b1111111;
            end
            else
                seg_temp <= middle_left;
        end
        else if (cur_seg == 2)begin
            cur_seg <= cur_seg+1;
            an_temp <= 4'b1101;
            if (adj && sel)begin
                if (blink_clk)
                    seg_temp <= middle_right;
                else
                    seg_temp <= 7'b1111111;
            end
            else
                seg_temp <= middle_right;
        end
        else if (cur_seg == 3)begin
            cur_seg <= 0;
            an_temp <= 4'b1110;
            if (adj && sel)begin
                if (blink_clk)
                    seg_temp <= right;
                else
                    seg_temp <= 7'b1111111;
            end
            else
                seg_temp <= right;
        end
//        $display("seven segment is called: %b", seg_temp);
//        $display("seven segment is called: %b", an_temp);
    end  
    
    
    assign seg = seg_temp;
    assign an = an_temp;
endmodule
