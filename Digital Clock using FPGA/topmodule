module topmod(
    input clk,      //always checks if sw0 is pressed or not in the code
    input currentin,        //used to perform any operation
    input [2:0] opt,      //operation code
    input [2:0] index,      //R value (index of REGISTER FILE)
    input [7:0] num,  //Used to scan the accumulator value
    output [6:0] seg,    //the 7 sticks in a given 7 segment display
    output [7:0] an        // the 8 seven segment displays
    );
    reg [0:0] current = 1'b0;      //stores the value of sw0 in current clock cycle
    reg [0:0] prev = 1'b0;          // stores the value pf sw0 in previous clock cycle
    reg [7:0] ACC=8'b00000000 ;     //8 bit ACCUMULATOR
    reg [7:0] RF [7:0];              //8x8 REGISTER FILE
    reg [2:0] R=3'b000;        //R value (index of Register file)
    reg en;                     //1 bit register to store if PRINT operation is on or not(enables the seven segment driver)
    always@(posedge clk )
    begin
        prev = current;             
        current = currentin;
        R <=index;
        
        if(prev == 1'b0 && current == 1'b1)   //start reading the operations if sw0 is switched on in current clock cycle
        begin
             en=1'b0;           
            if(opt == 3'b000)        
            begin 
                //current_op<=add;

               ACC <= ACC+RF[R];         //Adding RF[R] value to ACC
               
                
            end 
            
            else if(opt == 3'b001)
            begin
                //current_op<=sub;
               
               ACC <= ACC- RF[R];         //Subtracting RF[R] value from ACC
             end
                    
            else if(opt == 3'b010)
            begin 
                //current_op<=load;
                
                    ACC <= RF[R];       //Moving RF[R] value to ACC
            end
            else if(opt == 3'b011)
            begin
               // current_op<=store;

                  RF[R] <= ACC;     //Moving ACC value to RF[R]
                    
            end
            else if(opt == 3'b100)
            begin
               // current_op<=scan;
               ACC <= num;      //copying input value to ACC
                
            end
            else if(opt == 3'b101)
            begin
               // current_op<=print;
                en <= 1'b1;
            end
                
        end
    end
    
    //Instantiating the seven segment driver module
    sevenseg_driver seg7(clk, en, ACC[7], ACC[6],ACC[5], ACC[4],ACC[3],ACC[2],ACC[1], ACC[0], seg, an);
endmodule
