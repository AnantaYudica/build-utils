
function(add_test_executable_dir_main_src_condition path cond)
    
    cmake_parse_arguments(add_test_executable_dir_main_src_condition "CASE_SENSITIVE" 
        "BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT;INCLUDE_DIR" 
        "LIST_TAG;ARGS" ${ARGN}) 

    set(list_tag ${add_test_executable_dir_main_src_condition_LIST_TAG})
    set(tag "${add_test_executable_dir_main_src_condition_TAG}")

    set(is_case_sensitive FALSE)
    if (NOT "${add_test_executable_dir_main_src_condition_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${add_test_executable_dir_main_src_condition_CASE_SENSITIVE})
    endif()

    set(result FALSE)
    if (NOT "${list_tag}" STREQUAL "")
        foreach(it ${list_tag})
            if(NOT is_case_sensitive)
                string(TOLOWER "${tag}" tag)
            endif()

            if ("${it}" STREQUAL "${tag}")
                set(result TRUE)
                break()
            endif()
        endforeach(it)
    endif()

    set(${cond} ${result} PARENT_SCOPE)

endfunction(add_test_executable_dir_main_src_condition)
