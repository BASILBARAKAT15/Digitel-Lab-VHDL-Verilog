`timescale 1ns / 1ps

module CountdownTimer(
    input clk,
    input start,
    input [3:0] Value1,      
    input [3:0] Value0,      
    output reg [3:0] Digit1,
    output reg [3:0] Digit0,
    output reg Done,
    output reg active
);

reg [3:0] dig0 = 0;
reg [3:0] dig1 = 0;
reg start_prev = 0;

always @(posedge clk) begin

    if (start && !start_prev) begin
        dig1 <= Value1;      
        dig0 <= Value0;      
        Done <= 0;
        active <= 1;
    end

    else if (active && !Done) begin
        if (dig0 == 0) begin
            if (dig1 == 0) begin
                Done <= 1;
                active <= 0;
            end else begin
                dig1 <= dig1 - 1;
                dig0 <= 4'd9;
            end
        end else begin
            dig0 <= dig0 - 1;
        end
    end

    start_prev <= start;

    Digit0 <= dig0;
    Digit1 <= dig1;

end

endmodule