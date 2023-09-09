class fpu_test extends uvm_test;
    `uvm_component_utils(fpu_test)

/* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_test",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_test", "Inside constructor of fpu_test", UVM_LOW)
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

/* -------------------------------- run_phase ------------------------------- */
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_name(), "Inside run phase", UVM_LOW)
    endtask

endclass: fpu_test