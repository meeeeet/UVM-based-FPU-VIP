class fpu_env extends uvm_env;
    `uvm_component_utils(fpu_env)

/* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_env",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_env", "Inside constructor of fpu_env", UVM_LOW)
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

endclass: fpu_env