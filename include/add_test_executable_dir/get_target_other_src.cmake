function(add_test_executable_dir_get_target_other_src out_list_src)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_other_src "" 
        "${one_options}" "ARGS;DEFAULT_LIST" ${ARGN}) 

    set(default_list_src ${add_test_executable_dir_get_target_other_src_DEFAULT_LIST})

    set(${out_list_src} "${default_list_src}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_other_src)
