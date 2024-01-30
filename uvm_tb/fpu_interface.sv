interface fpu_if(input logic clk);
    logic rst_n;
    logic [3:0] cmd;
    logic [31:0] din1;
    logic [31:0] din2;
    logic dval;
    logic [31:0] result;
    logic rdy;
    
    modport dut (
    input rst_n,
          cmd,
          din1,
          din2,
          dval,
    output result,
           rdy
    );
    
endinterface: fpu_if