function(add_test_executable_dir_get_target_name out_target_name)
    
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_name "" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(name ${add_test_executable_dir_get_target_name_NAME})

    set(${out_target_name} "${name}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_target_name)
