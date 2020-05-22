function(add_test_executable_dir_get_header header_dir output_list_path)
    string(CONCAT one_options "TARGET_NAME;TARGET_DIR"
        ";BASE_DIR;PATH;RELATIVE_PATH;FILENAME;NAME;TAG;EXT"
        ";CURR_DIR;RELATIVE_CURR_DIR;CURR_DIRNAME;CONDITION;FILTER;INCLUDE_DIR"
        ";GET_NAME;GET_TAG;TAG_CONDITION;TAG_DELIMITER")
    string(CONCAT list_options "HEADER_FILTER_ARGS;HEADER_CONDITION_ARGS;ARGS")

    cmake_parse_arguments(add_test_executable_dir_get_header 
        "RECURSIVE;CASE_SENSITIVE" 
        "${one_options}" "${list_options}" ${ARGN}) 
    
    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${add_test_executable_dir_get_header_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${add_test_executable_dir_get_header_INCLUDE_DIR}")
    endif()

    set(recursive_arg "")
    if(NOT "${add_test_executable_dir_get_header_RECURSIVE}" STREQUAL ""
        AND (add_test_executable_dir_get_header_RECURSIVE))

        set(recursive_arg "RECURSIVE")
    endif()

    set(case_sensitive_arg "")
    if(NOT "${add_test_executable_dir_get_header_CASE_SENSITIVE}" STREQUAL ""
        AND (add_test_executable_dir_get_header_CASE_SENSITIVE))

        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(include_dir ${base_dir})
    set(condition ${base_dir}/add_test_executable_dir/get_test_source_dir/condition.cmake)
    set(filter ${base_dir}/add_test_executable_dir/get_test_source_dir/filter.cmake)
    set(get_name ${add_test_executable_dir_get_header_GET_NAME})
    set(get_tag ${add_test_executable_dir_get_header_GET_TAG})
    set(tag_condition ${add_test_executable_dir_get_header_TAG_CONDITION})
    set(tag_delimiter ${add_test_executable_dir_get_header_TAG_DELIMITER})
    set(header_condition ${add_test_executable_dir_get_header_CONDITION})
    set(header_filter ${add_test_executable_dir_get_header_FILTER})
    set(target_name ${add_test_executable_dir_get_header_TARGET_NAME})
    set(target_dir ${add_test_executable_dir_get_header_TARGET_DIR})
    set(src_path ${add_test_executable_dir_get_header_PATH})
    set(src_base_dir ${add_test_executable_dir_get_header_BASE_DIR})
    set(src_relative_path ${add_test_executable_dir_get_header_RELATIVE_PATH})
    set(src_filename ${add_test_executable_dir_get_header_FILENAME})
    set(src_name ${add_test_executable_dir_get_header_NAME})
    set(src_tag ${add_test_executable_dir_get_header_TAG})
    set(src_ext ${add_test_executable_dir_get_header_EXT})
    set(src_curr_dir ${add_test_executable_dir_get_header_CURR_DIR})
    set(src_relative_curr_dir ${dd_test_executable_dir_get_header_RELATIVE_CURR_DIR})
    set(src_curr_dirname ${add_test_executable_dir_get_header_CURR_DIRNAME})
    set(header_filter_args ${add_test_executable_dir_get_header_HEADER_FILTER_ARGS})
    set(header_condition_args ${add_test_executable_dir_get_header_HEADER_CONDITION_ARGS})

    set(args"")
    if(NOT "${target_name}" STREQUAL "")
        list(APPEND args "TARGET_NAME" ${target_name})
    endif()

    if(NOT "${target_dir}" STREQUAL "")
        list(APPEND args "TARGET_DIR" ${target_dir})
    endif()

    if(NOT "${src_path}" STREQUAL "")
        list(APPEND args "SRC_PATH" ${src_path})
    endif()

    if(NOT "${src_base_dir}" STREQUAL "")
        list(APPEND args "SRC_BASE_DIR" ${src_base_dir})
    endif()

    if(NOT "${src_relative_path}" STREQUAL "")
        list(APPEND args "SRC_RELATIVE_PATH" ${src_relative_path})
    endif()
    
    if(NOT "${src_filename}" STREQUAL "")
        list(APPEND args "SRC_FILENAME" ${src_filename})
    endif()

    if(NOT "${src_name}" STREQUAL "")
        list(APPEND args "SRC_NAME" ${src_name})
    endif()

    if(NOT "${src_tag}" STREQUAL "")
        list(APPEND args "SRC_TAG" ${src_tag})
    endif()

    if(NOT "${src_ext}" STREQUAL "")
        list(APPEND args "SRC_EXT" ${src_ext})
    endif()

    if(NOT "${src_curr_dir}" STREQUAL "")
        list(APPEND args "SRC_CURR_DIR" ${src_curr_dir})
    endif()

    if(NOT "${src_relative_curr_dir}" STREQUAL "")
        list(APPEND args "SRC_RELATIVE_CURR_DIR" ${src_relative_curr_dir})
    endif()
    
    if(NOT "${src_curr_dirname}" STREQUAL "")
        list(APPEND args "SRC_CURR_DIRNAME" ${src_curr_dirname})
    endif()

    set(filter_args "${args}")

    if (NOT "${header_filter}" STREQUAL "")
        list(APPEND filter_args "HEADER_FILTER" ${header_filter})
    endif()

    if (NOT "${header_filter_args}" STREQUAL "")
        list(APPEND filter_args "HEADER_FILTER_ARGS" ${header_filter_args})
    endif()

    set(condition_args "${args}")
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
