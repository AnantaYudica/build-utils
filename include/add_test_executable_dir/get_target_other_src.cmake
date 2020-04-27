function(add_test_executable_dir_get_target_other_src path out_list_src)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_other_src "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR;TARGET_NAME" 
        "ARGS" ${ARGN}) 

    set(${out_list_src} "" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_other_src)
