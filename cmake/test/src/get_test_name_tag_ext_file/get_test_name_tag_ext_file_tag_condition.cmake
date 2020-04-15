function(get_test_name_tag_ext_file_tag_condition filename index length cond 
    tag_delim_index tag_delim_length)

    set(one_options "STRING;CHARACTER;DELIMITER;DELIMITER_LENGTH;EXT_DELIMITER_INDEX")
    string(CONCAT one_options "${one_options}" ";EXT_DELIMITER_LENGTH;EXT_INDEX;EXT_LENGTH")
    cmake_parse_arguments(get_test_name_tag_ext_file_tag_condition "" "${one_options}" "" ${ARGN})

    set(delim "${get_test_name_tag_ext_file_tag_condition_DELIMITER}")
    set(str "${get_test_name_tag_ext_file_tag_condition_STRING}")

    if ("${str}" MATCHES "${delim}")
        set(${cond} TRUE PARENT_SCOPE)
        set(${tag_delim_index} ${index} PARENT_SCOPE)
        set(${tag_delim_length} 0 PARENT_SCOPE)
    else()
        set(${cond} FALSE PARENT_SCOPE)
    endif()
endfunction(get_test_name_tag_ext_file_tag_condition )
