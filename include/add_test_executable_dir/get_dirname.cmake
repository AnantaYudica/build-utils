function(add_test_executable_dir_get_dirname output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;DIRNAME;NAME;TAG"
        "CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_dirname "" 
        "${one_options}" "ARGS" ${ARGN}) 

    set(${output} "${add_test_executable_dir_get_dirname_DIRNAME}" PARENT_SCOPE)

endfunction(add_test_executable_dir_get_dirname)
