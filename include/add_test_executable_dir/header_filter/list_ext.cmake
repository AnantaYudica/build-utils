function(add_test_executable_dir_header_filter output)
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR"
        ";TARGET_NAME;TARGET_DIR;SRC_PATH;SRC_BASE_DIR;SRC_RELATIVE_PATH"
        ";SRC_FILENAME;SRC_NAME;SRC_TAG;SRC_EXT;SRC_CURR_DIR"
        ";SRC_RELATIVE_CURR_DIR;SRC_CURR_DIRNAME")
    cmake_parse_arguments(add_test_executable_dir_header_filter "DIRECTORY;CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "" "LIST_EXT"
        ${add_test_executable_dir_header_filter_ARGS})

    set(filename "${add_test_executable_dir_header_filter_FILENAME}")

    set(is_directory FALSE)
    if (NOT "${add_test_executable_dir_header_filter_CASE_SENSITIVE}" STREQUAL "")
        set(is_directory ${add_test_executable_dir_header_filter_DIRECTORY})
    endif()
    
    set(is_case_sensitive FALSE)
    if (NOT "${add_test_executable_dir_header_filter_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${add_test_executable_dir_header_filter_CASE_SENSITIVE})
    endif()

    set(list_ext ${args_LIST_EXT})

    set(result FALSE)
    if (NOT "${list_ext}" STREQUAL "" AND (NOT is_directory))
    
        set(filename ${add_test_executable_dir_header_filter_FILENAME})
        
        if (NOT COMMAND get_test_name_tag_ext_file)
            include_build_util(NAME get_test_name_tag_ext_file INCLUDE_DIR ${include_dir})
        endif()
        
        get_test_name_tag_ext_file("${filename}" EXT filename_ext 
            INCLUDE_DIR ${INCLUDE_DIR})

        if (NOT is_case_sensitive)
            string(TOLOWER "${filename_ext}" filename_ext)
        endif()

        foreach(it ${list_ext})
            if ("${filename_ext}" STREQUAL "${it}")
                set(result TRUE)
                break()
            endif()
        endforeach(it)
    else()
        set(result TRUE)
    endif()
    
    set(${output} ${result} PARENT_SCOPE)

endfunction(add_test_executable_dir_header_filter)

