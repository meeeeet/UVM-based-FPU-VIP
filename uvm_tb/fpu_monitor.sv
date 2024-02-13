class fpu_monitor extends uvm_monitor;
  `uvm_component_utils(fpu_monitor)
  virtual fpu_if vif;
  fpu_sequence_item item;
  
  uvm_analysis_port #(fpu_sequence_item) mon_port;
  
  function new(string name="fpu_monitor",uvm_component parent);
      super.new(name,parent);
    `uvm_info("fpu_monitor", "Inside constructor of fpu_monitor", UVM_HIGH)
  endfunction

  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_name(), "Inside build phase", UVM_HIGH)
    
    mon_port=new("mon_port",this);

      if(!(uvm_config_db #(virtual fpu_if)::get(this,"*","fpu_vif",vif)))
        `uvm_error(get_name(), "Faild to get Virtual IF from database...")  
        
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_name(), "Inside connect phase", UVM_HIGH)
  endfunction

  task run_phase(uvm_phase phase);
      super.run_phase(phase);
      `uvm_info(get_name(), "Inside run phase", UVM_HIGH)
      forever begin
        item=fpu_sequence_item::type_id::create("item");
        sample(item);
        `uvm_info(get_name(),"Item received!!",UVM_HIGH)
        mon_port.write(item);
      end
  endtask


  task sample(fpu_sequence_item item);
    //wait(!vif.rst_n);
    @(posedge vif.rdy);
//     @(negedge vif.clk);
    item.cmd=vif.cmd;
    item.din1=vif.din1;
    item.din2=vif.din2;
    item.result=vif.result;
    item.rst_n=vif.rst_n;
    item.dval=vif.dval;
    item.rdy=vif.rdy;
  endtask

endclass: fpu_monitor