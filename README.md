# Using phreeqcrm with Modern CMake


## Build and install phreeqcrm (both Debug and Release configurations)


```
cmake -P build_phreeqcrm.cmake
```

## Create your CMakeLists.txt and add your source code

see [src/CMakeLists.txt](src/CMakeLists.txt) and [src/main.cpp](src/main.cpp)


## Configure your application (Debug configuration)

```
cmake -S src -B build_debug -DCMAKE_BUILD_TYPE=Debug -L
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR


## Build your application (Debug configuration)

```
cmake --build build_debug
```


## Configure your application (Release configuration)

```
cmake -S src -B build_release -DCMAKE_BUILD_TYPE=Release -L
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR


## Build your application (Release configuration)

```
cmake --build build_release
```
