function(add_test_executable_dir_get_target_name out_target_name)
    
    string(CONCAT one_options "PREFIX;PREFIX_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_name "" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(prefix ${add_test_executable_dir_get_target_name_PREFIX})
    set(name ${add_test_executable_dir_get_target_name_NAME})

    set(${out_target_name} "${prefix}${name}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_target_name)
