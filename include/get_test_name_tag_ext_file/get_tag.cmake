function(get_test_name_tag_ext_file_get_tag filename index length 
    delim_index delim_length output_str output_index output_length)

    set(one_options "STRING;CHARACTER;DELIMITER;DELIMITER_LENGTH;EXT_DELIMITER_INDEX")
    string(CONCAT one_options "${one_options}" ";EXT_DELIMITER_LENGTH;EXT_INDEX;EXT_LENGTH"
        ";INCLUDE_DIR")
    cmake_parse_arguments(get_test_name_tag_ext_file_get_tag "" 
        "${one_options}" "ARGS" ${ARGN}) 
    
    set(${output_index} ${index} PARENT_SCOPE)
    set(${output_length} ${length} PARENT_SCOPE)

    set(${output_str} "${get_test_name_tag_ext_file_get_tag_STRING}" PARENT_SCOPE)
    
endfunction(get_test_name_tag_ext_file_get_tag )
