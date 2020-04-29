function(add_test_executable_dir_get_dir_name path dir_name)
    
    cmake_parse_arguments(add_test_executable_dir_get_dir_name "" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR" 
        "ARGS" ${ARGN}) 

    set(${dir_name} "${add_test_executable_dir_get_dir_name_FILENAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_dir_name)
