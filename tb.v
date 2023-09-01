`include "adder.v"
module top;

    reg [31:0]a;
    reg [31:0]b;
    wire [31:0]sum;
    reg [22:0] sum1;

    adder dut(a,b,sum);

    initial begin
        // a=32'b0_10000010_01011000000000000000000; //10.75 1010.11
        // b=32'b1_10000010_11111000000000000000000; //15.75 1010.11
        // b=32'b0_10000000_00100000000000000000000; //2.25  10.01

        a=32'b11000011010010001110000000000000;
        b=32'b11000011110010000111000000000000;
        #1
        // sum1=sum[23:0];

        // $display("Sum= %b %h",sum1,sum1);
        $display("Out=%b %h",sum,sum);
        $finish;
    end
endmodule