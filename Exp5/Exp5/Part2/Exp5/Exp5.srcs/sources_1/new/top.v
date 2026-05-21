`timescale 1ns / 1ps

module top(
    input clk,                  
    input Set,                  
    input [3:0] TimerDigit0,    
    input [3:0] TimerDigit1,   
    output [7:0] LCDData,      
    output LCDE,              
    output LCDRS,              
    output LCDRW               
);

wire clk1Hz;
wire PBdebounced;
wire [3:0] Dig0;
wire [3:0] Dig1;
wire Done;

Divider divclk (
    .clkin(clk),
    .clkout(clk1Hz)
);

PBDebouncer debouncer (
    .CLK(clk),
    .PB(Set),
    .PB_deb(PBdebounced)
);

CountdownTimer timerCount (
    .clk(clk1Hz),
    .start(PBdebounced),     
    .Value0(TimerDigit0),    
    .Value1(TimerDigit1),    
    .Digit0(Dig0),
    .Digit1(Dig1),
    .Done(Done)
);

LCD_Driver lcd_inst (
    .CLK(clk),            
    .Digit1(Dig1),
    .Digit0(Dig0),
    .Done(Done),          
    .DB(LCDData),
    .RS(LCDRS),
    .RW(LCDRW),
    .E(LCDE)
);

endmodule