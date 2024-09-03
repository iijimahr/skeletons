####
#### Build setup for C++ project
####

cmake_minimum_required(VERSION 3.20)
project(TestProject)

# Use specified compiler and options
if(DEFINED ENV{CXX})
  set(CMAKE_CXX_COMPILER $ENV{CXX})
endif()
if(DEFINED ENV{CXXFLAGS})
  set(CMAKE_CXX_FLAGS $ENV{CXXFLAGS})
endif()

# Target: Application
file(GLOB SOURCES "src/*.cpp")
add_executable(app ${SOURCES})

# Target: Unit test
file(GLOB TEST_SOURCES "test/*.cpp")
add_executable(test_app ${TEST_SOURCES})

# Fetch doctest
include(FetchContent)
FetchContent_Declare(
  doctest
  GIT_REPOSITORY https://github.com/doctest/doctest.git
  GIT_TAG v2.4.10
)
FetchContent_MakeAvailable(doctest)

# Include directories
target_include_directories(test_app PRIVATE ${CMAKE_SOURCE_DIR}/src)
target_include_directories(test_app PRIVATE ${doctest_SOURCE_DIR})

# Suppress warning by third party libraries
target_compile_options(test_app PRIVATE -isystem ${doctest_SOURCE_DIR})
