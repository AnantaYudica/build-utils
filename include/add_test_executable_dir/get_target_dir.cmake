function(add_test_executable_dir_get_target_dir path name)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_dir "" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${name} "${add_test_executable_dir_get_target_dir_FILENAME}")

endfunction(add_test_executable_dir_get_target_dir)
