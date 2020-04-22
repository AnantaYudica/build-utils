function(get_test_source_dir_filter path output)
    cmake_parse_arguments(get_test_source_dir_filter "CASE_SENSITIVE" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(get_test_source_dir_filter)

