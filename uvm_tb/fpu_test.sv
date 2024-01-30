class fpu_test extends uvm_test;
    `uvm_component_utils(fpu_test)
  	fpu_env env;
  
  	fpu_sequence seq;

    function new(string name="fpu_test",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_test", "Inside constructor of fpu_test", UVM_HIGH)
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_HIGH)
     	 env=fpu_env::type_id::create("env",this);
    endfunction: build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_name(), "Inside connect phase", UVM_HIGH)
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_name(), "Inside run phase", UVM_HIGH)
      	
      phase.raise_objection(this);

      repeat(`cases) begin
        seq=fpu_sequence::type_id::create("seq");
        seq.start(env.agent.seqr);
      end

      phase.drop_objection(this);
        
    endtask

endclass: fpu_test