function(add_test_executable_dir_src_filter cond)
    
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR;NAME;TAG;EXT")
    cmake_parse_arguments(add_test_executable_dir_src_filter 
        "CASE_SENSITIVE;DIRECTORY" "${one_options}" "ARGS" ${ARGN}) 
    cmake_parse_arguments(args "" "" "SRC_NAME_REGEX" 
        ${add_test_executable_dir_src_filter_ARGS}) 
    
    set(filename ${add_test_executable_dir_src_filter_FILENAME})
    
    if (add_test_executable_dir_src_filter_DIRECTORY)
        set(res TRUE)
    else()
        set(res FALSE)
        if ("${filename}" MATCHES "${args_SRC_NAME_REGEX}")
            set(res TRUE)
        endif()
    endif()

    set(${cond} ${res} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_src_filter)