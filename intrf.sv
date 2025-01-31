interface intf(input bit clk);
  logic rst,wr_en,rd_en;
  logic [7:0] addr,data_in,data_out;
  
  clocking drv_cb @(posedge clk);
    default input #0 output #0;
    output rst,wr_en, rd_en,addr,data_in;
    input data_out;
  endclocking 
  
  clocking mon_cb @(posedge clk);
    default input #0 output #0;
    input rst,wr_en,rd_en,addr,data_in,data_out;
  endclocking
  
  modport drv_mp(clocking drv_cb);
  modport mon_mp(clocking mon_cb);
endinterface
