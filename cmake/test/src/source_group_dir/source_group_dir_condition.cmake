function(source_group_dir_condition output)
    string(CONCAT one_options "BASE_DIR;RELATIVE_PATH;PATH;FILENAME"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;INCLUDE_DIR")
    cmake_parse_arguments(source_group_dir_condition "CASE_SENSITIVE" 
        "${one_options}" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "name;relative_path_regex" "" ${source_group_dir_condition_ARGS})

    set(is_case_sensitive FALSE)
    if (NOT "${EMPTY}${source_group_dir_condition_CASE_SENSITIVE}" STREQUAL "${EMPTY}")
        set(is_case_sensitive ${source_group_dir_condition_CASE_SENSITIVE})
    endif()

    set(name "test1.txt")
    if (NOT "${EMPTY}${args_name}" STREQUAL "${EMPTY}")
        set(name "${args_name}")
    endif()

    set(filename "${source_group_dir_condition_FILENAME}")
    if(NOT is_case_sensitive)
        string(TOLOWER "${filename}" filename)
        string(TOLOWER "${name}" name)
    endif()

    set(regex "^[^b]*$")
    if (NOT "${EMPTY}${args_relative_path_regex}" STREQUAL "${EMPTY}")
        set(regex "${args_relative_path_regex}")
    endif()

    if ("${filename}" STREQUAL "${name}" 
        AND ("${source_group_dir_condition_RELATIVE_PATH}" MATCHES "${regex}"))
        
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_condition)
