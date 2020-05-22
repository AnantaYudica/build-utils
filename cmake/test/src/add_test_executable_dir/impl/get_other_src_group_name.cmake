function(add_test_executable_dir_get_other_src_group_name output_group_name)
    string(CONCAT one_option "PREFIX;PATH;BASE_DIR"
        ";FILENAME;CURR_DIR;CURR_DIRNAME"
        ";SRC_BASE_DIR;SRC_PATH;SRC_RELATIVE_PATH;SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT"
        ";SRC_CURR_DIR;SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME;INCLUDE_DIR"
        ";TARGET_NAME;TARGET_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_other_src_group_name "" 
        "${one_option}" "ARGS" ${ARGN}) 
    cmake_parse_arguments(args "UPPER" "" "" 
        ${add_test_executable_dir_get_other_src_group_name_ARGS})

    if (args_UPPER)
        string(TOUPPER "${add_test_executable_dir_get_other_src_group_name_PREFIX}" prefix)
    else()
        set(prefix ${add_test_executable_dir_get_other_src_group_name_PREFIX})
    endif()

    set(${output_group_name} ${prefix} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_other_src_group_name)
