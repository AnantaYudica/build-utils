function(add_test_executable_dir_get_header header_dir output_list_path)
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;CONDITION;FILTER;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER")
    string(CONCAT list_options "HEADER_FILTER_ARGS;HEADER_CONDITION_ARGS;ARGS")

    cmake_parse_arguments(add_test_executable_dir_get_header 
        "RECURSIVE;CASE_SENSITIVE" 
        "${one_options}" "${list_options}" ${ARGN}) 

    cmake_parse_arguments(args "" "" 
        "LIST_HEADER_PATH" ${add_test_executable_dir_get_header_ARGS})
    
    set(${output_list_path} ${args_LIST_HEADER_PATH} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_header)
