`timescale 1ns / 1ps




module DebounceConter(
    input clk,
    input pb,
    output reg pb_debounce
    );
    reg Ton=0,pb_old;
    integer counter=0;
    always@(posedge clk)
    
    begin
    if(Ton==0)begin
    if(pb_old!=pb)
    Ton=1;
    end
    else 
    begin 
    counter=counter+1;
    
    if(counter==1000000)
    begin
    Ton=0;
    counter=0;
    pb_old=pb;
    pb_debounce=~pb_debounce;
    end
    end
    end
    
endmodule
