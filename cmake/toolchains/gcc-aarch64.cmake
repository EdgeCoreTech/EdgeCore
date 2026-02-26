# Toolchain: GCC cross for aarch64 (ARM64)
# Uses GNU cross toolchain binaries; adjust paths if different on your system.
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++ CACHE FILEPATH "C++ compiler")

# Typical sysroot for Debian cross packages — adjust if needed.
if(EXISTS "/usr/aarch64-linux-gnu")
  set(CMAKE_SYSROOT /usr/aarch64-linux-gnu CACHE PATH "Sysroot for aarch64")
  set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

message(STATUS "Using GCC aarch64 toolchain: ${CMAKE_C_COMPILER}, ${CMAKE_CXX_COMPILER}")
