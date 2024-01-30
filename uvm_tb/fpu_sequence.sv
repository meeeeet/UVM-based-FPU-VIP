class fpu_base_sequence extends uvm_sequence;
  `uvm_object_utils(fpu_sequence)
  fpu_sequence_item fpu_item;

  function new(string name="fpu_sequence");
      super.new(name);
  endfunction

endclass: fpu_base_sequence

class fpu_rst_seq extends fpu_base_sequence

  `uvm_object_utils(fpu_rst_seq)
  fpu_sequence_item item;

  function new(string name="fpu_rst_seq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_name(),"Running reset sequence..",UVM_LOW);

    item=fpu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize();
    finish_item(item);

  endtask


endclass

