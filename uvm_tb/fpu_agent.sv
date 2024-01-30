class fpu_agent extends uvm_agent;
    `uvm_component_utils(fpu_agent)
  	fpu_driver drv;
  	fpu_monitor mon;
  	fpu_sequencer seqr;

    function new(string name="fpu_agent",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_agent", "Inside constructor of fpu_agent", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_HIGH)
      
      	drv=fpu_driver::type_id::create("drv",this);
      	mon=fpu_monitor::type_id::create("mon",this);
      	seqr=fpu_sequencer::type_id::create("seqr",this);
      
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_name(), "Inside connect phase", UVM_HIGH)
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_name(), "Inside run phase", UVM_HIGH)
    endtask

endclass: fpu_agent