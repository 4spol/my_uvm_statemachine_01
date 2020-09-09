`ifndef MY_SCOREBOARD__SV
`define MY_SCOREBOARD__SV
/*__________not much to say about this only campare the output of model and out_monitor_____________*/
/*___________use campare____________*/
/*_______if in transaction has something dont want to compare maybe use UVM_NO_CAMPARE is a better solution________________*/
class my_scoreboard extends uvm_scoreboard;
   my_transactiono  expect_queue[$];
   uvm_blocking_get_port #(my_transactiono)  exp_port;
   uvm_blocking_get_port #(my_transactiono)  act_port;
   `uvm_component_utils(my_scoreboard)

   extern function new(string name, uvm_component parent = null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
endclass 

function my_scoreboard::new(string name, uvm_component parent = null);
   super.new(name, parent);
endfunction 

function void my_scoreboard::build_phase(uvm_phase phase);
   super.build_phase(phase);
   exp_port = new("exp_port", this);
   act_port = new("act_port", this);
endfunction 

task my_scoreboard::main_phase(uvm_phase phase);
   my_transactiono  get_expect,  get_actual, tmp_tran;
   bit result;
 
   super.main_phase(phase);
   fork 
      while (1) begin
         exp_port.get(get_expect);
         expect_queue.push_back(get_expect);
      end
      while (1) begin
         act_port.get(get_actual);
         if(expect_queue.size() > 0) begin
            tmp_tran = expect_queue.pop_front();
            result = get_actual.compare(tmp_tran);
            if(result) begin 
               `uvm_info("my_scoreboard", "Compare SUCCESSFULLY", UVM_LOW);
            end
            else begin
               `uvm_error("my_scoreboard", "Compare FAILED");
               $display("the expect pkt is");
               tmp_tran.print();
               $display("the actual pkt is");
               get_actual.print();
            end
         end
         else begin
            `uvm_error("my_scoreboard", "Received from DUT, while Expect Queue is empty");
            $display("the unexpected pkt is");
            get_actual.print();
         end 
      end
   join
endtask
`endif
