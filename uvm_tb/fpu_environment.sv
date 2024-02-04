class fpu_env extends uvm_env;
    `uvm_component_utils(fpu_env)
  	fpu_agent agent;
	fpu_scoreboard scb;

    function new(string name="fpu_env",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_env", "Inside constructor of fpu_env", UVM_HIGH)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_HIGH)
      	agent=fpu_agent::type_id::create("agent",this);
    	scb=fpu_scoreboard::type_id::create("scb",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_name(), "Inside connect phase", UVM_HIGH)
      agent.mon.mon_port.connect(scb.scb_port);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_name(), "Inside run phase", UVM_HIGH)
    endtask

endclass: fpu_env