function(add_test_executable_dir_get_target_name path out_target_name)
    
    string(CONCAT one_options "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_name "" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(${out_target_name} "${add_test_executable_dir_get_target_name_NAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_target_name)
