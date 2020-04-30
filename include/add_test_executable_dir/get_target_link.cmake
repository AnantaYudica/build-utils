function(add_test_executable_dir_get_target_link path out_list_lib)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR;"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_link "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_LIB" ${ARGN}) 

    set(${out_list_lib} "${add_test_executable_dir_get_target_link_DEFAULT_LIST_LIB}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_link)
