`timescale 1ns / 1ps

module VGAController(
    input clk,
    input Reset,
    input UP,
    input DW,
    input LT,
    input RT,
    output reg HS,
    output reg VS,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE
);

    wire clk_out;
    clkDivider divider(clk, clk_out);

    wire up_db, dw_db, lt_db, rt_db;
    Debounce db1(clk, UP, up_db);
    Debounce db2(clk, DW, dw_db);
    Debounce db3(clk, LT, lt_db);
    Debounce db4(clk, RT, rt_db);

    integer X = 439;
    integer Y = 250;

    wire clkY = up_db | dw_db;

    always @(posedge clkY or negedge Reset) begin
        if (!Reset) begin
            Y = 250;
        end else begin
            if(up_db && Y >= 45)
                Y = Y - 10;
            else if(dw_db && Y <= 455)
                Y = Y + 10;
        end
    end

    wire clkX = lt_db | rt_db;

    always @(posedge clkX or negedge Reset) begin
        if (!Reset) begin
            X = 439;
        end else begin
            if(lt_db && X >= 154)
                X = X - 10;
            else if(rt_db && X <= 724)
                X = X + 10;
        end
    end
    integer Hcount = 0, Vcount = 0;
    always @(posedge clk_out or negedge Reset) begin
        if (!Reset) begin
            Hcount = 0;
            Vcount = 0;
            HS = 0;
            VS = 0;
            RED = 0;
            GREEN = 0;
            BLUE = 0;
        end else begin

            if (Hcount < 96)
                HS = 0;
            else
                HS = 1;

            if (Vcount < 2)
                VS = 0;
            else
                VS = 1;
            if(Hcount == 799) begin
                Hcount = 0;
                if(Vcount == 524)
                    Vcount = 0;
                else
                    Vcount = Vcount + 1;
            end else begin
                Hcount = Hcount + 1;
            end
            if ((Vcount>=35 && Vcount<515) && (Hcount>=144 && Hcount<784)) begin
                if ((Vcount>=Y && Vcount<Y+50) && (Hcount>=X && Hcount<X+50)) begin
                    RED   = 4'b1111;
                    GREEN = 4'b0001;
                    BLUE  = 4'b0010;
                end else begin
                    RED   = 4'b1111;
                    GREEN = 4'b1111;
                    BLUE  = 4'b1111;
                end
            end else begin
                RED = 0;
                GREEN = 0;
                BLUE = 0;
            end
        end
    end

endmodule