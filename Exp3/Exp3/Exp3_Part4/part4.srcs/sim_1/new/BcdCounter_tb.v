`timescale 1ns / 1ps




module BcdCounter_tb(
);

parameter clkPeriod = 20;
reg clk , updown , Reset;
wire [3:0] Digit0, Digit1;

BcdCounter U1(clk, Reset , updown , Digit0 , Digit1);

initial begin
    updown = 0; Reset = 0; #(clkPeriod * 2);
    updown = 1; Reset = 0; #(clkPeriod * 2);
    updown = 1; Reset = 1; #(clkPeriod * 103); 
    updown = 0; Reset = 1; #(clkPeriod * 120);
    Reset = 0; #(clkPeriod * 2); 
end

initial begin : clk_generator
    clk = 1;
    forever begin : infinite_loop
        #(clkPeriod / 2) clk = ~clk;
    end
    
   
end

endmodule
