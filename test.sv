class test extends uvm_test;
  `uvm_component_utils(test)
  
  env envh;
  agent_config m_cfg;
  
  function new(string name="test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_cfg=agent_config::type_id::create("m_cfg",this);
    
    
    if(!uvm_config_db #(virtual intf)::get(this,"","intf",m_cfg.vif))
       `uvm_fatal("Config_db_error","Have you set it?");
       
    uvm_config_db #(agent_config)::set(this,"*","agent_config",m_cfg);
       
    envh=env::type_id::create("envh",this);
  endfunction
endclass

class write extends test;
  `uvm_component_utils(write)
   
  vsequence vseq;
  
  function new(string name="write", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    vseq=vsequence::type_id::create("vseq");
    phase.raise_objection(this);
    vseq.start(envh.vseqrh);
    phase.drop_objection(this);
  endtask
endclass
