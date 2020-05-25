function(add_test_executable_dir_src_filter cond)
    
    string(CONCAT one_options "LEVEL;BASE_DIR;PATH;RELATIVE_PATH;FILENAME;DIRNAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR;NAME;TAG;EXT")
    cmake_parse_arguments(add_test_executable_dir_src_filter 
        "CASE_SENSITIVE;DIRECTORY" "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "" "LIST_EXT" 
        ${add_test_executable_dir_src_filter_ARGS}) 

    set(is_directory ${add_test_executable_dir_src_filter_DIRECTORY})
    set(is_case_sensitive ${add_test_executable_dir_src_filter_CASE_SENSITIVE})
    set(list_ext ${args_LIST_EXT})

    if (NOT "${EMPTY}${list_ext}" STREQUAL "${EMPTY}" AND (NOT is_directory))
        set(result FALSE)

        if(is_case_sensitive)
            set(ext "${add_test_executable_dir_src_filter_EXT}")
        else()
            string(TOLOWER "${add_test_executable_dir_src_filter_EXT}" ext)
        endif()

        foreach(it ${list_ext})
            if ("${EMPTY}${ext}" STREQUAL "${EMPTY}${it}")
                set(result TRUE) 
                break()
            endif()
        endforeach(it)
    else()
        set(result TRUE)
    endif()

    set(${cond} ${result} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_src_filter)
