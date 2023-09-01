module adder(
    input [31:0] a,
    input [31:0] b,
    output [32:0] sum
);


wire a_sign;
wire b_sign;
wire sum_sign;
wire [7:0] a_exponent;
wire [7:0]b_exponent;
wire [7:0]sum_exponent;
wire [23:0]a_mantissa;
wire [23:0]b_mantissa;
wire [22:0]sum_mantissa;

reg [23:0] aligned_a;
reg [23:0] aligned_b;
reg [7:0] aligned_expo;


assign a_sign = a[31];
assign b_sign = b[31];
assign a_exponent = a[30:23];
assign b_exponent = b[30:23];
assign a_mantissa = {1'b1,a[22:0]};
assign b_mantissa = {1'b1,b[22:0]};

assign sum[31]=sum_sign;
assign sum[30:23]=sum_exponent;
assign sum[22:0]=sum_mantissa;
assign sum[32]=sum_sign;
assign sum[31:24]=sum_exponent;
assign sum[23:0]=n_sum;

reg [23:0] n_sum;
// assign sum_mantissa=n_sum[23:0];
assign sum_sign=0;
assign sum_exponent=a_exponent;

always @(*) begin
    if (a_exponent > b_exponent) begin
      aligned_expo = a_exponent - b_exponent;
      aligned_b = b_mantissa >> aligned_expo;
      aligned_a = a_mantissa;
    end
    
    else if (b_exponent > a_exponent) begin
      aligned_expo = b_exponent - a_exponent;
      aligned_a = a_mantissa >> aligned_expo;
      aligned_b = b_mantissa; 
    end
    
    else begin
      aligned_expo = 8'd0;
      aligned_a = a_mantissa;
      aligned_b = b_mantissa;
    end

    n_sum=aligned_a+aligned_b;

  end
endmodule

