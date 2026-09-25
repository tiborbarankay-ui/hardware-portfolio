module floatadder32(a, b, o);
  input [31:0] a, b;
  output reg [31:0] o;
  
  reg [7:0] e1, e2, commonexp, d;
  reg [23:0] m1, m2;
  reg [24:0] sum;
  integer i;
  reg s;


  always@(*) begin
    
    e1 = a[30:23];
    e2 = b[30:23];
    m1 = {1'b1, a[22:0]};
    m2 = {1'b1, b[22:0]};

    if(e1>=e2) begin
      d = e1-e2;
      m2 = m2 >> d;   
      commonexp = e1;
    end else begin
      d = e2-e1;
      m1 = m1 >> d;
      commonexp = e2;
    end

    
    
    if(a[31] == b[31]) begin
      sum = m1 + m2;
      s = a[31];
    end else if (m1 >= m2) begin
      sum = m1 - m2;
      s = a[31];
    end else begin
      sum = m2 - m1;
      s = b[31];
    end
  
  

  	if(sum[24]) begin
      sum = sum >> 1;
      commonexp = commonexp + 1;
    end else begin
      i = 0;
      while(sum[23] == 1'b0 && i < 24) begin
        sum = sum << 1;
        commonexp = commonexp - 1;
        i = i + 1;
      end
    end
  
  o = {s, commonexp, sum[22:0]};
  end
endmodule