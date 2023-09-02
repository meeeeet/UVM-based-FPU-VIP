`include "adder.v"
module top;

    reg [31:0]a;
    reg [31:0]b;
    wire [31:0]sum;
    reg [22:0] sum1;

    adder dut(a,b,sum);

    initial begin
        
        a=32'h3f800000;
        b=32'h41a00000;

        // a=32'h40080000;
        // b=32'h40080000;
        #1
        // sum1=sum[23:0];

        // $display("Sum= %b %h",sum1,sum1);
        $warning("a=%h   b=%h  Out=%b %h",a,b,sum,sum);
        $finish;
    end
endmodule
