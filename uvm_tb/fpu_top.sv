`timescale 1ns/1ns
`include "uvm_macros.svh"
`include "fpu_def.sv"
import uvm_pkg::*;


module top;

    bit clk=0;

    fpu_if top_if(clk);

  fpu_sp_top dut (
    	.clk      (top_if.clk      ),
      .rst_n    (top_if.rst_n    ),
      .din1     (top_if.din1     ),
      .cmd(top_if.cmd),
      .din2     (top_if.din2     ),
      .dval     (top_if.dval     ),

      .result   (top_if.result   ),
      .rdy      (top_if.rdy      )
  );

//clock generation
    initial forever #1 clk=~clk;

 	initial begin
      uvm_config_db #(virtual fpu_if) :: set(null,"*","fpu_vif",top_if);
      `uvm_info("TOP","Configured database for interface...",UVM_LOW)
    end

    initial begin
      run_test("fpu_test");
    end
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end

endmodule
// TODO: Receiving items from monitor in scoreboard