class fpu_driver extends uvm_driver #(fpu_sequence_item);
  `uvm_component_utils(fpu_driver)
  virtual fpu_if vif;
  fpu_sequence_item item;

  function new(string name="fpu_driver",uvm_component parent);
      super.new(name,parent);
      `uvm_info("fpu_driver", "Inside constructor of fpu_driver", UVM_HIGH)
      
  endfunction

  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_name(), "Inside build phase", UVM_HIGH)

    if(!(uvm_config_db #(virtual fpu_if)::get(this,"*","fpu_vif",vif)))
          `uvm_error(get_name(), "Faild to get Virtual IF from database........")

  endfunction: build_phase

  task run_phase(uvm_phase phase);
      super.run_phase(phase);
      `uvm_info(get_name(), "Inside run phase", UVM_HIGH)
    
    repeat(2) begin
      item=fpu_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      init_drive(item);
      //item.print();
      seq_item_port.item_done();   
    end

    forever begin
      item=fpu_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      //item.print();
      seq_item_port.item_done();
    end
  endtask


task drive(fpu_sequence_item item);
  `uvm_info(get_name(),"Drive...",UVM_HIGH)
  @(posedge vif.rdy);
  vif.rst_n<=item.rst_n;
  vif.cmd<=item.cmd;
  vif.din1<=item.din1;
  vif.din2<=item.din2;
  vif.dval<=item.dval;
endtask

task init_drive(fpu_sequence_item item);
  `uvm_info(get_name(),"Init Drive...",UVM_HIGH)
  @(negedge vif.clk);
  vif.rst_n<=item.rst_n;
  vif.cmd<=item.cmd;
  vif.din1<=item.din1;
  vif.din2<=item.din2;
  vif.dval<=item.dval;
endtask

endclass: fpu_driver