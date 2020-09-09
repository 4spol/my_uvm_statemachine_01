modify file.f
//if u use vcs this command may help u
vcs -sverilog -timescale=1ns/1ns -debug_access+classdbg +vpi +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR +incdir+/home/ed/synopsys/vcs2016/etc/uvm-1.2/src /home/ed/synopsys/vcs2016/etc/uvm-1.2/src/uvm.sv /home/ed/synopsys/vcs2016/etc/uvm-1.2/src/dpi/uvm_dpi.cc -CFLAGS -DVCS +define+UVM_USE_RESOURCE_CONVERTER -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,-no-as-needed  -f file.f
//if has something error,maybe is 64bit ubuntu dont install something in 32, it's real suck, you know, the enviroment of ubuntu is not friendly enough to fresh; after all it's a study way;
next is simv the command below
./simv  +UVM_TESTNAME=my_test 
here is so much option for ./simv command , but i dont think its neccessary. because only one person for this project; and its is very easy; 
after a week i will finish it with reg_model and backdoor or frontdoor way to verification this dut which verification in modelsim, hhhhh ,feel like slowly;(maybe i should start a new project for a D triggered to learn to build a easy reg_block;)
good lucky :-)
