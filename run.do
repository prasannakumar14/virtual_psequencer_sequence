vlog top.sv
#vsim top
vsim -novopt -suppress 12110 top 
add wave -position insertpoint sim:/top/vif/*
run -all
