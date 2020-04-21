function(get_test_source_dir_filter path output)
    cmake_parse_arguments(get_test_source_dir_filter "" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;INCLUDE_DIR" "ARGS" ${ARGN}) 

    set(filename "${get_test_source_dir_filter_FILENAME}")
    
    cmake_parse_arguments(args "" "" "LIST_EXT")

    set(list_ext ${args_LIST_EXT})

    get_filename_component(filename_ext ${it} EXT)

    string(TOLOWER filename_ext "${filename_ext}")

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

