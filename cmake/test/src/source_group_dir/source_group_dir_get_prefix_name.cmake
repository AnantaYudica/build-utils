function(source_group_dir_get_prefix_name current_prefix_name prefix_name)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(source_group_dir_get_prefix_name "" 
        "${one_options}" "ARGS" ${ARGN}) 
    
    set(dirname "${source_group_dir_get_prefix_name_DIRNAME}")

    cmake_parse_arguments(args "" "delimiter" "" 
        ${source_group_dir_get_prefix_name_ARGS}) 

    set(delim "\\")
    if (NOT "${EMPTY}${args_delimiter}" STREQUAL "${EMPTY}")
        set(delim "${args_delimiter}")
    endif()
    
    set(${prefix_name} "${current_prefix_name}${delim}${dirname}" PARENT_SCOPE)
    
endfunction(source_group_dir_get_prefix_name)

