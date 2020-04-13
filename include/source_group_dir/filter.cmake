function(source_group_dir_filter path output)
    cmake_parse_arguments(source_group_dir_filter "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_filter)
