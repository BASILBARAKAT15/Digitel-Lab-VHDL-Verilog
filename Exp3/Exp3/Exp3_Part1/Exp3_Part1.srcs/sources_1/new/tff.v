`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 11:09:55 AM
// Design Name: 
// Module Name: tff
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








module tff(
    input T,
    input CLK,
    input clear,
    output reg Q,
    output reg QBAR
    );
    always @(posedge CLK,negedge clear)
    begin
    if(!clear)
    begin
  Q<=0;
  QBAR<=1;
    end
       else if(T==1)
    begin
  QBAR<=Q;
   Q<=~Q;
    end
    end
endmodule
