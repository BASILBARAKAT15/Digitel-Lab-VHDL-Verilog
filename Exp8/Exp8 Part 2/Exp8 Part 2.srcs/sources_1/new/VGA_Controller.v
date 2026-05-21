`timescale 1ns / 1ps
module VGA_Controller(
    input CLK,
    input Reset,
    output reg HS,
    output reg VS,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE
    );
   reg [18:0] addr = 0;
wire [11:0] RGB_Value;
wire clk_out;

integer hcount = 0, vcount = 0;

clkDivider divider(CLK, clk_out);
image_memory MEMORY(.clka(clk_out), .addra(addr), .douta(RGB_Value));

always @ (posedge clk_out or negedge Reset) begin
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

always @(negedge Reset or posedge clk_out) begin
    if (Reset == 0) begin
        RED   = 4'b0000;
        GREEN = 4'b0000;
        BLUE  = 4'b0000;
        addr  = 0;
    end else begin
        if (addr == 307200) begin
            addr = 0;
        end


        if (vcount >= 35 && vcount < 515 && hcount >= 144 && hcount < 784) begin
            BLUE  = RGB_Value[11:8];
            GREEN = RGB_Value[7:4];
            RED   = RGB_Value[3:0];
            addr  = addr + 1;
        end else begin
            BLUE  = 4'b0000;
            GREEN = 4'b0000;
            RED   = 4'b0000;
        end
    end
end
endmodule
       