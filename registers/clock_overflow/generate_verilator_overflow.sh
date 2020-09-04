module_name=clock_overflow
verilator -Wall -GWIDTH=3 -cc "$module_name.v"
cd obj_dir
make -f "V$module_name.mk"