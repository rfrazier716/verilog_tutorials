module_name=busMaster
verilator -Wall --trace -cc "$module_name.v"
cd obj_dir
make -f "V$module_name.mk"