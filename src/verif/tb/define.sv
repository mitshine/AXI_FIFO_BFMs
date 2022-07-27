 //`defineS for AXI --------------------------------------------
  `define  AXI_ID_W        4   // width of ID fields
  `define  AXI_ADDRESS_W   12  // address width
  `define  AXI_DATA_W      32  // data symbol width 
  `define  AXI_NUMTES      4   // number of tes per word
   localparam SIZE         2 ** AXI_ADDRESS_W 

   //`defineS for Avalon slave ----------------------------------- 
  `define AV_ADDRESS_W          2   // address width
  `define AV_DATA_W            16 
  `define AV_NUMTES             2   // number of tes per word
  `define ENABLE_STREAM_OUTPUT  1   // set in .tcl file, but ties
                                         // to generate logic in rtl
