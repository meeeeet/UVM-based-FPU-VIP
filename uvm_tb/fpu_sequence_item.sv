class fpu_sequence_item extends uvm_sequence_item;

  rand logic rst_n;
  rand logic [3:0] cmd;
  rand logic [31:0] din1;
  rand logic [31:0] din2;
  rand logic dval;
  logic [31:0] result;
  logic rdy; 

  `uvm_object_utils_begin (fpu_sequence_item)
    `uvm_field_int (rst_n, UVM_BIN)
    `uvm_field_int (cmd, UVM_BIN)
    `uvm_field_int (din1, UVM_HEX)
    `uvm_field_int (din2, UVM_HEX)
    `uvm_field_int (dval, UVM_BIN)
    `uvm_field_int (result, UVM_HEX)
    `uvm_field_int (rdy, UVM_BIN)
  `uvm_object_utils_end
  
  function new(string name="fpu_sequence_item");
    super.new(name);
  endfunction

  constraint cmd_range{
    cmd inside {[1:5]};
  }

  constraint din1_range{
    if(!(cmd==4'b0101)) {
      din1[30:23]!=8'd255;
      din1[30:23]!=8'd0;
    }
    else{
      din1>=32'd0;
    }
  }

  constraint din2_range{
    din2[30:23]!=8'd255;
    din2[30:23]!=8'd0;
  }

endclass