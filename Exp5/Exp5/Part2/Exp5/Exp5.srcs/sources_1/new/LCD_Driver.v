`timescale 1ns / 1ps

module LCD_Driver (
    input CLK,
    input Done,
    input [3:0] Digit1,
    input [3:0] Digit0,
    output reg [7:0] DB,
    output reg RS,
    output reg RW,
    output reg E
);

    reg [31:0] counter = 0; 

    always @(posedge CLK) begin
        
        case (counter)

        2000000: begin DB <= 8'h38; RS <= 0; RW <= 0; E <= 1; end    
        2000100: begin E <= 0; end

        2004100: begin DB <= 8'h06; RS <= 0; RW <= 0; E <= 1; end      
        2004200: begin E <= 0; end

        2008200: begin DB <= 8'h0C; RS <= 0; RW <= 0; E <= 1; end      
        2008300: begin E <= 0; end

        2012300: begin DB <= 8'h01; RS <= 0; RW <= 0; E <= 1; end      
        2012400: begin E <= 0; end

        2176400: begin DB <= 8'h87; RS <= 0; RW <= 0; E <= 1; end       
        2176500: begin E <= 0; end

        2180500: begin DB <= Digit1 + 8'h30; RS <= 1; RW <= 0; E <= 1; end
        2180600: begin E <= 0; end

        2184600: begin DB <= Digit0 + 8'h30; RS <= 1; RW <= 0; E <= 1; end
        2184700: begin E <= 0; end

        2188700: begin 
            if (Done) begin
                DB <= 8'hC0;     
                RS <= 0; RW <= 0; E <= 1;
            end
        end

        2188800: begin 
            if (Done) E <= 0;
        end

        2189800: begin 
            if (Done) begin DB <= "D"; RS <= 1; RW <= 0; E <= 1; end
        end

        2189900: begin 
            if (Done) E <= 0;
        end

        2190800: begin 
            if (Done) begin DB <= "O"; RS <= 1; RW <= 0; E <= 1; end
        end

        2190900: begin 
            if (Done) E <= 0;
        end

        2191800: begin 
            if (Done) begin DB <= "N"; RS <= 1; RW <= 0; E <= 1; end
        end

        2191900: begin 
            if (Done) E <= 0;
        end

        2192800: begin 
            if (Done) begin DB <= "E"; RS <= 1; RW <= 0; E <= 1; end
        end

        2192900: begin 
            if (Done) E <= 0;
        end

        endcase

        if (counter < 2196000)
            counter <= counter + 1;
        else
            counter <= 2176400;   

    end

endmodule