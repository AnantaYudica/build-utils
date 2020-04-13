function(source_group_dir_filter path output)
    cmake_parse_arguments(get_test_target_name_set_name "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_filter)
