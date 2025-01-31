class seqs extends uvm_sequence #(xtn);
  `uvm_object_utils(seqs)
  
  function new(string name="seqs");
    super.new(name);
  endfunction
  
  task body();
    repeat(10) begin
      req=xtn::type_id::create("req");
      start_item(req);
      req.randomize();
      finish_item(req);
    end
  endtask
endclass
    
