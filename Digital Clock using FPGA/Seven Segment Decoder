module mainfile(
input enable,
 input [0:0] in,  //4 bit input for the segment
    output reg [6:0] seg  //displays the BCD number on the 7 segment display
    );
    
    always@(in)
    
        if(enable==1'b0)            //if enable is 0 
            seg=7'b1111111;
        else
      
        begin
            case(in)            //if enable is 1 then the encoding for 0 and 1 on seven segment display
            0: seg=7'b0000001;  
            1: seg=7'b1001111;
            endcase
        end
    
    
endmodule
