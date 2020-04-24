function(add_test_executable_dir_filter path cond)
    
    cmake_parse_arguments(add_test_executable_dir_filter "CASE_SENSITIVE" 
        "LEVEL;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG:EXT;INCLUDE_DIR" 
        "LIST_EXT" ${ARGN}) 

    set(is_case_sensitive ${add_test_executable_dir_filter_CASE_SENSITIVE})
    set(list_ext ${add_test_executable_dir_filter_LIST_EXT})

    if (NOT ${list_ext} STREQUAL "")
        set(result FALSE)

        if(is_case_sensitive)
            set(ext "${add_test_executable_dir_filter_EXT}")
        else()
            string(TOLOWER "${add_test_executable_dir_filter_EXT}" ext)
        endif()

        foreach(it ${list_ext})
            if ("${ext}" STREQUAL "${it}")
                set(result TRUE) 
                break()
            endif()
        endforeach(it)
    else()
        set(result TRUE)
    endif()

    set(${cond} ${result} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_filter)
