function(add_test_executable_dir_get_target_compile path out_list_options
    out_list_definitions)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_compile "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR;TARGET_NAME" 
        "ARGS" ${ARGN}) 

    set(${out_list_options} "" PARENT_SCOPE)
    set(${out_list_definitions} "" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_compile)
