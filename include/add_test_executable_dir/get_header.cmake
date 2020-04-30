function(add_test_executable_dir_get_header path header_dir output_list_path)
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";DIR;RELATIVE_DIR;CONDITION;FILTER;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER")
    string(CONCAT list_options "LIST_TAG;LIST_EXT;FILTER_ARGS;CONDITION_ARGS;ARGS")

    cmake_parse_arguments(add_test_executable_dir_get_header 
        "RECURSIVE;CASE_SENSITIVE" 
        "${one_options}" "${list_options}" ${ARGN}) 
    
    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${add_test_executable_dir_get_header_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${add_test_executable_dir_get_header_INCLUDE_DIR}")
    endif()

    set(recursive_arg "")
    if(NOT "${add_test_executable_dir_get_header_RECURSIVE}" STREQUAL "")
        set(recursive_arg "RECURSIVE")
    endif()

    set(case_sensitive_arg "")
    if(NOT "${add_test_executable_dir_get_header_CASE_SENSITIVE}" STREQUAL "")
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(include_dir ${add_test_executable_dir_get_header_INCLUDE_DIR})
    set(condition ${base_dir}/add_test_executable_dir/get_test_source_dir/condition.cmake)
    set(filter ${base_dir}/add_test_executable_dir/get_test_source_dir/filter.cmake)
    set(list_ext ${add_test_executable_dir_get_header_LIST_EXT})
    set(get_name ${add_test_executable_dir_get_header_GET_NAME})
    set(get_tag ${add_test_executable_dir_get_header_GET_TAG})
    set(tag_condition ${add_test_executable_dir_get_header_TAG_CONDITION})
    set(tag_delimiter ${add_test_executable_dir_get_header_TAG_DELIMITER})
    set(list_tag ${add_test_executable_dir_get_header_LIST_TAG})
    set(header_condition ${add_test_executable_dir_get_header_CONDITION})
    set(header_filter ${add_test_executable_dir_get_header_FILTER})
    set(target_name ${add_test_executable_dir_get_header_TARGET_NAME})
    set(target_dir ${add_test_executable_dir_get_header_TARGET_DIR})
    set(src_name ${add_test_executable_dir_get_header_SRC_NAME})
    set(src_tag ${add_test_executable_dir_get_header_SRC_TAG})
    set(src_ext ${add_test_executable_dir_get_header_SRC_EXT})
    set(src_path ${add_test_executable_dir_get_header_SRC_PATH})
    set(src_base_dir ${add_test_executable_dir_get_header_SRC_BASE_DIR})
    set(header_filter_args ${add_test_executable_dir_get_header_FILTER_ARGS})
    set(header_condition_args ${add_test_executable_dir_get_header_CONDITION_ARGS})

    set(arg "")
    if(NOT "${target_name}" STREQUAL "")
        list(APPEND arg "TARGET_NAME" ${target_name})
    endif()

    if(NOT "${target_dir}" STREQUAL "")
        list(APPEND arg "TARGET_DIR" ${target_dir})
    endif()

    if(NOT "${src_name}" STREQUAL "")
        list(APPEND arg "SRC_NAME" ${src_name})
    endif()

    if(NOT "${src_tag}" STREQUAL "")
        list(APPEND arg "SRC_TAG" ${src_tag})
    endif()

    if(NOT "${src_ext}" STREQUAL "")
        list(APPEND arg "SRC_EXT" ${src_ext})
    endif()

    if(NOT "${src_path}" STREQUAL "")
        list(APPEND arg "SRC_PATH" ${src_path})
    endif()

    if(NOT "${src_base_dir}" STREQUAL "")
        list(APPEND arg "SRC_BASE_DIR" ${src_base_dir})
    endif()

    set(filter_args "${arg}")
    if(NOT "${list_ext}" STREQUAL "")
        list(APPEND filter_args "LIST_EXT" ${list_ext})
    endif()

    if (NOT "${header_filter}" STREQUAL "")
        list(APPEND filter_args "HEADER_FILTER" ${header_filter})
    endif()

    if (NOT "${header_filter_args}" STREQUAL "")
        list(APPEND filter_args "HEADER_FILTER_ARGS" ${header_filter_args})
    endif()

    set(condition_args "${arg}")
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
    
    if (NOT "${header_condition}" STREQUAL "")
        list(APPEND condition_args "HEADER_CONDITION" ${header_condition})
    endif()

    if (NOT "${list_tag}" STREQUAL "")
        list(APPEND condition_args "LIST_TAG" ${list_tag})
    endif()

    if (NOT "${header_condition_args}" STREQUAL "")
        list(APPEND condition_args "HEADER_CONDITION_ARGS" ${header_condition_args})
    endif()
    
    if (NOT COMMAND get_test_source_dir)
        include_build_util(NAME get_test_source_dir INCLUDE_DIR ${include_dir})
    endif()

    get_test_source_dir(${header_dir} list_path ${recursive_arg} ${case_sensitive_arg}
        FILTER ${filter} CONDITION ${condition} INCLUDE_DIR ${INCLUDE_DIR}
        FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args})

    set(${output_list_path} ${list_path} PARENT_SCOPE)
    
endfunction(add_test_executable_dir_get_header)
