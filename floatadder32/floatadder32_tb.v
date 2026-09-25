module floatadder32_tb;   
  reg [31:0] a, b;
  wire [31:0] o;
  integer i;
  integer rand1, rand2;
  real float_1, float_2, found;

  floatadder32 adder(.a(a), .b(b), .o(o));

  function [31:0] real_to_float32;
    input real r;
    reg [63:0] bits64;
    reg [10:0] exp64;
    reg [7:0]  exp32;
    integer    exp_unbiased;
    begin
      bits64 = $realtobits(r);
      exp64  = bits64[62:52];
      exp_unbiased = exp64 - 1023;
      exp32 = exp_unbiased + 127;
      real_to_float32 = {bits64[63], exp32, bits64[51:29]};
    end
  endfunction


  function real float32_to_real;
    input [31:0] f;
    reg [7:0]  exp32;
    reg [10:0] exp64;
    reg [63:0] bits64;
    integer    exp_unbiased;
    begin
      exp32 = f[30:23];
      exp_unbiased = exp32 - 127;
      exp64 = exp_unbiased + 1023;
      bits64 = {f[31], exp64, f[22:0], 29'b0};
      float32_to_real = $bitstoreal(bits64);
    end
  endfunction

  initial begin
    for (i = 0; i < 100; i = i + 1) begin
      rand1 = $random;
      rand2 = $random;

      float_1 = $itor(rand1) / 100.0;
      float_2 = $itor(rand2) / 100.0;

      a = real_to_float32(float_1);
      b = real_to_float32(float_2);

      #1;

      found = float32_to_real(o);

      $display("Iteration %0d: %f + %f = %f (expected %f)",
                i, float_1, float_2, found, float_1 + float_2);
    end
  end
endmodule