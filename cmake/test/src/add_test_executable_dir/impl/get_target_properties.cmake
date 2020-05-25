function(add_test_executable_dir_get_target_properties out_list_property_arg)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_properties "" 
        "${one_options}" "ARGS;DEFAULT_LIST_ARG" ${ARGN}) 
    cmake_parse_arguments(args "" "" "LIST_PROPERTY_INDEX" 
        ${add_test_executable_dir_get_target_properties_ARGS}) 

    set(default_list_arg ${add_test_executable_dir_get_target_properties_DEFAULT_LIST_ARG})
    
    set(list_arg "")
    if (NOT "${EMPTY}${args_LIST_PROPERTY_INDEX}" STREQUAL "${EMPTY}")
        foreach(it ${args_LIST_PROPERTY_INDEX})
            list(GET default_list_arg ${it} arg)
            list(APPEND list_arg ${arg})
        endforeach(it)
    endif()

    set(${out_list_property_arg} "${list_arg}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_properties)
