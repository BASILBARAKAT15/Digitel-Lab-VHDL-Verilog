`timescale 1ns / 1ps


module clkDivider(
    input clkIn,
    output reg clkOut
    );
    integer r=0;
    initial
    begin
        clkOut = 0;
    end
    always @(posedge clkIn)
    begin
    r = r+1;
    if (r==2)begin
    r = 0;
    clkOut = ~clkOut;
    end
    end
endmodule
