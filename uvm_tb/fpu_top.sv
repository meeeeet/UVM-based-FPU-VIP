`timescale 1ns/1ns
`include "uvm_macros.svh"
`define cases 10
import uvm_pkg::*;

//includes
`include "fpu.v"
`include "fpu_interface.sv"
`include "fpu_sequence_item.sv"
`include "fpu_sequence.sv"
`include "fpu_sequencer.sv"
`include "fpu_driver.sv"
`include "fpu_scoreboard.sv"
`include "fpu_monitor.sv"
`include "fpu_agent.sv"
`include "fpu_environment.sv"
`include "fpu_test.sv"

//----TOP-----
module top;

  bit clk=0;

  fpu_if top_if(clk);

  initial forever #1 clk=~clk;

 	initial begin
    uvm_config_db #(virtual fpu_if) :: set(null,"*","fpu_vif",top_if);
    `uvm_info("TOP","Configured database for interface.......",UVM_LOW)
  end

  initial begin
    run_test("fpu_test");
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

endmodule

/**
* TODO: Fetch updated tb from EDAPlayground
*/