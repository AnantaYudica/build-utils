function(add_test_executable_dir_get_target_include out_list_include_dir_arg)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_include "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_ARG" ${ARGN}) 

    set(default_list_arg ${add_test_executable_dir_get_target_include_DEFAULT_LIST_ARG})

    set(${out_list_include_dir_arg} "${default_list_arg}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_include)
