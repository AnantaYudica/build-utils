function(add_test_executable_dir_get_target_include out_list_dir)
    
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_target_include "" 
        "${one_options}" 
        "ARGS;DEFAULT_LIST_DIR" ${ARGN}) 
    cmake_parse_arguments(args "" "INCLUDE_BASE_DIR" "" 
        ${add_test_executable_dir_get_target_include_ARGS})
    
    set(default_list_dir ${add_test_executable_dir_get_target_include_DEFAULT_LIST_DIR})
    set(list_dir "")
    foreach(it ${default_list_dir})
        if (NOT "${args_INCLUDE_BASE_DIR}" STREQUAL "" 
            AND (EXISTS ${args_INCLUDE_BASE_DIR}/${it}))

            list(APPEND list_dir "${args_INCLUDE_BASE_DIR}/${it}")
        else()
            list(APPEND list_dir ${it})
        endif()
        
    endforeach(it)

    set(${out_list_dir} "${list_dir}" PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_target_include)
