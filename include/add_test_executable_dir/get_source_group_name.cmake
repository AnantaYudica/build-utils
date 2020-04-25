function(add_test_executable_dir_get_source_group_name path out_name)
    string(CONCAT one_option "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";INCLUDE_DIR;SOURCE_GROUP_NAME;TARGET_NAME")
    cmake_parse_arguments(add_test_executable_dir_get_source_group_name "" 
        "${one_option}" "ARGS" ${ARGN}) 

    set(${out_name} "${add_test_executable_dir_get_source_group_name_SOURCE_GROUP_NAME}" PARENT_SCOPE)
    
endfunction()