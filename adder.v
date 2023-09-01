module adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire a_sign;
wire b_sign;
wire [7:0] a_exponent;
wire [7:0]b_exponent;
wire [23:0]a_mantissa;
wire [23:0]b_mantissa;

reg [23:0] aligned_a;
reg [23:0] aligned_b;
reg [7:0] aligned_expo;

assign a_sign = a[31];
assign b_sign = b[31];
assign a_exponent = a[30:23];
assign b_exponent = b[30:23];
assign a_mantissa = {1'b1,a[22:0]};
assign b_mantissa = {1'b1,b[22:0]};

reg [24:0] n_sum;
reg n_sign;
reg [7:0] n_exp;


normal_add normalization(n_sum,n_exp,n_sign,sum);

always @(*) begin

    if (a_exponent > b_exponent) begin        // A is bigger than B

      aligned_expo = a_exponent - b_exponent;
      aligned_b = b_mantissa >> aligned_expo;
      aligned_a = a_mantissa;
      n_sign=a_sign;
      n_exp=a_exponent;

      if (a_sign==b_sign) begin             
        n_sum=aligned_a+aligned_b;

      end
      else begin
        n_sum=aligned_a-aligned_b;
      end
    end
    
    else if (b_exponent > a_exponent) begin      // B is bigger than A

      aligned_expo = b_exponent - a_exponent;
      aligned_a = a_mantissa >> aligned_expo;
      aligned_b = b_mantissa;
      n_sign=b_sign;
      n_exp=b_exponent;

      if (a_sign==b_sign) begin
        n_sum=aligned_a+aligned_b;
      end
      else begin
        n_sum=aligned_b-aligned_a;
      end

    end
    
    else begin                             // A & B are same
      aligned_expo = 8'd0;
      aligned_a = a_mantissa;
      aligned_b = b_mantissa;
      n_exp=a_exponent;

      if(a_sign==b_sign) begin
        n_sum=a_mantissa+b_mantissa;
        n_sign=a_sign;
      end

      else begin
        if (a_mantissa>b_mantissa) begin
          n_sum=aligned_a-aligned_b;
          n_sign=a_sign;
        end
        else begin
          n_sum=aligned_b-aligned_a;
          n_sign=b_sign;
        end
      end
    end
  end

endmodule

module normal_add(
  input [24:0] mantissa,
  input [7:0] exponent,
  input sign,
  output [31:0] out
);

assign out[31]=sign;
assign out[30:23]=o_e+1;
assign out[22:0]=o_m[23:1];
reg [7:0]o_e;
reg [24:0]o_m;
integer i;

always @ (*) begin
  o_e=exponent;
  o_m=mantissa;

  for (int i=24; i>1; i=i-1) begin
    if (o_m[24]==0) begin
      o_e=o_e-1;
      o_m=o_m<<1;
    end
    else begin
      o_e=o_e;
      o_m=o_m;
    end
  end
end
endmodule


