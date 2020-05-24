
function(set_variables)
cmake_parse_arguments(set_variables "" 
    "BASE_SOURCE_DIR;INCLUDE_DIR;TEST_BASE_DIR;TEST_UTILS_DIR;TEST_SOURCE_DIR;
    TEST_NAME;TEST_BASE_SOURCE_DIR" "" ${ARGN}) 

set(l_base_source_dir "")

if("${EMPTY}${set_variables_BASE_SOURCE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_base_source_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
else()    
    get_filename_component(l_base_source_dir "${set_variables_BASE_SOURCE_DIR}" ABSOLUTE)
endif()

if (EXISTS "${l_base_source_dir}")
    set(BASE_SOURCE_DIR ${l_base_source_dir} CACHE PATH "base directory" FORCE)
elseif(NOT EXISTS "${l_base_source_dir}")
    set(BASE_SOURCE_DIR ${CMAKE_SOURCE_DIR} CACHE PATH "base directory" FORCE)
else()
    message(FATAL_ERROR "variable \"BASE_SOURCE_DIR\"" )
endif()

set(l_include_dir "")

if("${EMPTY}${set_variables_INCLUDE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_include_dir "${BASE_SOURCE_DIR}/../include" ABSOLUTE)
else()
    get_filename_component(l_include_dir "${set_variables_INCLUDE_DIR}" ABSOLUTE)
endif()

if (EXISTS "${l_include_dir}")
    set(INCLUDE_DIR ${l_include_dir} CACHE PATH "include directory" FORCE)
elseif(NOT EXISTS "${l_include_dir}")
    get_filename_component(l_include_dir "${BASE_SOURCE_DIR}/../include" ABSOLUTE)
    set(INCLUDE_DIR "${l_include_dir}" CACHE PATH "include directory" FORCE)
else()
    message(FATAL_ERROR "variable \"INCLUDE_DIR\"" )
endif()

set(l_test_base_dir "")

if ("${EMPTY}${set_variables_TEST_BASE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_base_dir "${BASE_SOURCE_DIR}/test" ABSOLUTE)
else()
    get_filename_component(l_test_base_dir "${set_variables_TEST_BASE_DIR}" ABSOLUTE)
endif()

if (EXISTS "${l_test_base_dir}")
    set(TEST_BASE_DIR ${l_test_base_dir} CACHE PATH "test directory" FORCE)
elseif(NOT EXISTS "${l_test_base_dir}")
    get_filename_component(l_test_base_dir "${BASE_SOURCE_DIR}/test" ABSOLUTE)
    set(TEST_BASE_DIR "${l_test_base_dir}" CACHE PATH "test directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_BASE_DIR\"" )
endif()

set(l_test_utils_dir "")

if ("${EMPTY}${set_variables_TEST_UTILS_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_utils_dir "${TEST_BASE_DIR}/utils" ABSOLUTE)
else()
    get_filename_component(l_test_utils_dir "${set_variables_TEST_UTILS_DIR}" ABSOLUTE)
endif()

if (EXISTS "${l_test_utils_dir}")
    set(TEST_UTILS_DIR ${l_test_utils_dir} CACHE PATH "test utils directory" FORCE)
elseif(NOT EXISTS "${l_test_utils_dir}")
    get_filename_component(l_test_utils_dir "${TEST_BASE_DIR}/utils" ABSOLUTE)
    set(TEST_UTILS_DIR "${l_test_utils_dir}" CACHE PATH "test utils directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_UTILS_DIR\"" )
endif()

set(l_test_source_dir "")

if("${EMPTY}${set_variables_TEST_SOURCE_DIR}" STREQUAL "${EMPTY}")
    get_filename_component(l_test_source_dir "${TEST_BASE_DIR}/build_utils" ABSOLUTE)
else()
    get_filename_component(l_test_source_dir "${set_variables_TEST_SOURCE_DIR}" ABSOLUTE)
endif()

if (EXISTS "${l_test_source_dir}")
    set(TEST_SOURCE_DIR ${l_test_source_dir} CACHE PATH "test source directory" FORCE)
elseif(NOT EXISTS "${l_test_source_dir}")
    get_filename_component(l_test_source_dir "${TEST_BASE_DIR}/src" ABSOLUTE)
    set(TEST_SOURCE_DIR "${l_test_source_dir}" CACHE PATH "test source directory" FORCE)
else()
    message(FATAL_ERROR "variable \"TEST_SOURCE_DIR\"" )
endif()

if("${EMPTY}${set_variables_TEST_NAME}" STREQUAL "${EMPTY}")
    set(l_test_source_dir "Not Defined" CACHE PATH "test source name" FORCE)
else()
    set(l_test_source_dir "${set_variables_TEST_NAME}" CACHE PATH "test source name" FORCE)
endif()

if("${EMPTY}${set_variables_TEST_BASE_SOURCE_DIR}" STREQUAL "${EMPTY}")
    set(TEST_BASE_SOURCE_DIR ${TEST_SOURCE_DIR} CACHE PATH "test base source dir" FORCE)
else()
    set(l_test_base_source_dir "")
    get_filename_component(l_test_base_source_dir "${set_variables_TEST_BASE_SOURCE_DIR}" ABSOLUTE)
    set(TEST_BASE_SOURCE_DIR ${l_test_base_source_dir} CACHE PATH "test base source dir" FORCE)
endif()

endfunction(set_variables)
