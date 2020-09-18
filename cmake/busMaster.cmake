###########################################
#
# Build Instructions for LED Finite State Machine Example
#
###########################################


# Create new Target
add_executable(bus
    "hiZBus/sim_bus.cpp"
    ${VERILATED}
    ${VERILATED_TRACE}
)

# Add a custom shell command executed before before building target
# This runs the verilator to generate as well as make the code

if(${REBUILD_VERILATOR})
    add_custom_target(bus_vl ALL
        COMMAND sh generate_verilator_bus.sh
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/hiZBus"
        )
    add_dependencies(bus bus_vl)
ENDIF()

target_link_libraries(bus 
    "${CMAKE_SOURCE_DIR}/hiZBus/obj_dir/VbusMaster__ALL.a"
) # Link to the Verilator Generated static library