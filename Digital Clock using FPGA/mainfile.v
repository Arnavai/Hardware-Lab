`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 17:51:28
// Design Name: 
// Module Name: mainfile
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


module mainfile(
    input [3:0] in,  //4 bit input for the segment
    output reg [6:0] seg  //displays the BCD number on the 7 segment display
    );
    
    always@(in)
    begin
    case(in)
    0: seg=7'b0000001;
    1: seg=7'b1001111;
    2: seg=7'b0010010;
    3: seg=7'b0000110;
    4: seg=7'b1001100;
    5: seg=7'b0100100;
    6: seg=7'b0100000;
    7: seg=7'b0001111;
    8: seg=7'b0000000;
    9: seg=7'b0000100;
    endcase
    end
    
    
    
endmodule
