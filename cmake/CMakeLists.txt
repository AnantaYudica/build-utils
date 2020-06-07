cmake_minimum_required (VERSION 3.0.2)

project(build_utils)

if (NOT DEFINED EMPTY)
    set(EMPTY "_empty_" CACHE INTERNAL "Empty" FORCE)
endif()

unset(l_cmake_base_src_dir)
if(NOT DEFINED BUILD_UTILS_CMAKE_BASE_SRC_DIR 
    OR("${EMPTY}${BUILD_UTILS_CMAKE_BASE_SRC_DIR}" STREQUAL "${EMPTY}"))

    get_filename_component(l_cmake_base_src_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
else()
    get_filename_component(l_cmake_base_src_dir "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}" ABSOLUTE)
endif()

set(BUILD_UTILS_CMAKE_BASE_SRC_DIR "${l_cmake_base_src_dir}" 
    CACHE INTERNAL "build utils cmake base source directory" FORCE)

if (DEFINED BUILD_UTILS_PREFIX
    AND (NOT "${EMPTY}${BUILD_UTILS_PREFIX}" STREQUAL "${EMPTY}"))

    set(BUILD_UTILS_PREFIX "${BUILD_UTILS_PREFIX}" 
        CACHE INTERNAL "build-utils prefix string" FORCE)
    string(TOUPPER "${BUILD_UTILS_PREFIX}_" l_upper_)
    set(BUILD_UTILS_PREFIX_UPPER_ "${l_upper_}" 
        CACHE INTERNAL "build-utils prefix string" FORCE)
    unset(l_upper_)
endif()

if("${EMPTY}${BUILD_UTILS_ENABLE_TESTING}" STREQUAL "${EMPTY}")
    set(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_ENABLE_TESTING 
        TRUE CACHE BOOL "build utils enable testing" FORCE)
else()
    set(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_ENABLE_TESTING 
        ${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_ENABLE_TESTING} 
        CACHE BOOL "build utils enable testing" FORCE)
endif()

include(${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/include_build_util.cmake)

include(${BUILD_UTILS_CMAKE_BASE_SRC_DIR}/set_variables.cmake)

set_variables(PREFIX ${BUILD_UTILS_PREFIX}
    INCLUDE_DIR ${BUILD_UTILS_INCLUDE_DIR}
    TEST_BASE_DIR ${BUILD_UTILS_BASE_TEST_DIR}
    TEST_UTILS_DIR ${BUILD_UTILS_TEST_UTILS_DIR}
    TEST_SRC_DIR ${BUILD_UTILS_TEST_SRC_DIR})

get_filename_component(cmake_current_bin_dir ${CMAKE_CURRENT_BINARY_DIR} ABSOLUTE)
get_filename_component(cmake_bin_dir ${CMAKE_BINARY_DIR} ABSOLUTE)

if (${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_ENABLE_TESTING)
    add_subdirectory(${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR})
    enable_testing()
elseif (NOT "${cmake_current_bin_dir}" STREQUAL "${cmake_bin_dir}"
    AND (EXISTS ${CMAKE_CURRENT_BINARY_DIR}/CTestTestfile.cmake))

    file(REMOVE ${CMAKE_CURRENT_BINARY_DIR}/CTestTestfile.cmake)
endif()

unset(cmake_current_bin_dir)
unset(cmake_bin_dir)
