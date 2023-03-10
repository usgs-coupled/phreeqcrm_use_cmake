cmake_minimum_required(VERSION 3.9)
project(load_db)

# copy database to build directory for testing
configure_file(phreeqc.dat phreeqc.dat COPYONLY)

# this could have been specified on the command line with
# cmake -DCMAKE_PREFIX_PATH=...
# set CMAKE_PREFIX_PATH to the location where phreeqcrm is installed
set(CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR}/../phreeqcrm)

find_package(PhreeqcRM REQUIRED)

# this is your executable followed by your source files
add_executable(load_db main.cpp)

target_link_libraries(load_db PRIVATE PhreeqcRM::PhreeqcRM)

# optionally add support for testing
# cd build && ctest && cd .. (newer cmake versions: ctest --test-dir build)
enable_testing()
add_test(run load_db)
