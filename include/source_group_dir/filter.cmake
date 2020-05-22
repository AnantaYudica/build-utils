function(source_group_dir_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(source_group_dir_filter "CASE_SENSITIVE;DIRECTORY" 
        "${one_options}" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_filter)
