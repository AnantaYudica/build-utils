function(get_test_name_tag_ext_file_get_name filename index length 
output_str output_index output_length )

    set(one_options "TAG_DELIMITER_INDEX;TAG_DELIMITER_LENGTH;TAG_INDEX;TAG_LENGTH")
    string(CONCAT one_options "${one_options}" ";EXT_DELIMITER_INDEX;EXT_DELIMITER_LENGTH"
        ";EXT_INDEX;EXT_LENGTH")
    cmake_parse_arguments(get_test_name_tag_ext_file_get_name "" "${one_options}" "" ${ARGN}) 

    set(${output_index} ${index} PARENT_SCOPE)
    set(${output_length} ${length} PARENT_SCOPE)
    string(SUBSTRING "${filename}" ${index} ${length} name)
    set(${output_str} ${name} PARENT_SCOPE)
    
endfunction(get_test_name_tag_ext_file_get_name )
