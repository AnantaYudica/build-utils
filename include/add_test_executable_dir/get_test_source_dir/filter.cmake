function(get_test_source_dir_filter path output)
    cmake_parse_arguments(get_test_source_dir_filter "CASE_SENSITIVE" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "HEADER_FILTER" "LIST_EXT")

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_source_dir_filter_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_source_dir_filter_INCLUDE_DIR}")
    endif()

    if("${args_HEADER_FILTER}" STREQUAL "" 
        OR (NOT EXISTS "${args_HEADER_FILTER}"))

        include(${base_dir}/add_test_executable_dir/header_filter.cmake)
    else()
        include(${args_HEADER_FILTER})
    endif()

    set(case_sensitive_arg "")
    if(NOT "${get_test_source_dir_filter_CASE_SENSITIVE}" STREQUAL "")
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(call_args "")
    if (NOT "${args_LIST_TAG}" STREQUAL "")
        list(APPEND call_args "LIST_TAG" ${args_LIST_TAG})
    endif()

    add_test_executable_dir_header_filter(${path} result ${case_sensitive_arg} 
        LEVEL ${get_test_source_dir_filter_LEVEL}
        BASE_DIR ${get_test_source_dir_filter_BASE_DIR}
        RELATIVE_PATH ${get_test_source_dir_filter_RELATIVE_PATH}
        FILENAME ${get_test_source_dir_filter_FILENAME}
        INCLUDE_DIR ${get_test_source_dir_filter_INCLUDE_DIR}
        ARGS ${call_args})

    set(${output} ${result} PARENT_SCOPE)

endfunction(get_test_source_dir_filter)