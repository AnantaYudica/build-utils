function(source_group_dir_filter path output)
    cmake_parse_arguments(source_group_dir_filter "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    if (${source_group_dir_filter_LEVEL} LESS 2)
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_filter)
