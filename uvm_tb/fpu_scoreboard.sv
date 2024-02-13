class fpu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(fpu_scoreboard)
  
  uvm_analysis_imp #(fpu_sequence_item, fpu_scoreboard) scb_port;

  
  fpu_sequence_item item[$];
  fpu_sequence_item s_item;
  int test_cnt=0;
  int test_valid=0;
  int test_invalid=0;
  
  covergroup cg();
    c1 : coverpoint s_item.cmd {option.at_least=5;
                                bins add_sub = {1};
                                bins mul = {2};
                                bins div = {3};
                                bins f2i = {4};
                                bins i2f = {5};}
  endgroup: cg  


  
  function new(string name = "fpu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
    cg=new();
  endfunction: new
  

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
    scb_port=new("scb_port",this);

  endfunction: build_phase
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
   
  endfunction: connect_phase
  
  function void write (fpu_sequence_item rx_item);
    item.push_front(rx_item);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever  begin
      s_item=fpu_sequence_item::type_id::create("s_item");
      wait((item.size() != 0));
      s_item=item.pop_front();
//       s_item.print();
      compare(s_item);
      cg.sample();
      test_cnt++;
    end
  endtask
  
  function void compare(fpu_sequence_item item);
    logic [31:0] ex_res;
    ex_res=floatOperations(item.din1,item.din2,item.cmd);
    if (ex_res==item.result) begin
      `uvm_info(get_name,$sformatf("[%0d/%0d] Test Passed",test_cnt,`TEST_COUNT),UVM_HIGH)
      test_analysis(item,ex_res,0);
      test_valid++;
    end
    
    else begin
      `uvm_error(get_name,$sformatf("[%0d/%0d] Test faild",test_cnt,`TEST_COUNT))
      test_analysis(item,ex_res,1);
      test_invalid++;
    end
  endfunction
  
  function void test_analysis(fpu_sequence_item item, logic [31:0] ex_res,bit flag);
    if(flag & (get_report_verbosity_level()>=UVM_MEDIUM)) begin
      $display("--------------------------------------------------------------------------------");
      $display("din1 = %0h  din2 = %0h  cmd = %0h \nactual = %0h \nexpected = %0h",item.din1,item.din2,item.cmd,item.result,ex_res);
    end
      ///$display("--------------------------------------------------------------------------------");
  endfunction
  
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_name(),$sformatf("Total tests: %0d",test_cnt),UVM_LOW)
    `uvm_info(get_name(),$sformatf("Passed tests: %0d",test_valid),UVM_LOW)
    `uvm_info(get_name(),$sformatf("Failed  tests: %0d",test_invalid),UVM_LOW)
  endfunction
endclass