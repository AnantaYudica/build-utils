cmake_minimum_required (VERSION 3.0.2)

project(build_utils)

set(l_base_source_dir "")

if(BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${BASE_SOURCE_DIR}" ABSOLUTE)
elseif(NOT BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
endif()

set(BASE_SOURCE_DIR "${l_base_source_dir}" CACHE PATH "base source directory" FORCE)

if("${ENABLE_TEST}" STREQUAL "")
    set(ENABLE_TEST TRUE CACHE BOOL "enable test" FORCE)
else()
    set(ENABLE_TEST ${ENABLE_TEST} CACHE BOOL "enable test" FORCE)
endif()

include(${BASE_SOURCE_DIR}/include_build_util.cmake)

if (ENABLE_TEST)
    include(${BASE_SOURCE_DIR}/set_variables.cmake)
    set_variables(BASE_SOURCE_DIR "${BASE_SOURCE_DIR}" 
        INCLUDE_DIR "${INCLUDE_DIR}" 
        TEST_DIR "${TEST_DIR}" 
        TEST_UTILS_DIR "${TEST_UTILS_DIR}" 
        TEST_BUILD_UTILS_DIR "${TEST_BUILD_UTILS_DIR}")
    enable_testing()
    add_subdirectory(${TEST_DIR})
endif()
