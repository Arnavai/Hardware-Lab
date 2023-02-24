`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 06:22:38
// Design Name: 
// Module Name: pushbtn
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

module pushbtn(
    input pb,clk_in,
    output led);


wire clk_out;
wire Q1, Q2, Q2_bar;

slowclk u1(clk_in, clk_out);
d_flipflop d1(clk_out, pb, Q1);
d_flipflop d2(clk_out, Q1, Q2);

assign Q2_bar =~Q2;
assign led = Q1 & Q2_bar;
endmodule
