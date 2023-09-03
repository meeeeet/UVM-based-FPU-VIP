`include "adder.v"
`include "multiplication.v"
module top;

    reg [31:0]a;
    reg [31:0]b;
    wire [31:0]sum;
    reg [22:0] sum1;
    reg [46:0]n_mul;

    multiplication dut(a,b,sum);

    initial begin
        
        b=32'h0x41202960;
        // a=32'h0x40a00000;
        a=b;
        // a=32'h0x41200000;
        n_mul=23'd10 * 23'd01;

        // a=32'h40080000;
        // b=32'h40080000;
        #1
        // sum1=sum[23:0];

        // $display("Sum= %b %h",sum1,sum1);
        $display("a_m * b_m = %b  %h",n_mul,n_mul);
        $display("a=%b   b=%b  Out=%b %h",a,b,sum,sum);
        $finish;
    end
endmodule
