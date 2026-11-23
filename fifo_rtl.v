module fifo(input clk,rst,input [7:0]data_in,input wr_en,rd_en,output reg [7:0] data_out, output full,empty);
  reg [2:0] count;
  reg[1:0] wr_ptr;
  reg[1:0] rd_ptr;
  reg [7:0] mem [3:0];
  
  assign full = (count==3'd4);
  assign empty = (count==3'd0);
  
  //write 
  always@(posedge clk) begin
    if (rst) begin
      wr_ptr <= 0;
     
    end
  else if(wr_en &&!full) begin
    mem[wr_ptr] <= data_in;
  wr_ptr<= wr_ptr+2'b01;
  end
  end
  //read
  always@(posedge clk) begin
    if (rst)
      rd_ptr<=0;
  else if (rd_en && !empty) begin 
    data_out <= mem[rd_ptr];
  rd_ptr <= rd_ptr + 2'b01;
  end
  end
  always@(posedge clk) begin
    if(rst)
      count <= 0;
  else 
    case({wr_en && !full,rd_en && !empty})
      2'b10: count <= count + 1;
      2'b01: count <= count -1 ;
      default : count <= count ;
    endcase
  end 
endmodule 
