
function(include_test_util)
    cmake_parse_arguments(include_test_util "" 
        "NAME;RELATIVE_DIR;TEST_UTILS_DIR" "" ${ARGN}) 

    set(relative_dir "${include_test_utilRELATIVE_DIR}")
    set(name "${include_test_util_NAME}")

    if("${EMPTY}${name}" STREQUAL "${EMPTY}")
        message(FATAL_ERROR "parameter NAME is not defined")
    endif()

    if(NOT "${EMPTY}${include_test_util_TEST_UTILS_DIR}" STREQUAL "${EMPTY}" )
        set(base_dir "${include_test_util_TEST_UTILS_DIR}")
    else()
        set(base_dir "${TEST_UTILS_DIR}")
    endif()
    
    if(NOT "${EMPTY}${relative_dir}" STREQUAL "${EMPTY}")
        set(cmake_util_path "${base_dir}/${relative_dir}/${name}/CMakeLists.txt")
    elseif("${EMPTY}${relative_dir}" STREQUAL "${EMPTY}")
        set(cmake_util_path "${base_dir}/${name}/CMakeLists.txt")
    endif()

    if (EXISTS "${cmake_util_path}")
        include("${cmake_util_path}")
    else()
        message(FATAL_ERROR "file \"${cmake_util_path}\" not exist")
    endif()

endfunction(include_test_util)

