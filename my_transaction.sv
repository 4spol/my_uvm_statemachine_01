class my_transaction extends uvm_sequence_item;
/*_________dataflow？ maybe have other function______________*/
/*___________input transaction match to input interface____________*/
rand bit data;
	
`uvm_object_utils_begin(my_transaction)
`uvm_field_int(data,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="my_transaction");
     super.new();
endfunction
endclass


