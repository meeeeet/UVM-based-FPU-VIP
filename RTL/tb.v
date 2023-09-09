`include "RTL/fpu.v"
`define cases 1000000

module top;

    reg [31:0] a [0:`cases-1];
    reg [31:0] b [0:`cases-1];
    reg [31:0] actual_out_sum [0:`cases-1];
    reg [31:0] actual_out_sub [0:`cases-1];
    reg [31:0] actual_out [0:`cases-1];
    reg [31:0] a_in;
    reg [31:0] b_in;
    reg clk = 0;
    reg [1:0] opcode;
    wire [31:0] out;
    reg [22:0] sum1;
    reg [46:0] n_mul;
    int i;

    fpu dut(a_in, b_in, opcode, clk, out);

    initial forever #1 clk = ~clk;

    initial begin
        
        $display("Reading test data from file...");
        $readmemh("python_tb/test/test_1.mem", a);
        $readmemh("python_tb/test/test_2.mem", b);
        opcode = `ADD;

        $display("Simulation started.");
        
        for (i = 0; i < `cases; i = i + 1) begin
            a_in = a[i];
            b_in = b[i];
            @(negedge clk);
            // $display("[%0t] Test Case %0d: a_in=%h, b_in=%h, out=%h", $time, i, a_in, b_in, out);
            actual_out_sum[i] = out;
        end

        opcode = `SUB;

        $display("Simulation started.");
        
        for (i = 0; i < `cases; i = i + 1) begin
            a_in = a[i];
            b_in = b[i];
            @(negedge clk);
            // $display("[%0t] Test Case %0d: a_in=%h, b_in=%h, out=%h", $time, i, a_in, b_in, out);
            actual_out_sub[i] = out;
        end

        // $writememh("M:\\GitHub\\IEEE-754-single-precision-FPU\\python_tb\\test\\actual_result_sum.mem", actual_out_sum);
        // $writememh("M:\\GitHub\\IEEE-754-single-precision-FPU\\python_tb\\test\\actual_result_sub.mem", actual_out_sub);

        $writememh("python_tb/test/actual_result_sum.mem", actual_out_sum);
        $writememh("python_tb/test/actual_result_sub.mem", actual_out_sub);
        $display("Simulation completed.........");
        $finish;
    end

endmodule
