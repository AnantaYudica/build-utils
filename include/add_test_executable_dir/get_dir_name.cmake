function(add_test_executable_dir_get_dir_name dir out_dir_name)
    
    cmake_parse_arguments(add_test_executable_dir_get_dir_name "" 
        "BASE_DIR;RELATIVE_DIR;DIR_NAME;NAME;TAG;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${out_dir_name} "${add_test_executable_dir_get_dir_name_DIR_NAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_dir_name)
