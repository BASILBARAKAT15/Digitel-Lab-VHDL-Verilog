`timescale 1ns / 1ps



module TopLevelsync(
    input Reset,
    input updown,
    input clk,
    output [3:0] Q
    );
     wire clk_out;
    ClkDivider U1(clk,clk_out);
    AutoUpDownC U2(clk_out,updown,Reset,Q);
endmodule
