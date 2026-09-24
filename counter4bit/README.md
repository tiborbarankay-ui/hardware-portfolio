# 4-bit Synchronous Counter

A simple 4-bit up-counter with synchronous active-high reset, written in Verilog.
Verified with a self-checking testbench simulated in ModelSim.

## Files
- `counter4bit.v` — the design
- `counter4bit_tb.v` — testbench

## Simulation
Run with ModelSim: vlog counter4bit.v counter4bit_tb.v; vsim counter4bit_tb; run -all
