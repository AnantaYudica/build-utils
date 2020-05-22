function(add_test_executable_dir_header_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME")
    cmake_parse_arguments(add_test_executable_dir_header_filter "DIRECTORY;CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 
    cmake_parse_arguments(args "" "" "HEADER_NAME_REGEX" 
        ${add_test_executable_dir_header_filter_ARGS}) 

    set(filename ${add_test_executable_dir_header_filter_FILENAME})

    set(res FALSE)
    if ("${filename}" MATCHES "${args_HEADER_NAME_REGEX}")
        set(res TRUE)
    endif()

    set(${output} ${res} PARENT_SCOPE)
     
endfunction(add_test_executable_dir_header_filter)