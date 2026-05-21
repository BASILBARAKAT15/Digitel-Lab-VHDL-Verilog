`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 11:23:32 AM
// Design Name: 
// Module Name: TopLevelAsyn
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


module TopLevelAsyn(
 input Reset,
  input Enable,
     input CLK,
      output [3:0] Q
    );
    wire clk_out;
     ClkDivider U1(CLK,clk_out);
       ASYNCCounter (clk_out,Enable,Reset,Q);
    
endmodule
