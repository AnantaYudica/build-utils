
function(add_test_executable_dir_src_condition cond)

    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR") 
    cmake_parse_arguments(add_test_executable_dir_src_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "" "LIST_TAG" 
        ${add_test_executable_dir_src_condition_ARGS}) 

    set(list_tag ${args_LIST_TAG})
    set(tag "${add_test_executable_dir_src_condition_TAG}")

    set(is_case_sensitive FALSE)
    if (NOT "${add_test_executable_dir_src_condition_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${add_test_executable_dir_src_condition_CASE_SENSITIVE})
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
    else()
        set(result TRUE)
    endif()

    set(${cond} ${result} PARENT_SCOPE)

endfunction(add_test_executable_dir_src_condition)
