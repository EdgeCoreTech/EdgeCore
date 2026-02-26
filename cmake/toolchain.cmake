# Generic toolchain base for Linux hosts (no environment variables)
# This file intentionally does not read environment variables. Select a
# specific toolchain file from `cmake/toolchains/` instead.

if(NOT DEFINED CMAKE_SYSTEM_NAME)
  set(CMAKE_SYSTEM_NAME Linux CACHE STRING "System name for the target")
endif()

set(CMAKE_POSITION_INDEPENDENT_CODE ON CACHE BOOL "Build position-independent code")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
endif()

message(STATUS "Using generic toolchain base: ${CMAKE_TOOLCHAIN_FILE}")
if(DEFINED CMAKE_C_COMPILER)
  message(STATUS "C compiler: ${CMAKE_C_COMPILER}")
endif()
if(DEFINED CMAKE_CXX_COMPILER)
  message(STATUS "CXX compiler: ${CMAKE_CXX_COMPILER}")
endif()

# If a sysroot is specified by a specific toolchain, let find behavior follow it
if(DEFINED CMAKE_SYSROOT)
  set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT} CACHE PATH "Find root path for cross compilation")
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()
