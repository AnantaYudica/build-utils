function(add_test_executable_dir_get_target_compile out_list_def out_list_option)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_compile "" 
        "${one_options}" "DEFAULT_LIST_DEF;DEFAULT_LIST_OPTION;ARGS" ${ARGN}) 

    set(default_list_def ${add_test_executable_dir_get_target_compile_DEFAULT_LIST_DEF})
    set(default_list_option ${add_test_executable_dir_get_target_compile_DEFAULT_LIST_OPTION})

    set(${out_list_def} "${default_list_def}" PARENT_SCOPE)
    set(${out_list_option} "${default_list_option}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_compile)
