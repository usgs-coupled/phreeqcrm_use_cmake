# Using phreeqcrm with cmake


## Build and install phreeqcrm


```
cmake -P build_phreeqcrm.cmake
```

## Which is the equivalent of running the following commands:


```
# download phreeqcrm
curl -L -O https://water.usgs.gov/water-resources/software/PHREEQC/phreeqcrm-3.7.3-15968.tar.gz

# untar phreeqcrm
tar xvzf phreeqcrm-3.7.3-15968.tar.gz

# configure phreeqcrm
cmake -S phreeqcrm-3.7.3-15968 -B phreeqcrm-3.7.3-15968/_build -DCMAKE_INSTALL_PREFIX:PATH=phreeqcrm

# build phreeqcrm
cmake --build phreeqcrm-3.7.3-15968/_build --config Release -j

# install phreeqcrm
cmake --install phreeqcrm-3.7.3-15968/_build --config Release
```

## Create your CMakeLists.txt and add your source code


## Build your app

