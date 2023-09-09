`timescale 1ns/1ns
`include "uvm_macros.svh"
import uvm_pkg::*;

/* ------------------------------ inlcude files ----------------------------- */
`include "fpu.v"
`include "fpu_interface.sv"
`include "fpu_sequence_item.sv"
`include "fpu_sequence.sv"
`include "fpu_sequencer.sv"
`include "fpu_driver.sv"
`include "fpu_monitor.sv"
`include "fpu_agent.sv"
`include "fpu_environment.sv"
`include "fpu_test.sv"

module top;

    logic clk;

    fpu_if top_if(clk);

    fpu dut(
        .A(top_if.a),
        .B(top_if.b),
        .opcode(top_if.opcode),
        .clk(top_if.clk),
        .OUT(top_if.out)
    );

/* ---------------------------- clock generation ---------------------------- */
    initial forever #1 clk=~clk;

/* --------------------------- configure database --------------------------- */
 	initial begin
        uvm_config_db #(virtual fpu_if) :: set(null,"*","fpu_vif",top_if);
        `uvm_info("TOP","Configured database for interface.......",UVM_LOW)
    end

/* -------------------------------- run test -------------------------------- */
    initial begin
        run_test();
    end

endmodule
