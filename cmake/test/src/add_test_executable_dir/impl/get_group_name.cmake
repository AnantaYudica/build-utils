function(add_test_executable_dir_get_group_name)
    string(CONCAT one_option "BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";DEFAULT_HEADER;DEFAULT_SRC;DEFAULT_OTHER_SRC"
        ";TARGET_NAME;TARGET_DIR;HEADER;SRC;OTHER_SRC")
    cmake_parse_arguments(add_test_executable_dir_get_group_name "" 
        "${one_option}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "UPPER" "" "" 
        ${add_test_executable_dir_get_group_name_ARGS})

    if (args_UPPER)
        string(TOUPPER "${add_test_executable_dir_get_group_name_DEFAULT_HEADER}" default_header)
        string(TOUPPER "${add_test_executable_dir_get_group_name_DEFAULT_SRC}" default_src)
        string(TOUPPER "${add_test_executable_dir_get_group_name_DEFAULT_OTHER_SRC}" default_other_src)
    else()
        set(default_header ${add_test_executable_dir_get_group_name_DEFAULT_HEADER})
        set(default_src ${add_test_executable_dir_get_group_name_DEFAULT_SRC})
        set(default_other_src ${add_test_executable_dir_get_group_name_DEFAULT_OTHER_SRC})
    endif()

    set(header ${add_test_executable_dir_get_group_name_HEADER})
    unset("${header}")
    if (NOT "${EMPTY}${header}" STREQUAL "${EMPTY}")
        set(${header} "${default_header}" PARENT_SCOPE)
    endif()

    set(src ${add_test_executable_dir_get_group_name_SRC})
    unset("${src}")
    if (NOT "${EMPTY}${src}" STREQUAL "${EMPTY}")
        set(${src} "${default_src}" PARENT_SCOPE)
    endif()

    set(other_src ${add_test_executable_dir_get_group_name_OTHER_SRC})
    unset("${other_src}")
    if (NOT "${EMPTY}${other_src}" STREQUAL "${EMPTY}")
        set(${other_src} "${default_other_src}" PARENT_SCOPE)
    endif()
    
endfunction()