cmake_minimum_required (VERSION 3.0.2)

project(build_utils)

if(INCLUDE_DIR)
    get_filename_component(INCLUDE_DIR "${INCLUDE_DIR}" ABSOLUTE)
elseif(NOT INCLUDE_DIR)
    get_filename_component(INCLUDE_DIR "${CMAKE_SOURCE_DIR}/../include" ABSOLUTE)
endif()

set(INCLUDE_DIR "${INCLUDE_DIR}" CACHE PATH "include directory" FORCE)

if(TEST_DIR)
    get_filename_component(TEST_DIR "${TEST_DIR}" ABSOLUTE)
elseif (NOT TEST_DIR)
    get_filename_component(TEST_DIR "${CMAKE_SOURCE_DIR}/test" ABSOLUTE)
endif()

set(TEST_DIR "${TEST_DIR}" CACHE PATH "test directory" FORCE)

if("${ENABLE_TEST}" STREQUAL "")
    set(ENABLE_TEST TRUE CACHE BOOL "enable test" FORCE)
else()
    set(ENABLE_TEST ${ENABLE_TEST} CACHE BOOL "enable test" FORCE)
endif()

include(include_build_util.cmake)

if (ENABLE_TEST)
    #add test

    enable_testing()
endif()
