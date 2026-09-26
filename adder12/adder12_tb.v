module adder12_tb;
  reg signed [11:0] in1, in2, expected_val;
  reg clk;
  wire signed [11:0] out;
  reg signed [12:0] expected_val13;
  integer i, rand1, rand2;
  integer successes = 0;
  
  adder12 add(.in1(in1), .in2(in2), .clk(clk), .out(out));
  initial begin
  	clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
  	for(i = 0; i < 100; i = i + 1) begin
      
      rand1 = $random;
      rand2 = $random;
      in1 = rand1[11:0];
      in2 = rand2[11:0];
      
      #10
      
      expected_val13 = in1 + in2;
      expected_val = expected_val13[11:0];
      $display("Iteration #%d\nExpected Value: %d\nOutput Value: %d\n", i, expected_val, out);
      if(expected_val == out) begin
      	successes = successes + 1;
      end
    end
    if(successes == 100) begin
      $display("All iterations successful!");
    end else
      $display("FAILURE - Not all successful");
    $finish;
  end
endmodule
