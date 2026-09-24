module counter4bit (
    input  wire       clk,     // clock input
    input  wire       reset,   // synchronous active-high reset
    output reg  [3:0] count    // 4-bit counter output
);

    always @(posedge clk) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end

endmodule
