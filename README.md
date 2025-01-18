# Can’t find standard library headers (<map>, <stdio.h> etc)
Create the following file into your project directory
## CMakeLists.txt
```
bash
# Specify the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name and language
project(ExampleProject LANGUAGES C)

# Set the C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
```
## Important 
Make sure to follow this [guide](https://stackoverflow.com/questions/40504552/how-to-install-visual-c-build-tools) to install build tool properly.

## Otherwise
There will a CMake error as following
```
bash
PS ~\glfw-3.3.2\GLFW> cmake -S . -B Build
CMake Error at CMakeLists.txt:3 (project):
  Running

   'nmake' '-?'

  failed with:

   The system cannot find the file specified


-- Configuring incomplete, errors occurred!
See also "~/glfw-3.3.2/GLFW/Build/CMakeFiles/CMakeOutput.log".
```
## Enter the command

```bash
cmake -S . -B Build -G "MinGW Makefiles"
```





