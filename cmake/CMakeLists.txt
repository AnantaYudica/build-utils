cmake_minimum_required (VERSION 3.0.2)

project(build_utils)

set(l_base_source_dir "")

if(BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${BASE_SOURCE_DIR}" ABSOLUTE)
elseif(NOT BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
endif()

set(BASE_SOURCE_DIR "${l_base_source_dir}" CACHE PATH "include directory" FORCE)

set(l_include_dir "")

if(INCLUDE_DIR)
    get_filename_component(l_include_dir "${INCLUDE_DIR}" ABSOLUTE)
elseif(NOT INCLUDE_DIR)
    get_filename_component(l_include_dir "${BASE_SOURCE_DIR}/../include" ABSOLUTE)
endif()

set(INCLUDE_DIR "${l_include_dir}" CACHE PATH "include directory" FORCE)

set(l_test_dir "")

if(TEST_DIR)
    get_filename_component(l_test_dir "${TEST_DIR}" ABSOLUTE)
elseif (NOT TEST_DIR)
    get_filename_component(l_test_dir "${BASE_SOURCE_DIR}/test" ABSOLUTE)
endif()

set(TEST_DIR "${l_test_dir}" CACHE PATH "test directory" FORCE)

if(NOT TEST_UTILS_DIR)
    set(TEST_UTILS_DIR "${TEST_DIR}/utils")
endif()

if(NOT TEST_BUILD_UTILS_DIR)
    set(TEST_BUILD_UTILS_DIR "${TEST_DIR}/build_utils")
endif()

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
