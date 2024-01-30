class fpu_sequencer extends uvm_sequencer #(fpu_sequence_item);
    `uvm_component_utils(fpu_sequencer)

    function new(string name="fpu_sequencer",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_sequencer", "Inside constructor of fpu_sequencer", UVM_HIGH)
    endfunction


endclass: fpu_sequencer