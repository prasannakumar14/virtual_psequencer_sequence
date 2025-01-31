class env extends uvm_env;
  `uvm_component_utils(env)
  
  agent agnth;
  vsequencer vseqrh;
  
  function new(string name="env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnth=agent::type_id::create("agnth",this);
    vseqrh=vsequencer::type_id::create("vseqrh",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    vseqrh.seqrh=agnth.seqrh;
  endfunction
endclass
