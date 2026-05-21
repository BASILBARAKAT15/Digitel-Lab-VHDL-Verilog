`timescale 1ns / 1ps





module BcdToSeg(
    input [3:0] Bcd,
    output AA,
    output AB,
    output AC,
    output AD,
    output AE,
    output AF,
    output AG
    );
    reg [6:0] temp;
always @(Bcd) begin
 case (Bcd)
    4'd0: temp=7'b1111110;
4'd1: temp=7'b0110000;
4'd2: temp=7'b1101101;
4'd3: temp=7'b1111001;
4'd4: temp=7'b0110011;
4'd5: temp=7'b1011011;
4'd6: temp= 7'b1011111;
4'd7: temp= 7'b1110000;
4'd8: temp= 7'b1111111;
4'd9: temp= 7'b1111011;

default: temp=7'b0000000;
endcase
end 
assign {AA, AB, AC, AD, AE,AF,AG}=temp;
endmodule
