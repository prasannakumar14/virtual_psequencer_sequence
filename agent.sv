class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  driver drvh;
  monitor monh;
  sequencer seqrh;
  
  agent_config m_cfg;
  
  function new(string name="agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(agent_config)::get(this,"","agent_config",m_cfg))
       `uvm_fatal("Config_db_error","Have you set it?");
       
    monh=monitor::type_id::create("monh",this);
       
    if(m_cfg.is_active == UVM_ACTIVE)
       drvh=driver::type_id::create("drvh",this);
       seqrh=sequencer::type_id::create("seqrh",this);    
  endfunction
       
  function void connect_phase(uvm_phase phase);
    drvh.seq_item_port.connect(seqrh.seq_item_export);
  endfunction
      
endclass
