class fpu_sequence extends uvm_sequence;
    `uvm_object_utils(fpu_sequence)

    /* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_sequence");
        super.new(name);
    endfunction

    /* -------------------------------- body task ------------------------------- */
    task body();
        `uvm_info(get_name(), "Inside body task", UVM_LOW)
    endtask
endclass: fpu_sequence