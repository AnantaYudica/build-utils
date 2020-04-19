function(source_group_dir_condition path output)
    cmake_parse_arguments(source_group_dir_condition "" 
        "BASE_DIR;RELATIVE_PATH;NAME" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_condition)
