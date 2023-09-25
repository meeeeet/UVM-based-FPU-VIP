class fpu_driver extends uvm_driver #(fpu_sequence_item);
    `uvm_component_utils(fpu_driver)
    virtual fpu_if fpu_vif;
  	fpu_sequence_item item;

/* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_driver",uvm_component parent);
        super.new(name,parent);
        `uvm_info("fpu_driver", "Inside constructor of fpu_driver", UVM_LOW)
    endfunction

/* ------------------------------- build_phase ------------------------------ */
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_name(), "Inside build phase", UVM_LOW)

      if(!(uvm_config_db #(virtual fpu_if)::get(this,"*","fpu_vif",fpu_vif)))
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
      
      forever begin
        item=fpu_sequence_item::type_id::create("item");
        seq_item_port.get_next_item(item);
        print(item);
        drive(item);
        seq_item_port.item_done();
      end
    endtask
  
  task print(fpu_sequence_item item);
    `uvm_info(get_name(),$sformatf("Received data: %b %b %b",item.a,item.b,item.opcode),UVM_LOW)
  endtask
  
  task drive(fpu_sequence_item item);
    @(negedge fpu_vif.clk);
    fpu_vif.a<=item.a;
    fpu_vif.b<=item.b;
    fpu_vif.opcode<=item.opcode;
  endtask

endclass: fpu_driver