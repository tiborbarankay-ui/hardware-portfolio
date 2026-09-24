`timescale 1ns/1ps

module counter4bit_tb;

    reg        clk;
    reg        reset;
    wire [3:0] count;

    // Instantiate the design under test (DUT)
    counter4bit dut (
        .clk   (clk),
        .reset (reset),
        .count (count)
    );

    // Clock generation: toggle every 5ns -> 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        reset = 1;
        #12;              // hold reset through a couple clock edges
        reset = 0;

        // Let it count for a while
        #200;

        $stop;             // halts simulation so you can inspect waveforms
    end

    // Optional: print count to console every time it changes
    initial begin
        $monitor("Time=%0t reset=%b count=%d", $time, reset, count);
    end

endmodule