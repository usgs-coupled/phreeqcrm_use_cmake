# Download phreeqcrm
if (NOT EXISTS phreeqcrm-3.7.3-15968.tar.gz)
  file(DOWNLOAD https://water.usgs.gov/water-resources/software/PHREEQC/phreeqcrm-3.7.3-15968.tar.gz phreeqcrm-3.7.3-15968.tar.gz)
endif()

# untar phreeqcrm
if (NOT EXISTS phreeqcrm-3.7.3-15968)
  execute_process(COMMAND
    ${CMAKE_COMMAND} -E tar xvzf phreeqcrm-3.7.3-15968.tar.gz
  )
endif()

# configure phreeqcrm
execute_process(COMMAND
  ${CMAKE_COMMAND} -S phreeqcrm-3.7.3-15968 -B phreeqcrm-3.7.3-15968/_build -DCMAKE_INSTALL_PREFIX:PATH=phreeqcrm
)

# build phreeqcrm
execute_process(COMMAND
  ${CMAKE_COMMAND} --build phreeqcrm-3.7.3-15968/_build --config Release -j4
)

# install phreeqcrm
execute_process(COMMAND
  ${CMAKE_COMMAND} --install phreeqcrm-3.7.3-15968/_build --config Release
)
