`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 19:41:08
// Design Name: 
// Module Name: binarytoBCD
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


module binarytoBCD(
    input [11:0] binary,  //12 bit input data
    output reg [3:0] thousands,  //outputs thousands
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    
    reg [11:0] bcd_data=0;
    
    always@(binary)
    begin
        bcd_data=binary;
        thousands=bcd_data/1000;
        bcd_data=bcd_data%1000;
        hundreds = bcd_data/100;
        bcd_data=bcd_data%100;
        tens= bcd_data/10;
        bcd_data=bcd_data%10;
        ones = bcd_data%10;
    end
endmodule
