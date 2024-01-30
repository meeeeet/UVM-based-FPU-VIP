class fpu_driver extends uvm_driver #(fpu_sequence_item);
  `uvm_component_utils(fpu_driver)
  virtual fpu_if fpu_vif;
  fpu_sequence_item item;

//   reg [31:0]test_a[`cases];
//   reg [31:0]test_b[`cases];
//   reg [1:0]test_opcode[`cases];
//   int i;

  function new(string name="fpu_driver",uvm_component parent);
      super.new(name,parent);
      `uvm_info("fpu_driver", "Inside constructor of fpu_driver", UVM_HIGH)
      
  endfunction

  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_name(), "Inside build phase", UVM_HIGH)

    if(!(uvm_config_db #(virtual fpu_if)::get(this,"*","fpu_vif",fpu_vif)))
          `uvm_error(get_name(), "Faild to get Virtual IF from database........")

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
      seq_item_port.get_next_item(item);
      print(item);
      drive(item);
//         save(item);
      seq_item_port.item_done();
//         i++;
//         $writememh("test_a.mem",test_a);
//         $writememh("test_b.mem",test_b);
//         $writememh("test_opcode.mem",test_opcode);
      
    end
  endtask
  


task print(fpu_sequence_item item);
  `uvm_info(get_name(),$sformatf("Received data: %b %b %b",item.a,item.b,item.opcode),UVM_LOW)
endtask

task drive(fpu_sequence_item item);
  @(posedge fpu_vif.clk);
  fpu_vif.a<=item.a;
  fpu_vif.b<=item.b;
  fpu_vif.opcode<=item.opcode;
endtask

    
//   task save(fpu_sequence_item item);
//     test_a[i]=item.a;
//     test_b[i]=item.b;
//     test_opcode[i]=item.opcode;
//   endtask

endclass: fpu_driver