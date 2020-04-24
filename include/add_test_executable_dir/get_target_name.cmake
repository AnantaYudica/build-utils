function(add_test_executable_dir_get_target_name path out_target_name)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_name "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR" "ARGS" ${ARGN}) 

    set(${out_target_name} "${add_test_executable_dir_get_target_name_NAME}")

endfunction(add_test_executable_dir_get_target_name)
