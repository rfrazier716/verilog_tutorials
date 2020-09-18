###########################################
#
# Build Instructions for Register LED Blink Example
#
###########################################


# Create new Target
add_executable(overflow
    "registers/clock_overflow/sim_overflow.cpp"
    ${VERILATED}
)

# Add a custom shell command executed before before building target
# This runs the verilator to generate as well as make the code

if(${REBUILD_VERILATOR})
    add_custom_target(overflow_vl ALL
        COMMAND sh generate_verilator_overflow.sh
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/registers/clock_overflow"
        )
    add_dependencies(overflow overflow_vl)
ENDIF()

target_link_libraries(overflow 
    "${CMAKE_SOURCE_DIR}/registers/clock_overflow/obj_dir/Vclock_overflow__ALL.a"
) # Link to the Verilator Generated static library