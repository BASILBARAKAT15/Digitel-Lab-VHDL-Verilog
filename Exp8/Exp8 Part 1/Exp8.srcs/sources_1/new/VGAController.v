`timescale 1ns / 1ps


module VGAContrller(
    input CLK,
    input Reset,
    output reg HS,
    output reg VS,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE
    );
wire clk_out;

integer hcount = 0, vcount = 0;

clkDiv Div(CLK, clk_out);

always @ (posedge clk_out , negedge Reset) begin
    if (Reset == 0) begin
        hcount = 0;
        vcount = 0;
        VS = 0;
        HS = 0;
    end else begin
       
        if (hcount < 96)
            HS = 0;
        else
            HS = 1;

        if (vcount < 2)
            VS = 0;
        else
            VS = 1;

        if (hcount == 799) begin
            hcount = 0;
            if (vcount == 524)
                vcount = 0;
            else
                vcount = vcount + 1;
        end else begin
            hcount = hcount + 1;
        end
    end
end

always@(posedge clk_out , negedge Reset)
begin 
if (Reset==0) begin 
RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 

else begin 
if (vcount  >=35 && vcount  <515) begin 
if (hcount >=144 && hcount <800) begin 
if (vcount  > 35 && vcount  <155) begin 
RED = 4'b1111;
BLUE=  4'b1111;
GREEN = 4'b0000;
end 

else if (vcount  >=155 && vcount  <275) begin 
 if (hcount >=144 && hcount <224) begin 
 RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 
else if  (hcount >=224 && hcount <384) begin 
 RED = 4'b1111;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 
else if  (hcount >=384 && hcount <544) begin 
 RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b1111;
end 
else if  (hcount >=544 && hcount <704) begin 
 RED = 4'b0000;
BLUE=  4'b1111;
GREEN = 4'b0000;
end 

else if  (hcount >=704 && hcount <784) begin 
 RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 
end 

else if (vcount  >=275 && vcount  <395) begin 
 if (hcount >=144 && hcount <224) begin 
 RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 
else if  (hcount >=224 && hcount <304) begin 
 RED = 4'b1111;
BLUE=  4'b0000;
GREEN = 4'b1111;
end 
else if  (hcount >=304 && hcount <464) begin 
 RED = 4'b1111;
BLUE=  4'b1111;
GREEN = 4'b1111;
end 
else if  (hcount >=464 && hcount <624) begin 
 RED = 4'b0000;
BLUE=  4'b1111;
GREEN = 4'b1111;
end 
else if  (hcount >=624 && hcount <704) begin 
 RED = 4'b1111;
BLUE=  4'b0000;
GREEN = 4'b1111;
end
 else if  (hcount >=704 && hcount <784) begin 
 RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end 
end
if (vcount  >= 395 && vcount  <515 ) begin 
RED = 4'b1111;
BLUE=  4'b1111;
GREEN = 4'b0000;
end 
end
else begin 
RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
end end 
else begin 
RED = 4'b0000;
BLUE=  4'b0000;
GREEN = 4'b0000;
 end
 end 
 end

endmodule
