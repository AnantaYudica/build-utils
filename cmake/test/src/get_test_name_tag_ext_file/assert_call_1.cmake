function(assert_call)
    cmake_parse_arguments(assert_call "" "OUTPUT" "ARGS" ${ARGN}) 
    
    cmake_parse_arguments(args "" 
        "filename;index;length;tag_delimiter;tag_condition;get_tag;get_name" 
        "" ${assert_call_ARGS}) 

    set(cmd_args "")
    set(filename "")

    if (NOT "${args_filename}" STREQUAL "")
        set(filename "${args_filename}")
    endif()
    if (NOT "${args_index}" STREQUAL "")
        list(APPEND cmd_args "INDEX" ${args_index})
    endif()
    if (NOT "${args_length}" STREQUAL "")
        list(APPEND cmd_args "LENGTH" ${args_length})
    endif()
    if (NOT "${args_tag_delimiter}" STREQUAL "")
        list(APPEND cmd_args "TAG_DELIMITER" "${args_tag_delimiter}")
    endif()
    if (NOT "${args_tag_condition}" STREQUAL "")
        list(APPEND cmd_args "TAG_CONDITION" "${args_tag_condition}")
    endif()
    if (NOT "${args_get_tag}" STREQUAL "")
        list(APPEND cmd_args "GET_TAG" "${args_get_tag}")
    endif()
    if (NOT "${args_get_name}" STREQUAL "")
        list(APPEND cmd_args "GET_NAME" "${args_get_name}")
    endif()
    
    get_test_name_tag_ext_file("${filename}" NAME result_name TAG result_tag EXT result_ext
         ${cmd_args} INCLUDE_DIR ${INCLUDE_DIR})

    if("${result_name}" STREQUAL "")
        set(result_name "EMPTY")
    endif()
    if("${result_tag}" STREQUAL "")
        set(result_tag "EMPTY")
    endif()
    if("${result_ext}" STREQUAL "")
        set(result_ext "EMPTY")
    endif()

    set(out "${result_name};${result_tag};${result_ext}")

    set(${assert_call_OUTPUT} "${out}" PARENT_SCOPE)
    
endfunction(assert_call)
