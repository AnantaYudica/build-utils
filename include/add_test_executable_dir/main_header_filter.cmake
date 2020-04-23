function(get_test_source_dir_filter path output)
    cmake_parse_arguments(get_test_source_dir_filter "CASE_SENSITIVE" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 

    set(filename "${get_test_source_dir_filter_FILENAME}")
    
    set(is_case_sensitive FALSE)
    if (NOT "${get_test_source_dir_filter_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${get_test_source_dir_filter_CASE_SENSITIVE})
    endif()

    cmake_parse_arguments(args "" "" "LIST_EXT")

    set(list_ext ${args_LIST_EXT})

    get_filename_component(filename_ext ${it} EXT)

    if (NOT is_case_sensitive)
        string(TOLOWER "${filename_ext}" filename_ext)
    endif()

    set(result FALSE)
    if (NOT "${list_ext}" STREQUAL "")
        foreach(it ${list_ext})
            if ("${filename_ext}" STREQUAL "${it}")
                set(result TRUE)
                break()
            endif()
        endforeach(it)
    endif()

    set(${output} ${result} PARENT_SCOPE)

endfunction(get_test_source_dir_filter)

