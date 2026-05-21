`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 11:27:30 AM
// Design Name: 
// Module Name: ASHNC_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module ASHNC_TB(
    );
    parameter clk_period=20;
    reg Enable,CLK,Reset;
    wire [3:0] Q;
    ASYNCCounter UUT(.CLK(CLK),.Enable(Enable),.Reset(Reset),.Q(Q));
    initial 
    begin : ClkGenerator
    CLK=0;
    forever
    begin
    #(clk_period/2) CLK=~CLK;
    end
    end
    
    
    initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
    Reset=0; 
    Enable=0;
    #(clk_period*2);
     Reset=1;
     Enable=0;
     #(clk_period*2);
       Reset=1; 
       Enable=1;
     #(clk_period*10);
       Reset=1; 
       Enable=0;
     #(clk_period*2);
      Reset=1; 
       Enable=1;
            #(clk_period*2);
     end
     
endmodule

