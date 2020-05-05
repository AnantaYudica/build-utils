function(add_test_executable_dir_get_dirname output)
    
    cmake_parse_arguments(add_test_executable_dir_get_dirname "" 
        "BASE_DIR;PATH;RELATIVE_PATH;DIRNAME;NAME;TAG;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${output} "${add_test_executable_dir_get_dirname_DIRNAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_dirname)
