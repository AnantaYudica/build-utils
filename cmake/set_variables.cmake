
function(set_variables)
    cmake_parse_arguments(set_variables "" 
        "BASE_SOURCE_DIR;INCLUDE_DIR;TEST_BASE_DIR;TEST_UTILS_DIR;TEST_SOURCE_DIR" "" ${ARGN}) 

    set(l_base_source_dir "")

    if("${set_variables_BASE_SOURCE_DIR}" STREQUAL "")
        get_filename_component(l_base_source_dir "${CMAKE_SOURCE_DIR}" ABSOLUTE)
    else()    
        get_filename_component(l_base_source_dir "${set_variables_BASE_SOURCE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_base_source_dir}")
        set(BUILD_UTILS_BASE_SOURCE_DIR ${l_base_source_dir} 
            CACHE PATH "build utils base directory" FORCE)
    elseif(NOT EXISTS "${l_base_source_dir}")
        set(BUILD_UTILS_BASE_SOURCE_DIR ${CMAKE_SOURCE_DIR} 
            CACHE PATH "build utils base directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"BASE_SOURCE_DIR\"" )
    endif()
    
    set(l_include_dir "")
    
    if("${set_variables_INCLUDE_DIR}" STREQUAL "")
        get_filename_component(l_include_dir "${BUILD_UTILS_BASE_SOURCE_DIR}/../include" ABSOLUTE)
    else()
        get_filename_component(l_include_dir "${set_variables_INCLUDE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_include_dir}")
        set(BUILD_UTILS_INCLUDE_DIR ${l_include_dir} 
            CACHE PATH "build utils include directory" FORCE)
    elseif(NOT EXISTS "${l_include_dir}")
        get_filename_component(l_include_dir "${BUILD_UTILS_BASE_SOURCE_DIR}/../include" ABSOLUTE)
        set(BUILD_UTILS_INCLUDE_DIR "${l_include_dir}" 
            CACHE PATH "build utils include directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"INCLUDE_DIR\"" )
    endif()
    
    set(l_test_base_dir "")

    if ("${set_variables_TEST_BASE_DIR}" STREQUAL "")
        get_filename_component(l_test_base_dir "${BUILD_UTILS_BASE_SOURCE_DIR}/test" ABSOLUTE)
    else()
        get_filename_component(l_test_base_dir "${set_variables_TEST_BASE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_base_dir}")
        set(BUILD_UTILS_TEST_BASE_DIR ${l_test_base_dir} CACHE PATH "test directory" FORCE)
    elseif(NOT EXISTS "${l_test_base_dir}")
        get_filename_component(l_test_base_dir "${BUILD_UTILS_BASE_SOURCE_DIR}/test" ABSOLUTE)
        set(BUILD_UTILS_TEST_BASE_DIR "${l_test_base_dir}" CACHE PATH "test directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_BASE_DIR\"" )
    endif()

    set(l_test_utils_dir "")

    if ("${set_variables_TEST_UTILS_DIR}" STREQUAL "")
        get_filename_component(l_test_utils_dir "${BUILD_UTILS_TEST_BASE_DIR}/utils" ABSOLUTE)
    else()
        get_filename_component(l_test_utils_dir "${set_variables_TEST_UTILS_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_utils_dir}")
        set(BUILD_UTILS_TEST_UTILS_DIR ${l_test_utils_dir} CACHE PATH "test utils directory" FORCE)
    elseif(NOT EXISTS "${l_test_utils_dir}")
        get_filename_component(l_test_utils_dir "${BUILD_UTILS_TEST_BASE_DIR}/utils" ABSOLUTE)
        set(BUILD_UTILS_TEST_UTILS_DIR "${l_test_utils_dir}" CACHE PATH "test utils directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_UTILS_DIR\"" )
    endif()

    set(l_test_source_dir "")

    if("${set_variables_TEST_SOURCE_DIR}" STREQUAL "")
        get_filename_component(l_test_source_dir "${BUILD_UTILS_TEST_BASE_DIR}/src" ABSOLUTE)
    else()
        get_filename_component(l_test_source_dir "${set_variables_TEST_SOURCE_DIR}" ABSOLUTE)
    endif()

    if (EXISTS "${l_test_source_dir}")
        set(BUILD_UTILS_TEST_SOURCE_DIR ${l_test_source_dir} CACHE PATH "test source directory" FORCE)
    elseif(NOT EXISTS "${l_test_source_dir}")
        get_filename_component(l_test_source_dir "${BUILD_UTILS_TEST_BASE_DIR}/src" ABSOLUTE)
        set(BUILD_UTILS_TEST_SOURCE_DIR "${l_test_source_dir}" CACHE PATH "test source directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_SOURCE_DIR\"" )
    endif()

    include(${BUILD_UTILS_BASE_SOURCE_DIR}/include_build_util.cmake)

endfunction(set_variables)
