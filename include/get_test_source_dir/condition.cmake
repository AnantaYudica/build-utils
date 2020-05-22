function(get_test_source_dir_condition output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR") 
    cmake_parse_arguments(get_test_source_dir_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(get_test_source_dir_condition)
