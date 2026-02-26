# Toolchain: Clang for x86_64 (native)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Adjust paths if your toolchain is installed elsewhere
set(CMAKE_C_COMPILER clang CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER clang++ CACHE FILEPATH "C++ compiler")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)

message(STATUS "Using Clang x86_64 toolchain: ${CMAKE_C_COMPILER}, ${CMAKE_CXX_COMPILER}")
