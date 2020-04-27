function(add_test_executable_dir_get_target_link path out_libraries)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_name "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR;TARGET_NAME" 
        "ARGS" ${ARGN}) 

    set(${out_libraries} "" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_link)
