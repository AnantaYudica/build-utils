function(add_test_executable_dir_get_header_group_name output_group_name)
    string(CONCAT one_option "PREFIX;PATH;BASE_DIR"
        ";RELATIVE_PATH;FILENAME;CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME"
        ";SRC_BASE_DIR;SRC_PATH;SRC_RELATIVE_PATH;SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT"
        ";SRC_CURR_DIR;SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME;INCLUDE_DIR"
        ";TARGET_NAME;TARGET_DIR")
    cmake_parse_arguments(add_test_executable_dir_get_header_group_name "" 
        "${one_option}" "ARGS" ${ARGN}) 

    set(prefix ${add_test_executable_dir_get_header_group_name_PREFIX})
    set(relative_curr_dir ${add_test_executable_dir_get_header_group_name_RELATIVE_CURR_DIR})
    string(REPLACE "/" "\\" relative_curr_dir "${relative_curr_dir}")

    if (NOT "${EMPTY}${prefix}" STREQUAL "${EMPTY}")
        if (NOT "${EMPTY}${relative_curr_dir}" STREQUAL "${EMPTY}")
            set(${output_group_name} "${prefix}\\${relative_curr_dir}" PARENT_SCOPE)
        else()
            set(${output_group_name} ${prefix} PARENT_SCOPE)
        endif()
    else()
        set(${output_group_name} ${relative_curr_dir} PARENT_SCOPE)
    endif()

endfunction(add_test_executable_dir_get_header_group_name)