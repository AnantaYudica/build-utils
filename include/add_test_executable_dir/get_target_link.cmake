function(add_test_executable_dir_get_target_link out_list_lib)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR;"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_link "" 
        "${one_options}" "ARGS;DEFAULT_LIST_LIB" ${ARGN}) 

    set(default_list_lib ${add_test_executable_dir_get_target_link_DEFAULT_LIST_LIB})

    set(${out_list_lib} "${default_list_lib}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_link)
