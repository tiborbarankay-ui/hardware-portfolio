module adder12(in1, in2, clk, out);
  input [11:0] in1, in2;
  input clk;
  output reg [11:0] out;
  
  reg [11:0] val1, val2;
  reg [12:0] raw_sum;
  
  always@(posedge clk) begin
      val1 <= in1;
      val2 <= in2;
  end
    
  always@(*) begin
    raw_sum = val1 + val2;
    out = raw_sum[11:0];
  end
endmodule
