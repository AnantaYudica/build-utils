function(add_test_executable_dir_header_condition output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME") 
    cmake_parse_arguments(add_test_executable_dir_header_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "" 
        "LIST_TAG" ${add_test_executable_dir_header_condition_ARGS})

    set(filename "${add_test_executable_dir_header_condition_FILENAME}")

    set(is_case_sensitive FALSE)
    if (NOT "${get_test_source_dir_filter_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${get_test_source_dir_filter_CASE_SENSITIVE})
    endif()
  
    set(list_tag ${args_LIST_TAG})

    if (NOT "${list_tag}" STREQUAL "")
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

        if (NOT COMMAND get_test_name_tag_ext_file)
            include_build_util(NAME get_test_name_tag_ext_file INCLUDE_DIR ${include_dir})
        endif()
        
        get_test_name_tag_ext_file("${filename}" TAG tag 
            INCLUDE_DIR ${INCLUDE_DIR} ${call_args})

        if (NOT is_case_sensitive)
            string(TOLOWER "${filename}" filename)
            string(TOLOWER "${tag}" tag)
        endif()

        set(result FALSE)
        foreach(it ${list_tag})
            if ("${filename}" STREQUAL "${tag}")
                set(result TRUE)
                break()
            endif()
        endforeach(it)
    else()
        set(result TRUE)
    endif()
    
    set(${output} ${result} PARENT_SCOPE)

endfunction(add_test_executable_dir_header_condition)
