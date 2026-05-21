`timescale 1ns / 1ps


module BcdCounter(
    input clk,
    input Reset,
    input updown,
    output reg [3:0] Digit0,
    output reg [3:0] Digit1
    );
    always @(posedge clk or negedge Reset)
 begin 

if(!Reset)
    begin 
Digit0=4'b0000;
Digit1=4'b0000;
        end
    

 else if(updown) //couting up at 1
begin
        
if(Digit0<9) 
     begin
Digit0=Digit0+1;
        end

else 
begin

Digit0=0;
if(Digit1==9)
begin
Digit1=0;
end
else 

begin 
Digit1=Digit1+1;
end 
    end
   
            end

else if(!updown)

begin

if(Digit0==0)
begin 
Digit0=4'b1001;

if(Digit1==0)
Digit1=4'b1001;
else
Digit1=Digit1-1;
end
else 
Digit0=Digit0-1;
end 
                    end
      endmodule
