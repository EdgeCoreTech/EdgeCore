# Common CMake settings for the project
# Include this from top-level CMakeLists.txt with:
#   include(${CMAKE_SOURCE_DIR}/cmake/common.cmake)

# Default C++ standard
if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 26)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF)
endif()

# Default C standard
if(NOT DEFINED CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 2y)
  set(CMAKE_C_STANDARD_REQUIRED ON)
  set(CMAKE_C_EXTENSIONS OFF)
endif()

option(ENABLE_TESTS "Enable building tests" ON)

# Compiler warnings and flags (applies to both C and C++)
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
endif()

set(CMAKE_CXX_FLAGS_RELEASE "-Os -DNDEBUG -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -flto=auto" CACHE STRING "C++ Release flags")
set(CMAKE_CXX_FLAGS_DEBUG   "-O0 -g -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -flto=auto" CACHE STRING "C++ Debug flags")

set(CMAKE_C_FLAGS_RELEASE "-Os -DNDEBUG -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -flto=auto" CACHE STRING "C Release flags")
set(CMAKE_C_FLAGS_DEBUG   "-O0 -g -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -flto=auto" CACHE STRING "C Debug flags")

add_compile_options(-fsanitize=address,undefined -fno-omit-frame-pointer)
add_link_options(-Wl,--gc-sections -fsanitize=address,undefined)

# Install defaults
if(NOT CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/out/install" CACHE PATH "Install prefix")
endif()

set(CMAKE_INSTALL_RPATH_USE_LINK_PATH ON)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")