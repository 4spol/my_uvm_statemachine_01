class case0_sequence extends uvm_sequence #(my_transaction);
   my_transaction m_trans;

   function  new(string name= "case0_sequence");
      super.new(name);
	set_automatic_phase_objection(1);
   endfunction 
   
   virtual task body();
      repeat (3) begin
`uvm_do_with(m_trans,{data==1'b1;})
#100;
`uvm_do_with(m_trans,{data==1'b1;})
#100;
`uvm_do_with(m_trans,{data==1'b0;})
#100;
`uvm_do_with(m_trans,{data==1'b1;})
#100;

      end
   

   endtask

   `uvm_object_utils(case0_sequence)
endclass


class my_case0 extends base_test;

   function new(string name = "my_case0", uvm_component parent = null);
      super.new(name,parent);
   endfunction 
   extern virtual function void build_phase(uvm_phase phase); 
   `uvm_component_utils(my_case0)
endclass


function void my_case0::build_phase(uvm_phase phase);
   super.build_phase(phase);

   uvm_config_db#(uvm_object_wrapper)::set(this, 
                                           "env.i_agt.sqr.main_phase", 
                                           "default_sequence", 
                                           case0_sequence::type_id::get());
endfunction
     

