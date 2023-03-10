cmake_minimum_required(VERSION 3.0.0)
project(load_db)

# this could have been specified on the command line with
# cmake -DCMAKE_PREFIX_PATH=
# set CMAKE_PREFIX_PATH to the location where phreeqcrm is installed
# 
set(CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR}/../phreeqcrm)

# the next 2 lines will eventually be replaced by
# find_package(PhreeqcRM)
find_library(PhreeqcRM_LIB PhreeqcRM)
find_path(PhreeqcRM_INC PhreeqcRM.h)

# this is your executable followed by your source files
add_executable(load_db main.cpp)

# the next 7 lines will eventually be replaced by
# target_link_libraries(load_db PRIVATE PhreeqcRM::PhreeqcRM)
find_package(OpenMP)
if(OpenMP_FOUND)
  target_compile_definitions(load_db PRIVATE USE_OPENMP)
  target_link_libraries(load_db PRIVATE OpenMP::OpenMP_CXX)
endif()
target_include_directories(load_db PRIVATE ${PhreeqcRM_INC})
target_link_libraries(load_db PRIVATE ${PhreeqcRM_LIB})
