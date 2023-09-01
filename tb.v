`include "adder.v"
module top;

    reg [31:0]a;
    reg [31:0]b;
    wire [32:0]sum;
    reg [23:0] sum1;

    adder dut(a,b,sum);

    initial begin
        a=32'b0_10000010_01011000000000000000000;
        b=32'b0_10000000_00100000000000000000000;
        #1
        sum1=sum[23:0];

        $display("Sum= %b %h",sum1,sum1);
        $display("Out=%b",sum);
        $finish;
    end
endmodule