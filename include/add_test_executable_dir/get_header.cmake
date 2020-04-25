function(add_test_executable_dir_get_header path header_dir output_list_path)
    string(CONCAT one_options "TARGET_NAME;DIR;BASE_DIR;RELATIVE_PATH;FILENAME"
        ";NAME;TAG;EXT;CONDITION;FILTER;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER")
    string(CONCAT list_options "LIST_TAG;LIST_EXT;ARGS")

    cmake_parse_arguments(add_test_executable_dir_get_header 
        "RECURSIVE;CASE_SENSITIVE" 
        "${one_options}" "${list_options}" ${ARGN}) 

    set(recursive_arg "")
    if(NOT "${add_test_executable_dir_get_header_RECURSIVE}" STREQUAL "")
        set(recursive_arg "RECURSIVE")
    endif()

    set(case_sensitive_arg "")
    if(NOT "${add_test_executable_dir_get_header_CASE_SENSITIVE}" STREQUAL "")
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(include_dir ${add_test_executable_dir_get_header_INCLUDE_DIR})
    set(condition ${add_test_executable_dir_get_header_CONDITION})
    set(filter ${add_test_executable_dir_get_header_FILTER})
    set(list_ext ${add_test_executable_dir_get_header_LIST_EXT})
    set(get_name ${add_test_executable_dir_get_header_GET_NAME})
    set(get_tag ${add_test_executable_dir_get_header_GET_TAG})
    set(tag_condition ${add_test_executable_dir_get_header_TAG_CONDITION})
    set(tag_delimiter ${add_test_executable_dir_get_header_TAG_DELIMITER})
    set(list_tag ${add_test_executable_dir_get_header_LIST_TAG})

    set(filter_args "")
    if(NOT "${list_ext}" STREQUAL "")
        list(APPEND filter_args "LIST_EXT" ${list_ext})
    endif()

    set(condition_args "")
    if (NOT "${get_name}" STREQUAL "")
        list(APPEND condition_args "GET_NAME" ${get_name})
    endif()

    if (NOT "${get_tag}" STREQUAL "")
        list(APPEND condition_args "GET_TAG" ${get_tag})
    endif()

    if (NOT "${tag_condition}" STREQUAL "")
        list(APPEND condition_args "TAG_CONDITION" ${tag_condition})
    endif()

    if (NOT "${tag_delimiter}" STREQUAL "")
        list(APPEND condition_args "TAG_DELIMITER" ${tag_delimiter})
    endif()

    if (NOT "${list_tag}" STREQUAL "")
        list(APPEND condition_args "LIST_TAG" ${list_tag})
    endif()
    
    if (NOT COMMAND get_test_source_dir)
        include_build_util(NAME get_test_source_dir INCLUDE_DIR ${include_dir})
    endif()

    get_test_source_dir(${header_dir} list_path ${recursive_arg} ${case_sensitive_arg}
        FILTER ${filter} CONDITION ${condition} INCLUDE_DIR ${INCLUDE_DIR}
        FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args})

    set(${output_list_path} ${list_path} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_header)
