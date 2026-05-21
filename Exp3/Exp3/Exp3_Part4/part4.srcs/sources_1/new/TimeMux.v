`timescale 1ns / 1ps



module TimeMux(
    input clk,
    input [3:0] Digit0,
    input [3:0] Digit1,
    output reg [3:0] BcdValue,
    output reg DigSelect
    );
    integer count = 0 ;
always @ (posedge clk) begin

if (count == 999999) begin
count <= 0;
DigSelect <= ~DigSelect ;
end

else 
count <= count + 1 ;

if (DigSelect)
BcdValue <= Digit1;

else 
BcdValue <= Digit0;

end 

    
    
endmodule
