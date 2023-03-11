# Using phreeqcrm with Modern CMake

## Build and install phreeqcrm (both Debug and Release configurations)

If using a single configuration generator (Unix Makefiles, Ninja) use:

```bash
cmake -P build_phreeqcrm.cmake
```

If using a multi-configuration generators (Visual Studio, Xcode, Ninja Multi-Config) use:

```bash
cmake -P build_phreeqcrm_multi.cmake
```

Set CMAKE_GENERATOR environment variable to override default generator when using `cmake -P` (CMake 3.15 or Newer).

---

## Create your CMakeLists.txt and add your source code


* [src/CMakeLists.txt](src/CMakeLists.txt)
* [src/main.cpp](src/main.cpp)


---
## Single configuration generators (Unix Makefiles, Ninja)
---

### Configure and build your application (Debug configuration)

```bash
# configure
cmake -S src -B build_debug -DCMAKE_BUILD_TYPE=Debug -L
# configure
cmake --build build_debug
# test (optional)
cd build_debug && ctest && cd ..
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR

### Configure and build your application (Release configuration)

```bash
# configure
cmake -S src -B build_release -DCMAKE_BUILD_TYPE=Release -L
# build
cmake --build build_release
# test (optional)
cd build_release && ctest && cd ..
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR

---

## Multi-configuration generators (Visual Studio, Xcode, Ninja Multi-Config)
---

### Configure and build your application (Debug configuration)

```bash
# configure
cmake -S src -B build_multi -L
# build
cmake --build build_multi --config Debug
# test (optional)
cd build_multi && ctest -C Debug && cd ..
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR

### Configure and build your application (Release configuration)

```bash
# configure
cmake -S src -B build_multi -L
# build
cmake --build build_multi --config Release
# test (optional)
cd build_multi && ctest -C Release && cd ..
```
Use the `-L` option to list cached variables and verify PhreeqcRM_DIR
