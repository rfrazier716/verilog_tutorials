###########################################
#
# Build Instructions for Thruwire Example
#
###########################################

# Create new Target
add_executable(thruwire
    "wires/sim_thruwire.cpp"
    ${VERILATED}
)

# Add a custom shell command executed before before building target
# This runs the verilator to generate as well as make the code
add_custom_command(TARGET thruwire PRE_BUILD
    COMMAND "./generate_verilator_thruwire.sh"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/wires"
    )

target_link_libraries(thruwire 
    "${CMAKE_SOURCE_DIR}/wires/obj_dir/Vthruwire__ALL.a"
) # Link to the Verilator Generated static library