class fpu_test extends uvm_test;
    `uvm_component_utils(fpu_test)

  	fpu_env env; 
  	fpu_rst_seq rst_seq;
    fpu_main_seq main_seq;

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

      repeat(1) begin
        rst_seq=fpu_rst_seq::type_id::create("rst_seq");
        rst_seq.start(env.agent.seqr);
      end
      repeat(`TEST_COUNT) begin
        main_seq=fpu_main_seq::type_id::create("main_seq");
        main_seq.start(env.agent.seqr);
      end
      wait(env.scb.test_cnt==`TEST_COUNT);

      phase.drop_objection(this);
        
    endtask

endclass: fpu_test