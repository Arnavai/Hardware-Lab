module sevenseg_driver(
 input clk,
 input enable,
    input acc1,
    input acc2,
    input acc3,
    input acc4,
    input acc5,
    input acc6,
    input acc7,
    input acc8,
    output reg [6:0] seg,
    output reg [7:0] an
    );
    wire[6:0] seg1,seg2,seg3,seg4,seg5,seg6,seg7,seg8;
    reg [12:0] segclk;   //for turning segment displays one by one on the board, 8192, 0-8191
    localparam first =3'b000, second =3'b001, third =3'b010, fourth=3'b011, fifth =3'b100, sixth = 3'b101, seventh=3'b110, eighth=3'b111 ;
    reg [2:0] state=first;
    
    always@(posedge clk)
    segclk <= segclk+1'b1; //counter goes up by 1
    
    always@(posedge segclk[12])
    begin
        
           
                case(state)
                    first:
                    begin 
                        seg<=seg1;
                        an<=8'b01111111;
                        state<=second;
                    end
                    second:
                    begin
                        seg<=seg2;
                        an<=8'b10111111;
                        state<=third;
                    end
                    third:
                    begin
                        seg <=seg3;
                        an<=8'b11011111;
                        state<=fourth;
                    end 
                    fourth: 
                    begin
                        seg <=seg4;
                        an<=8'b11101111;
                        state <=fifth;
                    end
                    fifth:
                    begin
                        seg<=seg5;
                        an<=8'b11110111;
                        state<=sixth;
                    end
                    sixth:
                    begin
                        seg<=seg6;
                        an<=8'b11111011;
                        state<=seventh;
                    end
                    seventh:
                    begin
                        seg<=seg7;
                        an<=8'b11111101;
                        state<=eighth;
                    end
                    eighth:
                    begin
                        seg<=seg8;
                        an<=8'b11111110;
                        state<=first;
                    end
                    
                endcase
             end
   
    
    //Instantiating the mainfile module
    mainfile disp1(enable, acc1, seg1);
    mainfile disp2(enable, acc2, seg2);
    mainfile disp3(enable,acc3, seg3);
    mainfile disp4(enable,acc4, seg4);
    mainfile disp5(enable,acc5, seg5);
    mainfile disp6(enable,acc6, seg6);
    mainfile disp7(enable,acc7, seg7);
    mainfile disp8(enable,acc8, seg8);
     
endmodule
