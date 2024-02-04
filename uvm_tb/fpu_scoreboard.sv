class fpu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(fpu_scoreboard)
  
//   uvm_analysis_imp #(fpu_sequence_item, fpu_scoreboard) scoreboard_port;
  uvm_analysis_imp #(fpu_seq_item, fpu_scoreboard) scb_port;
  
  fpu_sequence_item item;

  function new(string name = "fpu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
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
  
endclass