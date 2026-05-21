`timescale 1ns / 1ps



module AutoUpDownC_tb(
    );
     parameter clk_period=20;
    reg updown,clk,Reset;
    wire [3:0] Q;
    AutoUpDownC UUT(.clk(clk),.updown(updown),.Reset(Reset),.Q(Q));
   
    initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
   
    Reset=0; 
    updown=0;
    #(clk_period*5);
    
    Reset=1; 
    updown=0;
    #(clk_period*12);
     
     Reset=1; 
     updown=1;
     #(clk_period*12);
     Reset=0; 
     updown=0;
     #(clk_period*2);

     end
     
     initial 
    begin : ClkGenerator
    clk=0;
    forever
    begin
    #(clk_period/2) clk=~clk;
    end
    end
    
endmodule
