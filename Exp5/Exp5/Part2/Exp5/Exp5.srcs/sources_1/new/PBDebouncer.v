`timescale 1ns / 1ps

module PBDebouncer(
    input CLK,
    input PB,
    output reg PB_deb
);
    
    integer c = 0;
    reg PB_CH = 0;
    reg PB_o = 0;
    parameter MAXCOUNT = 1000000;
    
    always @(posedge CLK)
    begin
        if(PB_CH)
        begin
            if(c == MAXCOUNT)
            begin
                c <= 0;
                PB_CH <= 0;
            end
            else
            begin
                c <= c + 1;
            end
        end 
        else
        begin
            if(PB != PB_o)
            begin
                PB_CH <= 1;
                PB_o <= PB;
                PB_deb <= PB;
            end
        end  
    end
endmodule