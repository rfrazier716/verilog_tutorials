module_name=blinky
verilator -Wall -GWIDTH=4 -cc "$module_name.v"
cd obj_dir
make -f "V$module_name.mk"