function(get_test_source_dir_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(get_test_source_dir_filter "CASE_SENSITIVE;DIRECTORY" 
        "${one_options}" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(get_test_source_dir_filter)

