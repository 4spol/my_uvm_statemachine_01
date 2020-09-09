`ifndef MY_SEQUENCER__SV
`define MY_SEQUENCER__SV
/*_________the sequencer is send sequence to matched driver______________*/
class my_sequencer extends uvm_sequencer #(my_transaction);
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction 
   
   `uvm_component_utils(my_sequencer)
endclass

`endif
