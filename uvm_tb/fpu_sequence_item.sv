class fpu_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(fpu_sequence_item)

  rand logic rst_n;
  rand logic [3:0] cmd;
  rand logic [31:0] din1;
  rand logic [31:0] din2;
  rand logic dval;
  logic [31:0] result;
  logic rdy;  

  function new(string name="fpu_sequence_item");
      super.new(name);
  endfunction

endclass