To Compile the Code<br>
vlog -sv +incdir+$UVM_HOME/src +define+UVM_NODEPRECATED top.sv<br>
<br>
To Run the Simulation<br>
vsim -c -sv_seed random -do "run -all" tb
