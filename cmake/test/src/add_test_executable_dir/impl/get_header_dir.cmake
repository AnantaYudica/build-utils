function(add_test_executable_dir_get_header_dir header_dir)
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR;BASE_HEADER_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    string(CONCAT list_options "ARGS")
    cmake_parse_arguments(add_test_executable_dir_get_header_dir "" 
        "${one_options}" "${list_options}" ${ARGN}) 
    
    cmake_parse_arguments(args "" "INDEX" "LIST_HEADER_DIR" 
        ${add_test_executable_dir_get_header_dir_ARGS})

    set(dir ${add_test_executable_dir_get_header_dir_CURR_DIR})

    if (NOT "${args_LIST_HEADER_DIR}" STREQUAL "")
        set(relative_dir ${add_test_executable_dir_get_header_dir_RELATIVE_CURR_DIR})
        list(GET args_LIST_HEADER_DIR ${args_INDEX} base_header_dir)
        get_filename_component(current_header_dir "${base_header_dir}/${relative_dir}" ABSOLUTE)
        set(${header_dir} ${current_header_dir} PARENT_SCOPE)
    else()
        set(${header_dir} ${dir} PARENT_SCOPE)
    endif()
    
endfunction(add_test_executable_dir_get_header_dir)
