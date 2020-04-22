function(source_group_dir_get_prefix_name path current_prefix_name prefix_name)
    cmake_parse_arguments(source_group_dir_get_prefix_name "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 
    
    set(filename "${source_group_dir_get_prefix_name_FILENAME}")
    
    set(${prefix_name} "${current_prefix_name}/${filename}" PARENT_SCOPE)
    
endfunction(source_group_dir_get_prefix_name)

