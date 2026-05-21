`timescale 1ns / 1ps




module SyncCounter(
    input clk,
    input updown,
    input Reset,
    output reg [3:0] Q
    );
    always@ (posedge clk,negedge Reset)
    begin 
    if(!Reset)
    Q<=0;
    else if(!updown)
    begin
    if(Q==0)
    Q<=9;
    else 
    Q<=Q-1;
    end
    else 
    begin
    if(Q==9)
    Q<=0;
    else 
    Q<=Q+1;
    end 
    end
endmodule
