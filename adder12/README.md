## Verilog 12-bit adder
This verilog file will take two twelve bit inputs and deliver the 12-bit wrap around result.

## Testbench
The testbench tests 100 different random input pairs and compares the expected result to the result using the adder, tracking the number of successes

## Simulation
Simulations can be run with ModelSim: vlog adder12.v adder12_tb.v; vsim adder12_tb; run -all
