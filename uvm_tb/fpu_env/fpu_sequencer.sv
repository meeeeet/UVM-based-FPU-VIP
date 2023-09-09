class fpu_sequencer extends uvm_sequencer #(fpu_sequence_item);
    `uvm_component_utils(fpu_sequencer)

/* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_sequencer",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_sequencer", "Inside constructor of fpu_sequencer", UVM_LOW)
    endfunction

/* ------------------------------- build_phase ------------------------------ */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_LOW)
    endfunction: build_phase

/* ------------------------------ connect_phase ----------------------------- */
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_name(), "Inside connect phase", UVM_LOW)
    endfunction


endclass: fpu_sequencer