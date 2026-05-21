`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 11:16:57 AM
// Design Name: 
// Module Name: ClkDivider
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





module ClkDivider(
       input clk_in,
    output reg clk_out
    );
        integer counter=0;
    always @(posedge clk_in)
      begin
      
    if(counter==49999999)
    begin
     
       counter=0;
    clk_out=~clk_out;
    end
    else
    counter=counter+1;
    end
    
    
endmodule
