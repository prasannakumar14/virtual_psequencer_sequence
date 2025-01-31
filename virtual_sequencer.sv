class vsequencer extends uvm_sequencer;
  `uvm_component_utils(vsequencer)
  
  sequencer seqrh;
  
  function new(string name="vsequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
