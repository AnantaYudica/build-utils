function(add_test_executable_dir_get_target_include path out_list_directory)
    
    cmake_parse_arguments(add_test_executable_dir_get_target_include "" 
        "DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR;TARGET_NAME" 
        "ARGS" ${ARGN}) 

    set(${out_list_directory} "" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_include)
