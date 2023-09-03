module multiplication (
    input [31:0]a,
    input [31:0]b,
    output [31:0]res
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

reg [47:0] n_mul;
reg n_sign;
reg [7:0] n_exp;

normal_mul m1(n_mul,n_exp,n_sign,res);

always @(*) begin
    n_sign=a_sign^b_sign;
    n_exp=a_exponent+b_exponent-8'd127;
    n_mul=a_mantissa*b_mantissa;
end

endmodule

module normal_mul(
    input [47:0] mantissa,
    input [7:0] exponent,
    input sign,
    output [31:0] out
  );
  
  assign out[31]=sign;
  assign out[30:23]=o_e+1;
  assign out[22:0]=o_m[46:24];
  reg [7:0]o_e;
  reg [47:0]o_m;
  integer i;
  
  always @ (*) begin
    o_e=exponent;
    o_m=mantissa;
  
    for (int i=47; i>0; i=i-1) begin
      if (o_m[47]==0) begin
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
  