vcs -licqueue '-timescale=1ns/1ns' '+vcs+flush+all' '+warn=all' '-sverilog' 'scb.c' +incdir+$UVM_HOME/src $UVM_HOME/src/uvm.sv $UVM_HOME/src/dpi/uvm_dpi.cc -CFLAGS -DVCS design.sv testbench.sv

./simv +vcs+lic+wait '+UVM_VERBOSITY=UVM_LOW' '+UVM_NO_RELNOTES' '+ntb_random_seed_automatic'

urg -dir simv.vdb -format text
echo "/////////////////////////////////////////////////Dashboard.txt///////////////////////////////////////////////"
cat urgReport/dashboard.txt
echo "///////////////////////////////////////////////////Gorups.txt/////////////////////////////////////////////////"
cat urgReport/groups.txt
echo "///////////////////////////////////////////////////grpinfo.txt/////////////////////////////////////////////////"
cat urgReport/grpinfo.txt