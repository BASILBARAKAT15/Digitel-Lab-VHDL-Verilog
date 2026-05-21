`timescale 1ns / 1ps
module LCD_ScrollingName(
    input CLK,
    output reg E,
    output reg RS,
    output reg RW,
    output reg [7:0] Data
);

   
    reg [7:0] msg [0:7];
    integer msg_len = 8;

   
    initial begin
        msg[0] = 8'h69; // i
        msg[1] = 8'h62; // b
        msg[2] = 8'h72; // r
        msg[3] = 8'h61; // a
        msg[4] = 8'h20; // space
        msg[5] = 8'h61; // a
        msg[6] = 8'h62; // b
        msg[7] = 8'h64; // d
    end

    integer state = 0;
    integer delay_counter = 0;

    integer col = 0;
    integer rot = 0;             
    integer start_pos;

    parameter INIT_DELAY  = 2_000_000;
    parameter CMD_DELAY   = 4000;
    parameter CHAR_DELAY  = 4000;

    
    parameter FRAME_DELAY = 40_000_000;

    always @(posedge CLK) begin
        case(state)

        
        0: begin
            E <= 0; RS <= 0; RW <= 0;
            delay_counter <= delay_counter + 1;
            if (delay_counter >= INIT_DELAY) begin
                delay_counter <= 0;
                state <= 1;
            end
        end

        
        1: begin 
        E<=1; RS<=0
        ; RW<=0; Data<=8'h38; 
        delay_counter<=0; 
        state<=2;
         end
        2: begin delay_counter<=delay_counter+1; 
        if(delay_counter>=CMD_DELAY) begin
         E<=0;
         delay_counter<=0; state<=3; end end

        3: begin E<=1; 
        RS<=0; RW<=0; 
        Data<=8'h06; delay_counter<=0;
         state<=4; end
        4: begin delay_counter<=delay_counter+1;
         if(delay_counter>=CMD_DELAY) begin E<=0;
          delay_counter<=0; state<=5;
           end end

        5: begin E<=1; RS<=0; RW<=0; 
        Data<=8'h0C; delay_counter<=0;
         state<=6; end
        6: begin delay_counter<=delay_counter+1;
         if(delay_counter>=CMD_DELAY) begin
          E<=0;
          delay_counter<=0; state<=7; end end

        7: begin E<=1; RS<=0; RW<=0; Data<=8'h01; delay_counter<=0; state<=8; end
        8: begin delay_counter<=delay_counter+1; if(delay_counter>=CMD_DELAY) begin E<=0; delay_counter<=0; state<=9; end end

        
        9: begin
            E<=1; RS<=0; RW<=0; Data<=8'h80;
            col<=0;
            delay_counter<=0;
            state<=10;
        end

        10: begin
            delay_counter <= delay_counter + 1;
            if (delay_counter >= CMD_DELAY) begin
                delay_counter <= 0;
                E<=0;
                state <= 11;
            end
        end

        
        11: begin
            E <= 1; RS <= 1; RW <= 0;

         
            start_pos = 16 - rot;

            if (col < start_pos)
                Data <= 8'h20; 
            else if (col < start_pos + msg_len)
                Data <= msg[col - start_pos]; 
            else
                Data <= 8'h20; 

            delay_counter <= 0;
            state <= 12;
        end

        12: begin
            delay_counter <= delay_counter + 1;
            if (delay_counter >= CHAR_DELAY) begin
                E <= 0;
                delay_counter <= 0;

                col <= col + 1;

                if (col < 16)
                    state <= 11;
                else begin
                    col <= 0;
                    state <= 13;
                end
            end
        end

        
        13: begin
            delay_counter <= delay_counter + 1;
            if (delay_counter >= FRAME_DELAY) begin
                delay_counter <= 0;

                
                rot <= (rot + 1) % (16 + msg_len);

                state <= 9;
            end
        end

        endcase
    end

endmodule