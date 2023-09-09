interface fpu_if(input logic clk);
    logic [31:0]a;
    logic [31:0]b;
    logic [1:0]opcode;
    logic [31:0]out;
endinterface: fpu_if