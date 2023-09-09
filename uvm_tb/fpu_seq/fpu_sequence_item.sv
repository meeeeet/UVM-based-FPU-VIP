class fpu_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(fpu_sequence_item)

    /* ------------------------------- data field ------------------------------- */
    rand logic [31:0] a;
    rand logic [31:0] b;
    rand logic [1:0] opcode;

    /* ------------------------------- constructor ------------------------------ */
    function new(string name="fpu_sequence_item");
        super.new(name);
    endfunction

endclass