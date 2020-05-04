function(get_test_source_dir_condition output)
    string(CONCAT one_options "BASE_DIR;PATH;RELATIVE_PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR") 
    cmake_parse_arguments(get_test_source_dir_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 
    
    set(is_case_sensitive FALSE)
    if (NOT "${get_test_source_dir_condition_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${get_test_source_dir_condition_CASE_SENSITIVE})
    endif()
    
    cmake_parse_arguments(args "" "name;relative_path_regex" "" ${get_test_source_dir_condition_ARGS})

    set(name "test1.txt")
    if (NOT "${args_name}" STREQUAL "")
        set(name "${args_name}")
    endif() 
    
    set(filename "${get_test_source_dir_condition_FILENAME}")
    if(NOT is_case_sensitive)
        string(TOLOWER "${filename}" filename)
        string(TOLOWER "${name}" name)
    endif()

    set(regex "^[^b]*$")
    if (NOT "${args_relative_path_regex}" STREQUAL "")
        set(regex "${args_relative_path_regex}")
    endif()

    if ("${filename}" STREQUAL "${name}" 
        AND ("${get_test_source_dir_condition_RELATIVE_PATH}" MATCHES "${regex}"))
        
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(get_test_source_dir_condition)
