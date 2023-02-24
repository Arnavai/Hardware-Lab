`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 06:08:35
// Design Name: 
// Module Name: slowclk
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


module slowclk(
    input clk_in, //input clock of 200MHz
    output clk_out  // 4Hz slow clock
    );
    reg [25:0] count=0;
    reg clk_out;
    
    always@(posedge clk_in)
    begin
        count <= count+1;
        if(count == 1_000_000)
        begin
        count <= 0;  //counter resets itself to 0
        clk_out =~clk_out;  //inverts the clock
        end
     end
endmodule
