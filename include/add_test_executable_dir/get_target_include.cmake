function(add_test_executable_dir_get_target_include out_list_dir)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_include "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_DIR" ${ARGN}) 

    set(default_list_dir ${add_test_executable_dir_get_target_include_DEFAULT_LIST_DIR})

    set(${out_list_dir} "${default_list_dir}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_include)
