`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 06:19:38
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
    input clk,        //input slow clock
    input D,       //pushbutton
    output reg Q,         
    output reg Qbar
    );
    
    always@(posedge clk)
    begin
        Q <= D;
        Qbar <= ~Q;
    end
endmodule
