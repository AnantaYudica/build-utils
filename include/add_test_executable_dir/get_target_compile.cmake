function(add_test_executable_dir_get_target_compile path out_list_definition
    out_list_option)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_compile "" 
        "${one_options}"
        "DEFAULT_LIST_DEFINITION;DEFAULT_LIST_OPTION;ARGS" ${ARGN}) 

    set(${out_list_definition} 
        "${add_test_executable_dir_get_target_compile_DEFAULT_LIST_DEFINITION}" PARENT_SCOPE)
    set(${out_list_option} 
        "add_test_executable_dir_get_target_compile_DEFAULT_LIST_OPTION" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_compile)
