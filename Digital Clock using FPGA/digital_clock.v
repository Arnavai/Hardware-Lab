`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 20:01:47
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk,
    //input en,  //enable
    input rst , //resets the time
    input slct, //select increment type 
    input up,  //used to increment
    output [3:0] s1,
    output [3:0] s2,
    output [3:0] m1,
    output [3:0] m2,
    output [3:0] h1,
    output [3:0] h2
    );
    reg [0:0] en = 1'b1;
    
    reg [5:0] hour=0, min=0, sec=0;  //6 bits because mins and secs go to 59
    integer clkc = 0;
    integer clks=0;
    localparam onesec=100_000_000; //1 second
    localparam toggle=2_000_000;
    localparam hr =2'b01, mn =2'b10, sc =2'b11; //nothing=2'b00;
    reg [1:0] slct_state = hr;
    
    
    always @(posedge clk)
    begin
                 clkc<=clkc+1;

        //reset clock
        if(rst==1'b1)
            {hour,min,sec}<=0;
            
//        else if(en == 1'b1)
//            if(clkc==onesec)
//            begin
//                clkc <= 0;
//                if(sec==6'd59)
//                    begin sec <= 0;
//                    if(min==6'd59)
//                        begin min <= 0;
//                        if(hour==6'd23)
//                            hour <= 0;
//                        else 
//                            hour <= hour + 1'd1;
//                        end
//                    else
//                        min <= min+1'd1;
//                    end
//                else
//                    sec <= sec+1'd1;
//                end
        //set clock
//        else if( slct)
//        begin
//            case(slct_state)
               
//                hr:
//                    begin 
//                        slct_state <= mn;
//                    end
//                mn:
//                    begin
//                        slct_state <= sc;
//                    end
//                sc:
//                    begin
//                        slct_state <= hr;
//                    end
//             endcase
//          end
        
           
//        else if(up)
//            if(slct_state == hr)
//                if(hour == 6'd23)
//                    hour <= 0;
//                else 
//                    hour <= hour+6'd1;
//            else if(slct_state == mn)
//                if(min == 6'd59)
//                    min <= 0;
//                else 
//                    min <= min+6'd1;
//             else if(slct_state == sc)
//                if(sec == 6'd59)
//                    sec <= 0;
//                else 
//                    sec <= sec+6'd1;
                
        //count
        else if(en== 1'b1)
        begin
            if(clkc==onesec)
            begin
                 clkc <= 0; 
                if(sec==6'd59)
                    begin sec <= 0;
                    if(min==6'd59)
                        begin min <= 0;
                        if(hour==6'd23) 
                            hour <= 0;
                         
                        else
                            hour <= hour + 6'd1;
                            end
                    
                    else
                        min <= min+6'd1;
              end
                else
                    sec <= sec+6'd1;        
                end
              
            end    
                       
//        else if(en == 1'b1)
//            if(clkc==onesec)
//            begin
//                clkc <= 0;
//                if(sec==6'd59)
//                    begin sec <= 0;
//                    if(min==6'd59)
//                        begin min <= 0;
//                        if(hour==6'd23)
//                            hour <= 0;
//                        else 
//                            hour <= hour + 1'd1;
//                        end
//                    else
//                        min <= min+1'd1;
//                    end
//                else
//                    sec <= sec+1'd1;
//                end
    
         if( slct)
        begin
            case(slct_state)
               
                hr:
                    begin 
                        slct_state <= mn;
                    end
                mn:
                    begin
                        slct_state <= sc;
                    end
                sc:
                    begin
                        slct_state <= hr;
                    end
             endcase
          end
        
           
        if(up)
        begin
            clks=clks+1;
            if(clks==toggle)
            begin
            clks<=0;
            if(slct_state == hr)
            begin
                if(hour == 6'd23)
                    hour <= 0;
                else 
                    hour <= hour+6'd1;
            end
            else if(slct_state == mn)
            begin
                if(min == 6'd59)
                    min <= 0;
                else 
                    min <= min+6'd1;
            end        
             else if(slct_state == sc)
             begin
                if(sec == 6'd59)
                    sec <= 0;
                else 
                    sec <= sec+6'd1;
             end       
         
               
         end
         
         end
         
        
end
            //Instantiating the binarytoBCD module here to convert the numbers and display on the 7 segment display
            binarytoBCD secs(.binary(sec), .thousands(), .hundreds(), .tens(s2), .ones(s1));
            binarytoBCD mins(.binary(min), .thousands(), .hundreds(), .tens(m2), .ones(m1));
            binarytoBCD hours(.binary(hour), .thousands(), .hundreds(), .tens(h2), .ones(h1));
         
    
endmodule
