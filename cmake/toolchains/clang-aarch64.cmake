# Toolchain: Clang for aarch64 (ARM64)
# This uses the aarch64-linux-gnu-clang frontend if available, otherwise
# falls back to clang with target/sysroot flags — adjust to your environment.
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Adjust paths if your toolchain is installed elsewhere
set(CMAKE_C_COMPILER clang CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER clang++ CACHE FILEPATH "C++ compiler")

# When using plain clang as a cross frontend, instruct it to target aarch64.
set(CMAKE_C_FLAGS "--target=aarch64-linux-gnu" CACHE STRING "C flags for clang aarch64")
set(CMAKE_CXX_FLAGS "--target=aarch64-linux-gnu" CACHE STRING "CXX flags for clang aarch64")

if(EXISTS "/usr/aarch64-linux-gnu")
  set(CMAKE_SYSROOT /usr/aarch64-linux-gnu CACHE PATH "Sysroot for aarch64")
  set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

message(STATUS "Using Clang aarch64 toolchain: ${CMAKE_C_COMPILER}, ${CMAKE_CXX_COMPILER}")
