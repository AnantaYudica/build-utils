function(add_test_executable_dir_src_condition output)

    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR;NAME;TAG;EXT") 
    cmake_parse_arguments(add_test_executable_dir_src_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 
    cmake_parse_arguments(args "" "" "SRC_NAME_REGEX" 
        ${add_test_executable_dir_src_condition_ARGS}) 

    set(filename ${add_test_executable_dir_src_condition_FILENAME})

    set(res FALSE)
    if ("${filename}" MATCHES "${args_SRC_NAME_REGEX}")
        set(res TRUE)
    endif()

    set(${output} ${res} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_src_condition)
