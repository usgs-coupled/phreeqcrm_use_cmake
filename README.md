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

see [src/CMakeLists.txt](src/CMakeLists.txt) and [src/main.cpp](src/main.cpp)


## Configure your application

```
cmake -S src -B build -L
```
Use the `-L` option to list cached variables and verify that the include directory and library are correct


## Build your application

```
cmake --build build --config Release 
```
