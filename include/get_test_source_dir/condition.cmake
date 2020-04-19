function(get_test_source_dir_condition path output)
    cmake_parse_arguments(get_test_source_dir_condition "" 
        "BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(get_test_source_dir_condition)