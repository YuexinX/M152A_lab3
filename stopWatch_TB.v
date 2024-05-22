`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2024 11:03:22 AM
// Design Name: 
// Module Name: stopWatch_TB
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


module stopWatch_TB;
    reg sel;
    reg adj;
    reg rst;
    reg pause;
    reg clk;
    
    wire [3:0] annode;
    wire [6:0] segmen;
    
    stopWatch temp(.seg(segmen), .an(annode), .sel(sel), .adj(adj), .rst(rst), .pause(pause), .clk(clk));
    
    initial begin
        sel = 0;
        adj = 0;
        rst = 0;
        pause = 0;
        clk = 0;
        #100;
    end
    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin 
        adj = 0;
        #100
        adj = 1;
        sel = 0;
        #200
        adj = 1;
        sel = 1;
        #300
        adj = 0;
        sel = 0;
        pause = 1;
        #400
        pause = 0;
        rst = 1;
        #500
        rst = 0;
        #1000;
        $finish;
    end



endmodule
