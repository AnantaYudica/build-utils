function(add_test_executable_dir_get_target_properties path out_args)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_properties "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR;TARGET_NAME" 
        "ARGS" ${ARGN}) 

    set(${out_args} "" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_properties)
