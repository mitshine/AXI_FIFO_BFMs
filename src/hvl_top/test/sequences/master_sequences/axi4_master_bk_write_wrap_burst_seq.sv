`ifndef AXI4_MASTER_BK_WRITE_WRAP_BURST_SEQ_INCLUDED_
`define AXI4_MASTER_BK_WRITE_WRAP_BURST_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_master_bk_write_wrap_burst_seq
// Extends the axi4_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class axi4_master_bk_write_wrap_burst_seq extends axi4_master_bk_base_seq;
  `uvm_object_utils(axi4_master_bk_write_wrap_burst_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_master_bk_write_wrap_burst_seq");
  extern task body();

endclass : axi4_master_bk_write_wrap_burst_seq

//--------------------------------------------------------------------------------------------
// Construct: new
// Initializes new memory for the object
//
// Parameters:
//  name - axi4_master_bk_write_wrap_burst_seq
//--------------------------------------------------------------------------------------------
function axi4_master_bk_write_wrap_burst_seq::new(string name = "axi4_master_bk_write_wrap_burst_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the req of type master transaction and randomises the req
//--------------------------------------------------------------------------------------------
task axi4_master_bk_write_wrap_burst_seq::body();
  super.body();
  
  start_item(req);
  if(!req.randomize() with {req.awsize == WRITE_2_BYTES;
                              req.tx_type == WRITE;
                              req.transfer_type == BLOCKING_WRITE;
                              req.awburst == WRITE_WRAP;}) begin
  `uvm_fatal("axi4","Rand failed");
 end
 
 `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: master_seq \n%s",req.sprint()), UVM_NONE); 
  finish_item(req);

endtask : body

`endif

