cmake_minimum_required (VERSION 3.10)
project ("sim_wires")

# set to cpp 11 standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Necessary Verilator Core Files
set(verilator_dir  "/usr/share/verilator/include")
set(verilated "${verilator_dir}/verilated.cpp")
message( ${verilated})
include_directories("/usr/share/verilator/include") # verilator core files


# Executable for simulation of thruwire
set(module_dir "${CMAKE_SOURCE_DIR}/wires")
set(module_name "thruwire")

# Generate Verilator Code

add_executable(thruwire 
    "wires/sim_thruwire.cpp"
    ${verilated}
)
target_link_libraries(thruwire ${CMAKE_SOURCE_DIR}/wires/obj_dir/Vthruwire__ALL.a) # Link to the Verilator Generated static library
target_include_directories(thruwire PUBLIC 
"wires/obj_dir"
"${verilator_dir}"
)  # Add the verilator generated headers to the include path)