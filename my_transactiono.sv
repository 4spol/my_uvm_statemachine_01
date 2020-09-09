
/*____________easy to remember is it？___________*/
/*__________end with “o“ means output  ______T_T why my designer has different form between input and output_______*/
class my_transactiono extends uvm_sequence_item;

rand bit en;
rand bit [2:0]cnt;
rand bit vaild; 
	
`uvm_object_utils_begin(my_transactiono)
`uvm_field_int(en,UVM_ALL_ON)
`uvm_field_int(cnt,UVM_ALL_ON)
`uvm_field_int(vaild,UVM_ALL_ON | UVM_NOCOMPARE)
`uvm_object_utils_end

function new(string name="my_transactiono");
     super.new();
endfunction
endclass
