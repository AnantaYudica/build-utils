function(get_test_source_dir_filter path output)
    cmake_parse_arguments(get_test_source_dir_filter "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(get_test_source_dir_filter)

