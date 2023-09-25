class fpu_sequence extends uvm_sequence;
    `uvm_object_utils(fpu_sequence)
  	fpu_sequence_item fpu_item;

    /* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_sequence");
        super.new(name);
    endfunction

    /* -------------------------------- body task ------------------------------- */
    task body();
        `uvm_info(get_name(), "Inside body task", UVM_LOW)
      	fpu_item=fpu_sequence_item::type_id::create("fpu_item");

        start_item(fpu_item);
        fpu_item.randomize();
     	print(fpu_item);
        finish_item(fpu_item);
      
    endtask
    task print(fpu_sequence_item item);
      `uvm_info(get_name(),$sformatf("Transmitted data: %b %b %b",item.a,item.b,item.opcode),UVM_LOW)
  endtask

endclass: fpu_sequence