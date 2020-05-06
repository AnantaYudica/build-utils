function(add_test_executable_dir_get_target_properties out_list_property)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_properties "" 
        "${one_options}" "ARGS;DEFAULT_LIST_PROPERTY" ${ARGN}) 

    set(default_list_property ${add_test_executable_dir_get_target_properties_DEFAULT_LIST_PROPERTY})

    set(${out_list_property} "${default_list_property}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_properties)
