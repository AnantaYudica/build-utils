function(add_test_executable_dir_header_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";TARGET_NAME;TARGET_DIR;SRC_NAME;SRC_TAG;SRC_EXT"
        ";SRC_BASE_DIR;SRC_PATH;SRC_RELATIVE_PATH;SRC_FILENAME")
    cmake_parse_arguments(add_test_executable_dir_header_filter "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(${output} TRUE PARENT_SCOPE)
     
endfunction(add_test_executable_dir_header_filter)