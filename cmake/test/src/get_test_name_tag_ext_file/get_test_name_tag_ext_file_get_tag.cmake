function(get_test_name_tag_ext_file_get_tag filename index length 
    delim_index delim_length output_str output_index output_length)

    set(one_options "STRING;CHARACTER;DELIMITER;DELIMITER_LENGTH;EXT_DELIMITER_INDEX")
    string(CONCAT one_options "${one_options}" ";EXT_DELIMITER_LENGTH;EXT_INDEX;EXT_LENGTH")
    cmake_parse_arguments(get_test_name_tag_ext_file_get_tag "" "${one_options}" "" ${ARGN}) 
    
    math(EXPR i "${index}+1")
    math(EXPR len "${length}-2")

    string(SUBSTRING "${filename}" ${i} ${len} str)

    set(${output_index} ${i} PARENT_SCOPE)
    set(${output_length} ${len} PARENT_SCOPE)

    set(${output_str} "${str}" PARENT_SCOPE)
    
endfunction(get_test_name_tag_ext_file_get_tag )
