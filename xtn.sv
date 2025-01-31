class xtn extends uvm_sequence_item;
  bit rst =1;
  rand bit wr_en;
  rand bit rd_en;
  rand bit[7:0] addr;
  rand bit[7:0] data_in;
  bit[7:0] data_out;
  
  constraint x{wr_en != rd_en; addr inside{60,70};};
  
  `uvm_object_utils_begin(xtn)
  `uvm_field_int(rst, UVM_ALL_ON)
  `uvm_field_int(wr_en, UVM_ALL_ON)
  `uvm_field_int(rd_en, UVM_ALL_ON)
  `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(data_in, UVM_ALL_ON)
  `uvm_field_int(data_out, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="xtn");
    super.new(name);
  endfunction
endclass
