###########################################
#
# Build Instructions for LED Finite State Machine Example
#
###########################################


# Create new Target
add_executable(walker
    "FSM/sim_walker.cpp"
    ${VERILATED}
    ${VERILATED_TRACE}
)

# Add a custom shell command executed before before building target
# This runs the verilator to generate as well as make the code

if(${REBUILD_VERILATOR})
    add_custom_target(walker_vl ALL
        COMMAND sh generate_verilator_walker.sh
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/FSM"
        )
    add_dependencies(walker walker_vl)
ENDIF()

target_link_libraries(walker 
    "${CMAKE_SOURCE_DIR}/FSM/obj_dir/VledWalker__ALL.a"
) # Link to the Verilator Generated static library