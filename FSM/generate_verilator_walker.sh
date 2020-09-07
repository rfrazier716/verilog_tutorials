module_name=ledWalker
verilator -Wall --trace -GWIDTH=3 -cc "$module_name.v"
cd obj_dir
make -f "V$module_name.mk"