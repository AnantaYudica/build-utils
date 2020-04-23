function(get_test_source_dir_condition path output)
    cmake_parse_arguments(get_test_source_dir_condition "CASE_SENSITIVE" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 

    set(filename "${get_test_source_dir_condition_FILENAME}")

    set(is_case_sensitive FALSE)
    if (NOT "${get_test_source_dir_filter_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${get_test_source_dir_filter_CASE_SENSITIVE})
    endif()

    cmake_parse_arguments(args "" "GET_TAG;TAG_CONDITION;TAG_DELIMITER" "LIST_TAG" 
        ${get_test_source_dir_condition_ARGS})
        
    set(list_tag ${args_LIST_TAG})

    if (NOT "${list_tag}" STREQUAL "")
        set(call_args "")
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

endfunction(get_test_source_dir_condition)
