`define TEST_COUNT 150
`include "fpu_sp_top.sv"
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

import "DPI-C" function int floatOperations(int op1, int op2, int cmd);