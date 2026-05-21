`timescale 1ns / 1ps



module TopLevelBcd(
    input Reset,
    input updown,
    input clk,
    output [6:0] sevensegcode,
    output common
    );
    wire clk_1h;
    clkDivider U1(clk,clk_1h);
    wire  [3:0] digit1,digit0;
    BcdCounter U2(clk_1h,Reset,updown,digit0,digit1);
    wire [3:0] bcdSelected;
    TimeMux U3(clk,digit0,digit1,bcdSelected,common);
    BcdToSeg U4(bcdSelected,sevensegcode[0],sevensegcode[1],sevensegcode[2],sevensegcode[3],sevensegcode[4],sevensegcode[5],sevensegcode[6]);
    
endmodule
