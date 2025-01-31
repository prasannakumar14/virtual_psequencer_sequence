module ram(clk,rst,wr_en,rd_en,addr,data_in,data_out);
  input clk,rst,wr_en,rd_en;
  input [7:0]addr,data_in;
  output [7:0]data_out;
  
  reg [7:0] data_out_;
  reg [7:0]ram[1023];
  
  always @(posedge clk or negedge rst) begin
    if(~rst) begin
      data_out_<=0;
      for(int i=0; i<1024; i++)
        ram[i]<=0;
    end
    else
      if(wr_en && ~rd_en)
        ram[addr]<=data_in;
    
    else if(~wr_en && rd_en)
      data_out_<=ram[addr];
  end
  assign data_out=data_out_;
endmodule
