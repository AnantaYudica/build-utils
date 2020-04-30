function(add_test_executable_dir_get_target_dir dir out_dir_name)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_dir "" 
        "BASE_DIR;RELATIVE_DIR;DIR_NAME;NAME;TAG;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${out_dir_name} "${add_test_executable_dir_get_target_dir_DIR_NAME}")

endfunction(add_test_executable_dir_get_target_dir)
