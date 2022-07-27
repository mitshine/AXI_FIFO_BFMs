interface fifo_if(input logic clock,rst);
             logic wr;
             logic rd;
             logic full;
             logic empty;
             logic [255:0] fifo_cnt;
             logic [127:0] D_in;
             logic [127:0] D_out;

         clocking driver_cb@(posedge clock);
            default input #1 output #1;
            output wr;
            output rd;
  	    output   full;
            output  empty;
            output fifo_cnt;
            output D_in;
            input D_out;
        endclocking

     clocking monitor_cb@(posedge clock);
          default input #1 output #1;
          input  wr;
          input rd;
          input  full;
           input  empty;
          input fifo_cnt;
          input  D_in;
          input  D_out;
     endclocking

     modport DRIVER (clocking driver_cb,input clock);
     modport MONITOR (clocking monitor_cb,input clock);

  endinterface
