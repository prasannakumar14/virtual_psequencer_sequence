class vsequence extends uvm_sequence;
  `uvm_object_utils(vsequence)
  
  seqs seqs_h;
  sequencer seqrh;
  
  `uvm_declare_p_sequencer(vsequencer)
  
  function new(string name="vsequence");
    super.new(name);
  endfunction
  
  task body();
    seqs_h=seqs::type_id::create("seqs_h");
    
    seqs_h.start(p_sequencer.seqrh);
  endtask
endclass
