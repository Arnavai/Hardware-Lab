module Top_Module(
    input clk,  //fpga clock
    //input sw,   //switch[0] to enable the clock
    input rst,
    input btnC,     //mode control
    input btnU,     //incrementing the value   
    output [6:0] seg,    //
    output [7:0] an
    );
    
    wire [3:0] s1, s2, m1, m2, h1, h2;
    reg up;
    integer count=0;
    //reg rsto;
//    reg hrup, minup;
    
    wire btnClr;
    wire enable;
    wire control;
    wire increment;
//    reg btnClr_prev, btnUp_prev;
    pushbtn(rst,clk,btnClr);
   // pushbtn(sw, clk, enable);
    pushbtn(btnC,clk,control);
    pushbtn(btnU,clk,increment);
 
    
    //Instantiate the seven segment driver module and the digital clock module
    sevenseg_driver seg7(clk,btnClr, h1, h2, m1, m2,s1,s2, seg, an);
    digital_clock clock(clk,btnClr,control,increment, s1, s2, m1, m2, h1, h2);
    
endmodule
