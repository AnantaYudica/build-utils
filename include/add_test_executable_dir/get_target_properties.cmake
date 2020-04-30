function(add_test_executable_dir_get_target_properties path out_list_property)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_properties "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_PROPERTY" ${ARGN}) 

    set(${out_list_property} "${add_test_executable_dir_get_target_properties_DEFAULT_LIST_PROPERTY}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_properties)
