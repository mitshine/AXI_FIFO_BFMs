module fifo_dut(
  input [127:0]data_in,
  input clock,rst,wr,rd,
  output empty,full,
  output reg [255:0]fifo_cnt,
  output reg [127:0] data_out
);

  reg [127:0]mem[0:127];
  reg [2:0]rd_ptr, wr_ptr;

  assign empty=(fifo_cnt==0)?1:0;
  assign full=(fifo_cnt==8)?1:0;

  //Counter block

  always @(posedge clock)
    begin
      if(!rst)
        fifo_cnt<=0;
      else begin
        case({wr,rd})
          2'b00: fifo_cnt <= fifo_cnt;
          2'b01: fifo_cnt <= (fifo_cnt==0)?0:fifo_cnt-1;
          2'b10: fifo_cnt <= (fifo_cnt==8)?8:fifo_cnt+1;
          2'b11: fifo_cnt <= fifo_cnt;
        endcase
      end
    end

  //Pointer block

  always @(posedge clock)
    begin
      if(!rst) begin
        wr_ptr<=0;
        rd_ptr<=0;
      end
      else begin
        wr_ptr<= (wr && !full)||(wr && rd) ? wr_ptr+1 : wr_ptr;
        rd_ptr<= (rd && !empty)||(wr && rd) ? rd_ptr+1 : rd_ptr;
      end
    end

  //Write and read block

  always @(posedge clock)
    if(wr && !full)
      mem[wr_ptr] <= data_in;
    else if(wr && rd)
      mem[wr_ptr] <= data_in;

  always @(posedge clock)
    if(rd && !empty)
      data_out<=mem[rd_ptr];
    else if(wr && rd)
      data_out<=mem[rd_ptr];
endmodule
