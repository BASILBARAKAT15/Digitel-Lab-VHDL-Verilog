module Debounce(
    input clk,
    input btn,
    output pulse
);
    reg sync0, sync1;
    reg debounced;
    reg prev;
    always @(posedge clk) begin
        sync0 <= btn;
        sync1 <= sync0;
    end
    reg [19:0] counter = 0;
    always @(posedge clk) begin
        if (sync1 == debounced)
            counter <= 0;
        else begin
            counter <= counter + 1;
            if (counter == 20'd500000) begin   
                debounced <= sync1;
                counter   <= 0;
            end
        end
    end
    assign pulse = debounced & ~prev;

    always @(posedge clk)
        prev <= debounced;
endmodule