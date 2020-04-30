function(add_test_executable_dir_get_test_command path out_list_arg)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_test_command "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_ARG" ${ARGN}) 

    set(${out_list_arg} "${add_test_executable_dir_get_test_command_DEFAULT_LIST_ARG}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_test_command)
