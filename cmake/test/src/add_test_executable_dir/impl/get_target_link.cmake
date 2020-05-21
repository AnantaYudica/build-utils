function(add_test_executable_dir_get_target_link out_list_link_arg)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR;"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_link "" 
        "${one_options}" "ARGS;DEFAULT_LIST_ARG" ${ARGN}) 
    cmake_parse_arguments(args "" "" "PREFIX_LIST_LINK_ARG" 
        ${add_test_executable_dir_get_target_link_ARGS})

    set(default_list_arg ${add_test_executable_dir_get_target_link_DEFAULT_LIST_ARG})
    set(prefix_list_arg ${args_PREFIX_LIST_LINK_ARG})

    if (NOT "${prefix_list_arg}" STREQUAL "")
        set(list_arg ${prefix_list_arg})
    else()
        set(list_arg "")
    endif()

    list(APPEND list_arg ${default_list_arg})

    set(${out_list_link_arg} "${list_arg}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_link)
