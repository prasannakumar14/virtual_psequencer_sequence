`include "design.v"
`include "pkg.sv"
`include "intrf.sv"

module top;
  import pkg::*;
  import uvm_pkg::*;

  
  bit clk;
  
  always #5 clk=~clk;
  
  intf vif(clk);
  
  ram dut(.clk(clk),.rst(vif.rst),.wr_en(vif.wr_en),.rd_en(vif.rd_en),.addr(vif.addr),.data_in(vif.data_in),.data_out(vif.data_out));
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
 
end
  
  initial begin
    uvm_config_db #(virtual intf)::set(null,"*","intf",vif);
    run_test("write");
    
  end
endmodule
