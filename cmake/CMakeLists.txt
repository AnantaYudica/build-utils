cmake_minimum_required (VERSION 3.0.2)

project(build_utils)

set(l_base_source_dir "")

if(BUILD_UTILS_BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${BUILD_UTILS_BASE_SOURCE_DIR}" ABSOLUTE)
elseif(NOT BASE_SOURCE_DIR)
    get_filename_component(l_base_source_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
endif()

if (NOT DEFINED EMPTY)
    set(EMPTY "_empty_" CACHE INTERNAL "Empty" FORCE)
endif()

set(BUILD_UTILS_BASE_SOURCE_DIR "${l_base_source_dir}" 
    CACHE PATH "build utils base source directory" FORCE)

if("${EMPTY}${BUILD_UTILS_ENABLE_TEST}" STREQUAL "${EMPTY}")
    set(BUILD_UTILS_ENABLE_TEST TRUE CACHE BOOL "build utils enable test" FORCE)
else()
    set(BUILD_UTILS_ENABLE_TEST ${BUILD_UTILS_ENABLE_TEST} 
        CACHE BOOL "build utils enable test" FORCE)
endif()

include(${BUILD_UTILS_BASE_SOURCE_DIR}/include_build_util.cmake)

if (BUILD_UTILS_ENABLE_TEST)
    include(${BUILD_UTILS_BASE_SOURCE_DIR}/set_variables.cmake)
    set_variables(BASE_SOURCE_DIR "${BUILD_UTILS_BASE_SOURCE_DIR}" 
        INCLUDE_DIR "${BUILD_UTILS_INCLUDE_DIR}" 
        TEST_BASE_DIR "${BUILD_UTILS_BASE_TEST_DIR}" 
        TEST_UTILS_DIR "${BUILD_UTILS_TEST_UTILS_DIR}" 
        TEST_SOURCE_DIR "${BUILD_UTILS_TEST_SOURCE_DIR}")
    enable_testing()
    add_subdirectory(${BUILD_UTILS_TEST_BASE_DIR})
endif()
