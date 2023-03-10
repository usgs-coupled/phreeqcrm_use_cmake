cmake_minimum_required(VERSION 3.9) # for GENERATOR_IS_MULTI_CONFIG

# tested with https://github.com/usgs-coupled/phreeqcrm/archive/8c960d439fee586f77065c667f7baeae08a4f92e.tar.gz
# set(RM_VER 8c960d439fee586f77065c667f7baeae08a4f92e)
set(RM_VER master)

# Download phreeqcrm
if (NOT EXISTS ${RM_VER}.tar.gz)
  file(DOWNLOAD https://github.com/usgs-coupled/phreeqcrm/archive/${RM_VER}.tar.gz ${RM_VER}.tar.gz)
endif()

if (NOT EXISTS phreeqcrm-${RM_VER})
  execute_process(COMMAND
    ${CMAKE_COMMAND} -E tar xvzf ${RM_VER}.tar.gz
  )
endif()


if (GENERATOR_IS_MULTI_CONFIG)
  # (Ninja Multi-Config, Visual Studio ...)

  # configure phreeqcrm
  execute_process(COMMAND
    ${CMAKE_COMMAND} -S phreeqcrm-${RM_VER} -B phreeqcrm-${RM_VER}/_multi -DCMAKE_INSTALL_PREFIX:PATH=phreeqcrm
  )

  # build phreeqcrm (debug)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build phreeqcrm-${RM_VER}/_multi --config Debug -j4
  )

  # build phreeqcrm (release)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build phreeqcrm-${RM_VER}/_multi --config Release -j4
  )

else()
  # (Unix Makefiles, Ninja, ...)

  # configure phreeqcrm (debug)
  execute_process(COMMAND
    ${CMAKE_COMMAND} -S phreeqcrm-${RM_VER} -B phreeqcrm-${RM_VER}/_debug -DCMAKE_INSTALL_PREFIX:PATH=phreeqcrm -DCMAKE_BUILD_TYPE=Debug
  )

  # build phreeqcrm (debug)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build phreeqcrm-${RM_VER}/_debug -j4
  )

  # install phreeqcrm (debug)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --install phreeqcrm-${RM_VER}/_debug
  )

  # configure phreeqcrm (release)
  execute_process(COMMAND
    ${CMAKE_COMMAND} -S phreeqcrm-${RM_VER} -B phreeqcrm-${RM_VER}/_release -DCMAKE_INSTALL_PREFIX:PATH=phreeqcrm -DCMAKE_BUILD_TYPE=Release
  )

  # build phreeqcrm (release)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build phreeqcrm-${RM_VER}/_release -j4
  )

  # install phreeqcrm (release)
  execute_process(COMMAND
    ${CMAKE_COMMAND} --install phreeqcrm-${RM_VER}/_release
  )

endif()
