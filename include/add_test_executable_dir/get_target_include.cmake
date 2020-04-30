function(add_test_executable_dir_get_target_include path out_list_dir)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR"
    cmake_parse_arguments(add_test_executable_dir_get_target_include "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_DIR" ${ARGN}) 

    set(${out_list_dir} "add_test_executable_dir_get_target_include_DEFAULT_LIST_DIR" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_include)
