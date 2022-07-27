`ifndef AXI4_WRITE_TEST_INCLUDED_
`define AXI4_WRITE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_write_test
// Extends the base test and starts the virtual sequenceof write
//--------------------------------------------------------------------------------------------
class axi4_write_test extends axi4_base_test;
  `uvm_component_utils(axi4_write_test)

  //Variable : axi4_virtual_write_seq_h
  //Instatiation of axi4_virtual_write_seq
  axi4_virtual_write_seq  axi4_virtual_write_seq_h;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_write_test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : axi4_write_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - axi4_write_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function axi4_write_test::new(string name = "axi4_write_test",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: run_phase
// Creates the axi4_virtual_write_seq sequence and starts the write virtual sequences
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task axi4_write_test::run_phase(uvm_phase phase);

  axi4_virtual_write_seq_h=axi4_virtual_write_seq::type_id::create("axi4_virtual_write_seq_h");
  `uvm_info(get_type_name(),$sformatf("axi4_write_test"),UVM_LOW);
  phase.raise_objection(this);
  axi4_virtual_write_seq_h.start(axi4_env_h.axi4_virtual_seqr_h);
  phase.drop_objection(this);

endtask : run_phase

`endif

