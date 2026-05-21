`timescale 1ns / 1ps

module LCD_ScrollingName(
    input CLK,
    output reg E,
    output reg RS,
    output reg RW,
    output reg [7:0] Data
);

    // 1. Define your message length and array size
    integer msg_len = 12;
    reg [7:0] msg [0:11]; 

    // 2. Insert your name in Hexadecimal ASCII here
    initial begin
        msg[0]  = 8'h42; // B
        msg[1]  = 8'h61; // a
        msg[2]  = 8'h73; // s
        msg[3]  = 8'h69; // i
        msg[4]  = 8'h6C; // l
        msg[5]  = 8'h20; // space
        msg[6]  = 8'h26; // &
        msg[7]  = 8'h20; // space
        msg[8]  = 8'h51; // Q
        msg[9]  = 8'h61; // a
        msg[10] = 8'h69; // i
        msg[11] = 8'h73; // s
    end

    // State machine and counter variables
    integer state = 0;
    integer delay_counter = 0;
    integer col = 0;
    integer rot = 0;             
    integer start_pos;

    // Delays (Adjust based on your clock frequency)
    parameter INIT_DELAY  = 2_000_000;
    parameter CMD_DELAY   = 4000;
    parameter CHAR_DELAY  = 4000;
    parameter FRAME_DELAY = 40_000_000;

    always @(posedge CLK) begin
        case(state)

            // --- LCD INITIALIZATION ---
            0: begin
                E <= 0; RS <= 0; RW <= 0;
                delay_counter <= delay_counter + 1;
                if (delay_counter >= INIT_DELAY) begin
                    delay_counter <= 0;
                    state <= 1;
                end
            end

            1: begin E <= 1; RS <= 0; RW <= 0; Data <= 8'h38; delay_counter <= 0; state <= 2; end
            2: begin 
                delay_counter <= delay_counter + 1; 
                if(delay_counter >= CMD_DELAY) begin E <= 0; delay_counter <= 0; state <= 3; end 
            end

            3: begin E <= 1; RS <= 0; RW <= 0; Data <= 8'h06; delay_counter <= 0; state <= 4; end
            4: begin 
                delay_counter <= delay_counter + 1;
                if(delay_counter >= CMD_DELAY) begin E <= 0; delay_counter <= 0; state <= 5; end 
            end

            5: begin E <= 1; RS <= 0; RW <= 0; Data <= 8'h0C; delay_counter <= 0; state <= 6; end
            6: begin 
                delay_counter <= delay_counter + 1;
                if(delay_counter >= CMD_DELAY) begin E <= 0; delay_counter <= 0; state <= 7; end 
            end

            7: begin E <= 1; RS <= 0; RW <= 0; Data <= 8'h01; delay_counter <= 0; state <= 8; end
            8: begin 
                delay_counter <= delay_counter + 1; 
                if(delay_counter >= CMD_DELAY) begin E <= 0; delay_counter <= 0; state <= 9; end 
            end

            // --- START NEW FRAME ---
            9: begin
                E <= 1; RS <= 0; RW <= 0; Data <= 8'h80; // Set DDRAM address to 0x80 (Line 1)
                col <= 0;
                delay_counter <= 0;
                state <= 10;
            end

            10: begin
                delay_counter <= delay_counter + 1;
                if (delay_counter >= CMD_DELAY) begin
                    delay_counter <= 0;
                    E <= 0;
                    state <= 11;
                end
            end

            // --- WRITE CHARACTERS ---
            11: begin
                E <= 1; RS <= 1; RW <= 0;
                start_pos = 16 - rot; // Calculate where the text starts

                if (col < start_pos)
                    Data <= 8'h20; // Write leading spaces
                else if (col < start_pos + msg_len)
                    Data <= msg[col - start_pos]; // Write message characters
                else
                    Data <= 8'h20; // Write trailing spaces

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
                        state <= 11; // Loop back until all 16 columns are written
                    else begin
                        col <= 0;
                        state <= 13; // Frame complete
                    end
                end
            end

            // --- ROTATE & DELAY BEFORE NEXT FRAME ---
            13: begin
                delay_counter <= delay_counter + 1;
                if (delay_counter >= FRAME_DELAY) begin
                    delay_counter <= 0;
                    // Increment rotation to shift text left; reset after it clears the screen
                    rot <= (rot + 1) % (16 + msg_len); 
                    state <= 9;
                end
            end

        endcase
    end

endmodule