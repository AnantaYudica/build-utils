function(get_test_source_dir_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(get_test_source_dir_filter "CASE_SENSITIVE;DIRECTORY" 
        "${one_options}" "ARGS" ${ARGN}) 

    string(CONCAT one_options_args "HEADER_FILTER"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME")
    cmake_parse_arguments(args "" 
        "${one_options_args}" "HEADER_FILTER_ARGS"
        ${get_test_source_dir_filter_ARGS})

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_source_dir_filter_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_source_dir_filter_INCLUDE_DIR}")
    endif()

    if (NOT COMMAND add_test_executable_dir_header_filter)
        if("${args_HEADER_FILTER}" STREQUAL "" 
            OR (NOT EXISTS "${args_HEADER_FILTER}"))

            include(${base_dir}/add_test_executable_dir/header_filter/default.cmake)
        else()
            include(${args_HEADER_FILTER})
        endif()
    endif()

    set(case_sensitive_arg "")
    if(NOT "${get_test_source_dir_filter_CASE_SENSITIVE}" STREQUAL "" 
        AND (get_test_source_dir_filter_CASE_SENSITIVE))

        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(directory_arg "")
    if (NOT "${get_test_source_dir_filter_DIRECTORY}" STREQUAL ""
        AND (get_test_source_dir_filter_DIRECTORY))

        set(directory_arg "DIRECTORY")
    endif()

    set(call_args "")
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
        list(APPEND call_args "SRC_CURR_DIR" ${args_CURR_SRC_DIR})
    endif()

    if(NOT "${args_SRC_RELATIVE_CURR_DIR}" STREQUAL "")
        list(APPEND call_args "SRC_RELATIVE_CURR_DIR" ${args_SRC_RELATIVE_CURR_DIR})
    endif()

    if (NOT "${args_SRC_CURR_DIRNAME}" STREQUAL "")
        list(APPEND call_args "SRC_CURR_DIRNAME" ${args_SRC_CURR_DIRNAME})
    endif()
    
    add_test_executable_dir_header_filter(result 
        ${directory_arg} ${case_sensitive_arg} 
        LEVEL ${get_test_source_dir_filter_LEVEL}
        BASE_DIR ${get_test_source_dir_filter_BASE_DIR}
        PATH ${get_test_source_dir_filter_PATH}
        RELATIVE_PATH ${get_test_source_dir_filter_RELATIVE_PATH}
        FILENAME ${get_test_source_dir_filter_FILENAME}
        DIRNAME ${get_test_source_dir_filter_DIRNAME}
        CURR_DIR ${get_test_source_dir_filter_CURR_DIR} 
        RELATIVE_CURR_DIR ${get_test_source_dir_filter_RELATIVE_CURR_DIR}
        CURR_DIRNAME ${get_test_source_dir_filter_CURR_DIRNAME}
        INCLUDE_DIR ${get_test_source_dir_filter_INCLUDE_DIR}
        ${call_args} ARGS ${args_HEADER_FILTER_ARGS})

    set(${output} ${result} PARENT_SCOPE)

endfunction(get_test_source_dir_filter)