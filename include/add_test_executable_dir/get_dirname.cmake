function(add_test_executable_dir_get_dir_name output)
    
    cmake_parse_arguments(add_test_executable_dir_get_dir_name "" 
        "BASE_DIR;PATH;RELATIVE_PATH;DIRNAME;NAME;TAG;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${output} "${add_test_executable_dir_get_dir_name_DIRNAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_dir_name)
