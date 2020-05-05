function(add_test_executable_dir_src_filter cond)
    
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR;NAME;TAG:EXT")
    cmake_parse_arguments(add_test_executable_dir_src_filter 
        "CASE_SENSITIVE;DIRECTORY" "${one_options}" "ARGS" ${ARGN}) 
    
    set(${cond} TRUE PARENT_SCOPE)
    
endfunction(add_test_executable_dir_src_filter)