function(source_group_dir_condition output)
    string(CONCAT one_options "BASE_DIR;RELATIVE_PATH;PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(source_group_dir_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 
    set(${output} TRUE PARENT_SCOPE)
endfunction(source_group_dir_condition)
