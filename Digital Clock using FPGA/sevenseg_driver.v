`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 18:08:54
// Design Name: 
// Module Name: sevenseg_driver
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


module sevenseg_driver(
    input clk,
    input clr,
    input [3:0] h1,
    input [3:0] h2,
    input [3:0] m1,
    input [3:0] m2,
    input [3:0] s1,
    input [3:0] s2,
    output reg [6:0] seg,
    output reg [7:0] an
    );
    wire[6:0] seg1,seg2,seg3,seg4,seg5,seg6;
    reg [12:0] segclk;   //for turning segment displays one by one on the board, 8192, 0-8191
    localparam first =3'b000, second =3'b001, third =3'b010, fourth=3'b011, fifth =3'b100, sixth = 3'b101 ;
    reg [2:0] state=first;
    
    always@(posedge clk)
    segclk <= segclk+1'b1; //counter goes up by 1
    
    always@(posedge segclk[12] or posedge clr)
    begin
        if(clr==1)
        begin
            seg<=7'b0000000;
            an<=8'b00000000;
            state<=first;
        end
        else
        begin
            case(state)
                first:
                begin seg<=seg1;
                an<=8'b11011111;
                state<=second;
                end
                second:
                begin
                seg<=seg2;
                an<=8'b11101111;
                state<=third;
                end
                third:
                begin
                seg <=seg3;
                an<=8'b11110111;
                state<=fourth;
                end 
                fourth: begin
                seg <=seg4;
                an<=8'b11111011;
                state <=fifth;
                end
                fifth:
                begin
                seg<=seg5;
                an<=8'b11111101;
                state<=sixth;
                end
                sixth:
                begin
                seg<=seg6;
                an<=8'b11111110;
                state<=first;
                end
                
            endcase
        end
    end
   
    mainfile disp1(h1, seg1);
    mainfile disp2(h2, seg2);
    mainfile disp3(m1, seg3);
    mainfile disp4(m2, seg4);
    mainfile disp5(s1, seg5);
    mainfile disp6(s2, seg6);
    
endmodule
