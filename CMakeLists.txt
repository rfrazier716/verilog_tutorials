cmake_minimum_required (VERSION 3.10)
project ("Verilog_Tutorials")

# set to cpp 11 standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Define Necessary Verilator Core Files
set(VERILATOR_INCLUDE  "/usr/share/verilator/include")
set(VERILATED "${VERILATOR_INCLUDE}/verilated.cpp")

# Add the Verilator Include path to the include search directory
include_directories("${VERILATOR_INCLUDE}") # verilator core files

# Add *.cmake files below for specific targets
#----------------------------------------------------------
INCLUDE("cmake/thruwire.cmake") # Thruwire Example