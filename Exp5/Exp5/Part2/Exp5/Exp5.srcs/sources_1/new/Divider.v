`timescale 1ns / 1ps

module Divider(
    input clkin,
    output reg clkout = 0
);
    integer c = 0;

    always @(posedge clkin) begin
        if (c == 50000000) begin
            c <= 0;
            clkout <= ~clkout;
        end else begin
            c <= c + 1;
        end
    end
endmodule