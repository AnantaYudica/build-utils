
function(set_variables)
    cmake_parse_arguments(set_variables "" 
        "BASE_SOURCE_DIR;INCLUDE_DIR;TEST_DIR;TEST_UTILS_DIR;TEST_BUILD_UTILS_DIR" "" ${ARGN}) 

    set(l_base_source_dir "")
    get_filename_component(l_base_source_dir "${set_variables_BASE_SOURCE_DIR}" ABSOLUTE)

    if (EXISTS "${l_base_source_dir}")
        set(BASE_SOURCE_DIR ${l_base_source_dir} CACHE PATH "project cmake directory" FORCE)
    elseif(NOT EXISTS "${l_base_source_dir}")
        set(BASE_SOURCE_DIR ${CMAKE_SOURCE_DIR} CACHE PATH "project cmake directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"BASE_SOURCE_DIR\"" )
    endif()
    
    set(l_include_dir "")
    get_filename_component(l_include_dir "${set_variables_INCLUDE_DIR}" ABSOLUTE)

    if (EXISTS "${l_include_dir}")
        set(INCLUDE_DIR ${l_include_dir} CACHE PATH "include directory" FORCE)
    elseif(NOT EXISTS "${l_include_dir}")
        get_filename_component(l_include_dir "${BASE_SOURCE_DIR}/../include" ABSOLUTE)
        set(INCLUDE_DIR "${l_include_dir}" CACHE PATH "include directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"INCLUDE_DIR\"" )
    endif()
    
    set(l_test_dir "")
    get_filename_component(l_test_dir "${set_variables_TEST_DIR}" ABSOLUTE)

    if (EXISTS "${l_test_dir}")
        set(TEST_DIR ${l_test_dir} CACHE PATH "test directory" FORCE)
    elseif(NOT EXISTS "${l_test_dir}")
        get_filename_component(l_test_dir "${BASE_SOURCE_DIR}/test" ABSOLUTE)
        set(TEST_DIR "${l_test_dir}" CACHE PATH "test directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_DIR\"" )
    endif()

    set(l_test_utils_dir "")
    get_filename_component(l_test_utils_dir "${set_variables_TEST_UTILS_DIR}" ABSOLUTE)

    if (EXISTS "${l_test_utils_dir}")
        set(TEST_UTILS_DIR ${l_test_utils_dir} CACHE PATH "test utils directory" FORCE)
    elseif(NOT EXISTS "${l_test_utils_dir}")
        get_filename_component(l_test_utils_dir "${TEST_DIR}/utils" ABSOLUTE)
        set(TEST_UTILS_DIR "${l_test_utils_dir}" CACHE PATH "test utils directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_UTILS_DIR\"" )
    endif()

    set(l_test_build_utils_dir "")
    get_filename_component(l_test_build_utils_dir "${set_variables_TEST_BUILD_UTILS_DIR}" ABSOLUTE)

    if (EXISTS "${l_test_build_utils_dir}")
        set(TEST_BUILD_UTILS_DIR ${l_test_build_utils_dir} CACHE PATH "test utils directory" FORCE)
    elseif(NOT EXISTS "${l_test_build_utils_dir}")
        get_filename_component(l_test_build_utils_dir "${TEST_DIR}/build_utils" ABSOLUTE)
        set(TEST_BUILD_UTILS_DIR "${l_test_build_utils_dir}" CACHE PATH "test utils directory" FORCE)
    else()
        message(FATAL_ERROR "variable \"TEST_BUILD_UTILS_DIR\"" )
    endif()

    include(${BASE_SOURCE_DIR}/include_build_util.cmake)

endfunction(set_variables)
