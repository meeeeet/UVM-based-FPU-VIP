`timescale  1ns / 1ns

`include "fpu_sp_top.sv"
module tb_fpu_sp_add;

// fpu_sp_add Parameters
parameter PERIOD    = 2  ;

// fpu_sp_add Inputs
reg             clk                   = 0 ;
reg             rst_n                 = 0 ;
reg    [31:0]   din1                  = 0 ;
reg    [31:0]   din2                  = 0 ;
reg             dval                  = 0 ;
reg [3:0] cmd;

// fpu_sp_add Outputs
wire   [31:0]   result                ;
wire            rdy                   ;
integer t1,t2;

initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    rst_n=0;
    #(PERIOD*2) rst_n  =  1;
end

fpu_sp_top u_fpu_sp_add (
    .clk      (clk      ),
    .rst_n    (rst_n    ),
    .din1     (din1     ),
    .cmd(cmd),
    .din2     (din2     ),
    .dval     (dval     ),

    .result   (result   ),
    .rdy      (rdy      )
);

// initial
// begin
//     din1=32'h41400000;
//     din2=32'h40c00000;
//     dval=1;
//     cmd=4'b0001;
//     @(posedge rdy);

//     din1=32'h41a00000;
//     din2=32'h41200000;
//     @(posedge rdy);
//     $display("%0t Process Started...",$time);
//     t1=$time;
//     din1=32'h435e0000;
//     din2=32'h447a0000;
//     @(posedge rdy);
//     $display("%0t Process Finished...",$time);
//     t2=$time;
//     $display("Required clock cycles: %0d",(t2-t1)/2);
//     #5 $finish;
// end

initial begin
    din1=32'h943138b8;
    din2=32'had3e00f5;
    dval=1;
    cmd=4'b0001;
    @(negedge rdy);
    @(negedge rdy);
    cmd=cmd+1;
    @(negedge rdy);
    cmd=cmd+1;
    @(negedge rdy);
    cmd=cmd+1;
    @(negedge rdy);
    cmd=cmd+1;
    @(negedge rdy);
    #10 $finish;

end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
end

endmodule