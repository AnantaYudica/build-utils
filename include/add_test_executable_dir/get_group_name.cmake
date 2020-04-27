function(add_test_executable_dir_get_group_name path)
    string(CONCAT one_option "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";INCLUDE_DIR;DEFAULT_HEADER;DEFAULT_SRC;DEFAULT_OTHER_SRC"
        ";TARGET_NAME;HEADER;SRC;OTHER_SRC")
    cmake_parse_arguments(add_test_executable_dir_get_group_name "" 
        "${one_option}" "ARGS" ${ARGN}) 

    set(default_header ${add_test_executable_dir_get_group_name_DEFAULT_HEADER})
    set(default_src ${add_test_executable_dir_get_group_name_DEFAULT_SRC})
    set(default_other_src ${add_test_executable_dir_get_group_name_DEFAULT_OTHER_SRC})

    set(header ${add_test_executable_dir_get_group_name_HEADER})
    if (NOT "${header}" STREQUAL "")
        set(${header} "${default_header}" PARENT_SCOPE)
    endif()

    set(src ${add_test_executable_dir_get_group_name_SRC})
    if (NOT "${src}" STREQUAL "")
        set(${src} "${default_src}" PARENT_SCOPE)
    endif()

    set(other_src ${add_test_executable_dir_get_group_name_OTHER_SRC})
    if (NOT "${other_src}" STREQUAL "")
        set(${other_src} "${default_other_src}" PARENT_SCOPE)
    endif()
    
endfunction()