function(source_group_dir_condition path output)
    cmake_parse_arguments(source_group_dir_condition "" 
        "BASE_DIR;RELATIVE_PATH;FILENAME" "ARGS" ${ARGN}) 

    cmake_parse_arguments(args "" "name;relative_path_regex" "" ${source_group_dir_condition_ARGS})

    set(name "test1.txt")
    if (NOT "${args_name}" STREQUAL "")
        set(name "${args_name}")
    endif()

    set(regex "^[^b]*$")
    if (NOT "${args_relative_path_regex}" STREQUAL "")
        set(regex "${args_relative_path_regex}")
    endif()

    if ("${source_group_dir_condition_FILENAME}" STREQUAL "${name}"
        AND ("${source_group_dir_condition_RELATIVE_PATH}" MATCHES "${regex}"))
        
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_condition)
