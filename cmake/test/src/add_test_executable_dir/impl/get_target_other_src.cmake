function(add_test_executable_dir_get_target_other_src out_list_src)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_other_src "" 
        "${one_options}" "ARGS;DEFAULT_LIST" ${ARGN}) 
    cmake_parse_arguments(args "" "" "LIST_OTHER_SRC_INDEX" 
        ${add_test_executable_dir_get_target_other_src_ARGS}) 

    set(default_list_src ${add_test_executable_dir_get_target_other_src_DEFAULT_LIST})

    set(list_src "")
    if (NOT "${args_LIST_OTHER_SRC_INDEX}" STREQUAL "")
        foreach(it ${args_LIST_OTHER_SRC_INDEX})
            list(GET default_list_src ${it} src)
            list(APPEND list_src ${src})
        endforeach(it)
    endif()

    set(${out_list_src} "${list_src}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_other_src)
