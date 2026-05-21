`timescale 1ns / 1ps



module TopEntityDebounce(
    input clk,
    input Reset,
    input updown,
    input pb,
    output  [3:0] cnt
    );
    wire debouncClk;
    DebounceConter U1(clk,pb,debouncClk);
    SyncCounter U2(debouncClk,updown,Reset,cnt);
endmodule
