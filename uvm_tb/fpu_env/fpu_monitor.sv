class fpu_monitor extends uvm_monitor;
    `uvm_component_utils(fpu_monitor)
    virtual fpu_if fpu_vif;
/* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_monitor",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_monitor", "Inside constructor of fpu_monitor", UVM_LOW)
    endfunction

/* ------------------------------- build_phase ------------------------------ */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_LOW)

        if(!(uvm_config_db #(virtual fpu_if)::get(this,"*","vif",fpu_vif)))
            `uvm_error(get_name(), "Faild to get Virtual IF from database........")  
          
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

endclass: fpu_monitor