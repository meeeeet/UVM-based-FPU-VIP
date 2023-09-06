`include "adder.v"
`include "multiplication.v"


`define ADD 2'b00
`define SUB 2'b01
`define MUL 2'b10
`define DIV 2'b11  //not implemented yet.....

module fpu(
    input [31:0] A,
    input [31:0] B,
    input [1:0] opcode,
    input clk,
    output reg [31:0] OUT
);

reg [31:0]add_result;
reg [31:0]sub_result;
reg [31:0]mul_result;
reg [31:0]div_result;


adder a1(
    .a(A),
    .b(B),
    .sum(add_result)
);

adder a2(
    .a(A),
    .b({~B[31],B[30:0]}),
    .sum(sub_result)
);

multiplication m1(
    .a(A),
    .b(B),
    .res(mul_result)
);

// division d1(
//     .a(A),
//     .b(B),
//     .res(div_result)
// );

always @(posedge clk) begin
    case (opcode)
        `ADD: begin
            OUT<=add_result;
        end
        `SUB: begin
            OUT<=sub_result;
        end
        `MUL: begin
            OUT<=mul_result;
        end
        `DIV: begin
            OUT<=div_result;
        end
        default: begin
            OUT<=32'd0;
        end
    endcase
end

endmodule