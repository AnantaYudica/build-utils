function(add_test_executable_dir_get_target_other_src path out_list_src)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_other_src "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_SRC" ${ARGN}) 

    set(${out_list_src} "${add_test_executable_dir_get_target_other_src_DEFAULT_LIST_SRC}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_other_src)
