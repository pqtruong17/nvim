## Important
### Make sure to have CMake and Make installed
```
cmake --version
make --version
```
I recommend [chocolately](https://chocolatey.org/install) if you don't have it.

## Setup project using cmake

### Name this file as CMakeLists.txt and save it in your project folder.
```
# Specify the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name and language
project(ExampleProject LANGUAGES C)
project(hello VERSION 1.0)

# Set the C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_executable(main main.c)
add_executable(hello hello.cpp)

# Enable the generation of compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
```



Use this command in powershell 
```
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES 
```

Add -G "MinGW Makefiles" at the end cmd if you have MinGW installed 

```
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -G "MinGW Makefiles" 
```
Make sure that compile_commands.json in the build folder

## To avoid the followling error

```
-- Building for: NMake Makefiles
CMake Error at CMakeLists.txt:5 (project):
  Running

   'nmake' '-?'

  failed with:

   The system cannot find the file specified


CMake Error: CMAKE_C_COMPILER not set, after EnableLanguage
```
