`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 11:13:15 AM
// Design Name: 
// Module Name: ASYNCCounter
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




module ASYNCCounter(
    input CLK,
    input Enable,
    input Reset,
    output [3:0] Q
    );
      wire QBAR[3:0];
   
    tff T1 (Enable, CLK, Reset, Q[0], QBAR[0]);
    tff T2 (Enable, QBAR[0], Reset, Q[1], QBAR[1]);
    tff T3 (Enable, QBAR[1], Reset, Q[2], QBAR[2]);
    tff T4 (Enable, QBAR[2], Reset, Q[3], QBAR[3]);
endmodule

