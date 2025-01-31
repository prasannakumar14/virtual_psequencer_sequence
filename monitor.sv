class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual intf.mon_mp vif;
  agent_config m_cfg;
  
  extern function new(string name="monitor", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task collect_data();
endclass
    
    function monitor::new(string name="monitor",uvm_component parent);
      super.new(name,parent);
    endfunction
    
    function void monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db #(agent_config)::get(this,"","agent_config",m_cfg))
         `uvm_fatal("Config_db_error","Have you set it?");
    endfunction
         
    function void monitor::connect_phase(uvm_phase phase);
      vif=m_cfg.vif;
    endfunction
         
    task monitor::run_phase(uvm_phase phase);
       forever
         collect_data();
    endtask
         
    task monitor::collect_data();
       xtn x;
       x=xtn::type_id::create("x");
           
       @(vif.mon_cb);
         x.rst=vif.mon_cb.rst;
         x.wr_en=vif.mon_cb.wr_en;
         x.rd_en=vif.mon_cb.rd_en;
         x.addr=vif.mon_cb.addr;
         x.data_in=vif.mon_cb.data_in;
         x.data_out=vif.mon_cb.data_out;
      if(x.rst !=0)
      `uvm_info("Monitor",$sformatf("Printing from driver \n %s",x.sprint()),UVM_LOW);
    endtask
