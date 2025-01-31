class driver extends uvm_driver #(xtn);
  `uvm_component_utils(driver)
  
  virtual intf.drv_mp vif;
  agent_config m_cfg;
  
  function new(string name="driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(agent_config)::get(this,"","agent_config",m_cfg))
       `uvm_fatal("Config_db_error","Have you set it?");
  endfunction
       
       function void connect_phase(uvm_phase phase);
         vif=m_cfg.vif;
       endfunction
       
       task run_phase(uvm_phase phase);
         reset();
         forever begin
           seq_item_port.get_next_item(req);
           case(req.rst)
             1'b 0:reset();
             1'b 1:send_to_dut(req);
           endcase
           seq_item_port.item_done();
         end
       endtask
       
       task send_to_dut(xtn x);
         `uvm_info("Driver",$sformatf("Printing from driver \n %s",x.sprint()),UVM_LOW);
         if(x.wr_en == 1) begin
         @(vif.drv_cb);
         vif.drv_cb.rst<=x.rst;
         vif.drv_cb.wr_en<=x.wr_en;
         vif.drv_cb.rd_en<=x.rd_en;
         vif.drv_cb.addr<=x.addr;
         vif.drv_cb.data_in<=x.data_in;
         end
         else begin
         @(vif.drv_cb);
         vif.drv_cb.rst<=x.rst;
         vif.drv_cb.wr_en<=x.wr_en;
         vif.drv_cb.rd_en<=x.rd_en;
         vif.drv_cb.addr<=x.addr;
         vif.drv_cb.data_in<=0;
         end
           
       endtask
       
       task reset();
         //`uvm_info("Driver",$sformatf("Printing from driver \n %s",x.sprint()),UVM_LOW);
         @(vif.drv_cb);
         vif.drv_cb.rst<=0;
         vif.drv_cb.wr_en<=0;
         vif.drv_cb.rd_en<=0;
         vif.drv_cb.addr<=0;
         vif.drv_cb.data_in<=0;
       endtask
         
endclass
