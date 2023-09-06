`include "fpu.v"

module top;

    reg [31:0]a;
    reg [31:0]b;
    reg clk=0;
    reg [1:0]opcode;
    wire [31:0]out;
    reg [22:0] sum1;
    reg [46:0]n_mul;

    fpu dut(a,b,opcode,clk,out);

    initial forever #1 clk=~clk;

    initial begin
        a=32'h3f800000; //10
        b=32'h41200000; //2.5

        @(negedge clk);
        opcode=`ADD;
        @(posedge clk);
        $display("a=%h   b=%h  a+b=%h",a,b,out);

        @(negedge clk);
        opcode=`SUB;
        @(posedge clk);
        $display("a=%h   b=%h  a-b=%h",a,b,out);

        @(negedge clk);
        opcode=`MUL;
        @(posedge clk);
        @(posedge clk);
        $display("a=%h   b=%h  a*b=%h",a,b,out);
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();

    end
endmodule
