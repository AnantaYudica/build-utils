function(source_group_dir_condition path output)
    cmake_parse_arguments(get_test_target_name_set_name "" 
        "BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_condition)
