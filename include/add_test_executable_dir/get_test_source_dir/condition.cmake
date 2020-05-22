function(get_test_source_dir_condition output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR") 
    cmake_parse_arguments(get_test_source_dir_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    string(CONCAT one_options_args "HEADER_CONDITION;GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME")
    cmake_parse_arguments(args "" "${one_options_args}" 
        "HEADER_CONDITION_ARGS" ${get_test_source_dir_condition_ARGS})

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_source_dir_condition_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_source_dir_condition_INCLUDE_DIR}")
    endif()

    if (NOT COMMAND add_test_executable_dir_header_condition)
        if("${args_HEADER_CONDITION}" STREQUAL "" 
            OR (NOT EXISTS "${args_HEADER_CONDITION}"))

            include(${base_dir}/add_test_executable_dir/header_condition/default.cmake)
        else()
            include(${args_HEADER_CONDITION})
        endif()
    endif()

    set(case_sensitive_arg "")
    if(NOT "${get_test_source_dir_condition_CASE_SENSITIVE}" STREQUAL ""
        AND (get_test_source_dir_condition_CASE_SENSITIVE))
        
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

    if(NOT "${args_TARGET_NAME}" STREQUAL "")
        list(APPEND call_args "TARGET_NAME" ${args_TARGET_NAME})
    endif()

    if(NOT "${args_TARGET_DIR}" STREQUAL "")
        list(APPEND call_args "TARGET_DIR" ${args_TARGET_DIR})
    endif()

    if(NOT "${args_SRC_PATH}" STREQUAL "")
        list(APPEND call_args "SRC_PATH" ${args_SRC_PATH})
    endif()

    if(NOT "${args_SRC_BASE_DIR}" STREQUAL "")
        list(APPEND call_args "SRC_BASE_DIR" ${args_SRC_BASE_DIR})
    endif()

    if(NOT "${args_SRC_RELATIVE_PATH}" STREQUAL "")
        list(APPEND call_args "SRC_RELATIVE_PATH" ${args_SRC_RELATIVE_PATH})
    endif()
    
    if(NOT "${args_SRC_FILENAME}" STREQUAL "")
        list(APPEND call_args "SRC_FILENAME" ${args_SRC_FILENAME})
    endif()

    if(NOT "${args_SRC_NAME}" STREQUAL "")
        list(APPEND call_args "SRC_NAME" ${args_SRC_NAME})
    endif()

    if(NOT "${args_SRC_TAG}" STREQUAL "")
        list(APPEND call_args "SRC_TAG" ${args_SRC_TAG})
    endif()

    if(NOT "${args_SRC_EXT}" STREQUAL "")
        list(APPEND call_args "SRC_EXT" ${args_SRC_EXT})
    endif()

    if(NOT "${args_SRC_CURR_DIR}" STREQUAL "")
        list(APPEND call_args "SRC_CURR_DIR" ${args_SRC_CURR_DIR})
    endif()

    if(NOT "${args_SRC_RELATIVE_CURR_DIR}" STREQUAL "")
        list(APPEND call_args "SRC_RELATIVE_CURR_DIR" ${args_SRC_RELATIVE_CURR_DIR})
    endif()

    if (NOT "${args_SRC_CURR_DIRNAME}" STREQUAL "")
        list(APPEND call_args "SRC_CURR_DIRNAME" ${args_SRC_CURR_DIRNAME})
    endif()
    
    add_test_executable_dir_header_condition(result ${case_sensitive_arg}
        BASE_DIR ${get_test_source_dir_condition_BASE_DIR}
        PATH ${get_test_source_dir_condition_PATH}
        RELATIVE_PATH ${get_test_source_dir_condition_RELATIVE_PATH}
        FILENAME ${get_test_source_dir_condition_FILENAME}
        CURR_DIR ${get_test_source_dir_condition_CURR_DIR}
        RELATIVE_CURR_DIR ${get_test_source_dir_condition_RELATIVE_CURR_DIR}
        CURR_DIRNAME ${get_test_source_dir_condition_CURR_DIRNAME}
        INCLUDE_DIR ${get_test_source_dir_condition_INCLUDE_DIR}
        ${call_args} ARGS ${args_HEADER_CONDITION_ARGS})

    set(${output} ${result} PARENT_SCOPE)
     
endfunction(get_test_source_dir_condition)
