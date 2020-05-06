function(add_test_executable_dir_header_condition output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME") 
    cmake_parse_arguments(add_test_executable_dir_header_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(${output} FALSE PARENT_SCOPE)

endfunction(add_test_executable_dir_header_condition)
