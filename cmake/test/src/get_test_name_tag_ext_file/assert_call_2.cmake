function(assert_call)
    cmake_parse_arguments(assert_call "" "OUTPUT" "ARGS" ${ARGN}) 
    
    cmake_parse_arguments(args "" 
        "filename;index;length;tag_delimiter;tag_condition;get_tag;get_name" 
        "" ${assert_call_ARGS}) 

    set(cmd_args "")
    set(filename "")

    if (NOT "${EMPTY}${args_filename}" STREQUAL "${EMPTY}")
        set(filename "${args_filename}")
    endif()
    if (NOT "${EMPTY}${args_index}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "INDEX" ${args_index})
    endif()
    if (NOT "${EMPTY}${args_length}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "LENGTH" ${args_length})
    endif()
    if (NOT "${EMPTY}${args_tag_delimiter}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "TAG_DELIMITER" "${args_tag_delimiter}")
    endif()
    if (NOT "${EMPTY}${args_tag_condition}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "TAG_CONDITION" "${args_tag_condition}")
    endif()
    if (NOT "${EMPTY}${args_get_tag}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "GET_TAG" "${args_get_tag}")
    endif()
    if (NOT "${EMPTY}${args_get_name}" STREQUAL "${EMPTY}")
        list(APPEND cmd_args "GET_NAME" "${args_get_name}")
    endif()
    
    get_test_name_tag_ext_file("${filename}" NAME_INDEX out_name_index NAME_LENGTH out_name_length 
        TAG_DELIMITER_INDEX out_tag_delim_index TAG_DELIMITER_LENGTH out_tag_delim_length 
        TAG_INDEX out_tag_index TAG_LENGTH out_tag_length 
        EXT_DELIMITER_INDEX out_ext_delim_index EXT_DELIMITER_LENGTH out_ext_delim_length
        EXT_INDEX out_ext_index EXT_LENGTH out_ext_length ${cmd_args} 
        INCLUDE_DIR ${INCLUDE_DIR})

    set(out "${out_name_index};${out_name_length};${out_tag_delim_index};${out_tag_delim_length}")
    string(CONCAT out "${out}" ";${out_tag_index};${out_tag_length};${out_ext_delim_index}"
        ";${out_ext_delim_length};${out_ext_index};${out_ext_length}")

    set(${assert_call_OUTPUT} "${out}" PARENT_SCOPE)
    
endfunction(assert_call)
