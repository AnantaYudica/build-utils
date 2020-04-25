function(get_test_source_dir_condition path output)
    cmake_parse_arguments(get_test_source_dir_condition "CASE_SENSITIVE" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" 
        "HEADER_CONDITION;GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER" 
        "LIST_TAG" ${get_test_source_dir_condition_ARGS})

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_source_dir_condition_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_source_dir_condition_INCLUDE_DIR}")
    endif()

    if("${args_HEADER_CONDITION}" STREQUAL "" 
        OR (NOT EXISTS "${args_HEADER_CONDITION}"))

        include(${base_dir}/add_test_executable_dir/header_condition.cmake)
    else()
        include(${args_HEADER_CONDITION})
    endif()

    set(case_sensitive_arg "")
    if(NOT "${get_test_source_dir_condition_CASE_SENSITIVE}" STREQUAL "")
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(call_args "")
    if (NOT "${args_GET_NAME}" STREQUAL "")
        list(APPEND call_args "GET_NAME" ${args_GET_NAME})
    endif()

    if (NOT "${args_GET_TAG}" STREQUAL "")
        list(APPEND call_args "GET_TAG" ${args_GET_TAG})
    endif()

    if(NOT "${args_TAG_CONDITION}" STREQUAL "")
        list(APPEND call_args "TAG_CONDITION" ${args_TAG_CONDITION})
    endif()

    if (NOT "${args_TAG_DELIMITER}" STREQUAL "")
        list(APPEND call_args "TAG_DELIMITER" ${args_TAG_DELIMITER})
    endif() 

    if (NOT "${args_LIST_TAG}" STREQUAL "")
        list(APPEND call_args "LIST_TAG" ${args_LIST_TAG})
    endif()

    add_test_executable_dir_header_condition(${path} result ${case_sensitive_arg}
        BASE_DIR ${get_test_source_dir_condition_BASE_DIR}
        RELATIVE_PATH ${get_test_source_dir_condition_RELATIVE_PATH}
        FILENAME ${get_test_source_dir_condition_FILENAME}
        INCLUDE_DIR ${get_test_source_dir_condition_INCLUDE_DIR}
        ARGS ${call_args})

    set(${output} ${result} PARENT_SCOPE)
     
endfunction(get_test_source_dir_condition)
