`timescale 1ns / 1ps


module ClkDivider(
    input clk_in,
    output reg clk_out
    );
    integer counter=0;
    always @(posedge clk_in)
    begin
    if(counter==49999999)
    begin
    counter=0;
    clk_out=~clk_out;
    end
    else
    counter=counter+1;
    end
endmodule
