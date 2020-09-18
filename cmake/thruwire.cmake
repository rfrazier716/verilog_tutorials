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

if(${REBUILD_VERILATOR})
    add_custom_target(thruwire_vl ALL
        COMMAND sh generate_verilator_thruwire.sh
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/wires"
        )
    add_dependencies(thruwire thruwire_vl)
ENDIF()

target_link_libraries(thruwire 
    "${CMAKE_SOURCE_DIR}/wires/obj_dir/Vthruwire__ALL.a"
) # Link to the Verilator Generated static library