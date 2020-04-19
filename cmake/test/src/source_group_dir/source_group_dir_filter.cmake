function(source_group_dir_filter path output)
    cmake_parse_arguments(source_group_dir_filter "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;NAME" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "level" "" ${source_group_dir_filter_ARGS})
    
    set(level 2)
    if (NOT "${args_level}" STREQUAL "")
        set(level ${args_level})
    endif()

    if (${source_group_dir_filter_LEVEL} LESS ${level})
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_filter)
