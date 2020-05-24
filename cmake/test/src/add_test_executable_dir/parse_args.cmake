function(parse_args output_dir output_call_args)
    cmake_parse_arguments(parse_args "" "" "ARGS" ${ARGN}) 

    string(CONCAT bool_options "recursive;case_sensitive")
    
    string(CONCAT one_options "dir;prefix;prefix_dir")

    string(CONCAT one_options "${one_options}" 
        ";get_dirname;get_group_name;get_header_dir;get_header_group_name"
        ";get_header;get_other_src_group_name;get_target_compile"
        ";get_target_dir;get_target_include;get_target_link"
        ";get_target_name;get_target_other_src;get_target_properties"
        ";get_test_cmd_args;header_condition;header_filter;src_condition;src_filter")

    string(CONCAT list_options "get_dirname_args;get_group_name_args"
        ";get_header_dir_args;get_header_group_name_args;get_header_args"
        ";get_other_src_group_name_args;get_target_compile_args"
        ";get_target_dir_args;get_target_include_args;get_target_link_args"
        ";get_target_name_args;get_target_other_src_args"
        ";get_target_properties_args;get_test_cmd_args_args;header_condition_args"
        ";header_filter_args;src_condition_args;src_filter_args")

    string(CONCAT one_options "${one_options}" 
        ";src_get_tag;src_get_name;src_tag_condition;src_tag_delimiter")

    string(CONCAT one_options "${one_options}"
        ";header_get_tag;header_get_name;header_tag_condition;header_tag_delimiter")

    string(CONCAT list_options "${list_options}" 
        ";list_src_ext;list_src_tag")
    string(CONCAT one_options "${one_options}"
        ";src_ext;src_tag")

    string(CONCAT bool_options "${bool_options}"
        ";header_recursive;header_case_sensitive")
    string(CONCAT list_options "${list_options}"
        ";list_header_ext;list_header_tag")
    string(CONCAT one_options "${one_options}"
        ";header_ext;header_tag;base_header_dir")

    string(CONCAT one_options "${one_options}"
        ";header_group_name;src_group_name;other_src_group_name")
    
    string(CONCAT list_options "${list_options}"
        ";list_compile_def_arg;list_compile_option_arg;list_include_dir_arg;list_link_arg"
        ";list_other_src;list_property_arg;list_test_cmd_arg")

    string(CONCAT one_options "${one_options}" 
        ";include_dir")

    cmake_parse_arguments(args "${bool_options}" "${one_options}" 
        "${list_options}" ${parse_args_ARGS}) 

    unset("${output_dir}")
    if (NOT "${EMPTY}${output_dir}" STREQUAL "${EMPTY}" 
        AND (NOT "${EMPTY}${args_dir}" STREQUAL "${EMPTY}"))
        
        set(${output_dir} ${args_dir} PARENT_SCOPE)
    endif()

    set(call_args "")
    if (args_recursive)
        list(APPEND call_args "RECURSIVE")
    endif()

    if (args_case_sensitive)
        list(APPEND call_args "CASE_SENSITIVE")
    endif()

    if (NOT "${EMPTY}${args_prefix}" STREQUAL "${EMPTY}")
        list(APPEND call_args "PREFIX" ${args_prefix})
    endif()

    if (NOT "${EMPTY}${args_prefix_dir}" STREQUAL "${EMPTY}")
        list(APPEND call_args "PREFIX_DIR" ${args_prefix_dir})
    endif()

    if (NOT "${EMPTY}${args_get_dirname}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_DIRNAME" ${args_get_dirname})
    endif()
    
    if (NOT "${EMPTY}${args_get_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_GROUP_NAME" ${args_get_group_name})
    endif()

    if (NOT "${EMPTY}${args_get_header_dir}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER_DIR" ${args_get_header_dir})
    endif()

    if (NOT "${EMPTY}${args_get_header_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER_GROUP_NAME" ${args_get_header_group_name})
    endif()

    if (NOT "${EMPTY}${args_get_header}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER" ${args_get_header})
    endif()

    if (NOT "${EMPTY}${args_get_other_src_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_OTHER_SRC_GROUP_NAME" ${args_get_other_src_group_name})
    endif()

    if (NOT "${EMPTY}${args_get_target_compile}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_COMPILE" ${args_get_target_compile})
    endif()

    if (NOT "${EMPTY}${args_get_target_dir}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_DIR" ${args_get_target_dir})
    endif()

    if (NOT "${EMPTY}${args_get_target_include}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_INCLUDE" ${args_get_target_include})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_link}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_LINK" ${args_get_target_link})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_NAME" ${args_get_target_name})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_other_src}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_OTHER_SRC" ${args_get_target_other_src})
    endif()

    if (NOT "${EMPTY}${args_get_target_properties}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_PROPERTIES" ${args_get_target_properties})
    endif()
    
    if (NOT "${EMPTY}${args_get_test_cmd_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TEST_CMD_ARGS" ${args_get_test_cmd_args})
    endif()
    
    if (NOT "${EMPTY}${args_header_condition}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_CONDITION" ${args_header_condition})
    endif()

    if (NOT "${EMPTY}${args_header_filter}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_FILTER" ${args_header_filter})
    endif()
    
    if (NOT "${EMPTY}${args_src_condition}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_CONDITION" ${args_src_condition})
    endif()
    
    if (NOT "${EMPTY}${args_src_filter}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_FILTER" ${args_src_filter})
    endif()

    if (NOT "${EMPTY}${args_get_dirname_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_DIRNAME_ARGS" ${args_get_dirname_args})
    endif()

    if (NOT "${EMPTY}${args_get_group_name_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_GROUP_NAME_ARGS" ${args_get_group_name_args})
    endif()

    if (NOT "${EMPTY}${args_get_header_dir_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER_DIR_ARGS" ${args_get_header_dir_args})
    endif()

    if (NOT "${EMPTY}${args_get_header_group_name_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER_GROUP_NAME_ARGS" ${args_get_header_group_name_args})
    endif()

    if (NOT "${EMPTY}${args_get_header_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_HEADER_ARGS" ${args_get_header_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_other_src_group_name_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_OTHER_SRC_GROUP_NAME_ARGS" ${args_get_other_src_group_name_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_compile_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_COMPILE_ARGS" ${args_get_target_compile_args})
    endif()

    if (NOT "${EMPTY}${args_get_target_dir_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_DIR_ARGS" ${args_get_target_dir_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_include_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_INCLUDE_ARGS" ${args_get_target_include_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_link_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_LINK_ARGS" ${args_get_target_link_args})
    endif()

    if (NOT "${EMPTY}${args_get_target_name_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_NAME_ARGS" ${args_get_target_name_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_other_src_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_OTHER_SRC_ARGS" ${args_get_target_other_src_args})
    endif()
    
    if (NOT "${EMPTY}${args_get_target_properties_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TARGET_PROPERTIES_ARGS" ${args_get_target_properties_args})
    endif()

    if (NOT "${EMPTY}${args_get_test_cmd_args_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "GET_TEST_CMD_ARGS_ARGS" ${args_get_test_cmd_args_args})
    endif()
    
    if (NOT "${EMPTY}${args_header_condition_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_CONDITION_ARGS" ${args_header_condition_args})
    endif()

    if (NOT "${EMPTY}${args_header_filter_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_FILTER_ARGS" ${args_header_filter_args})
    endif()
    
    if (NOT "${EMPTY}${args_src_condition_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_CONDITION_ARGS" ${args_src_condition_args})
    endif()
    
    if (NOT "${EMPTY}${args_src_filter_args}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_FILTER_ARGS" ${args_src_filter_args})
    endif()

    if (NOT "${EMPTY}${args_src_get_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_GET_TAG" ${args_src_get_tag})
    endif()

    if (NOT "${EMPTY}${args_src_get_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_GET_NAME" ${args_src_get_name})
    endif()

    if (NOT "${EMPTY}${args_src_tag_condition}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_TAG_CONDITION" ${args_src_tag_condition})
    endif()
    
    if (NOT "${EMPTY}${args_src_tag_delimiter}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_TAG_DELIMITER" ${args_src_tag_delimiter})
    endif()

    if (NOT "${EMPTY}${args_header_get_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_GET_TAG" ${args_header_get_tag})
    endif()

    if (NOT "${EMPTY}${args_header_get_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_GET_NAME" ${args_header_get_name})
    endif()
    
    if (NOT "${EMPTY}${args_header_tag_condition}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_TAG_CONDITION" ${args_header_tag_condition})
    endif()
    
    if (NOT "${EMPTY}${args_header_tag_delimiter}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_TAG_DELIMITER" ${args_header_tag_delimiter})
    endif()
    
    if (NOT "${EMPTY}${args_list_src_ext}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_SRC_EXT" ${args_list_src_ext})
    endif()
    
    if (NOT "${EMPTY}${args_list_src_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_SRC_TAG" ${args_list_src_tag})
    endif()

    if (NOT "${EMPTY}${args_src_ext}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_EXT" ${args_src_ext})
    endif()
    
    if (NOT "${EMPTY}${args_src_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_TAG" ${args_src_tag})
    endif()

    if (args_header_recursive)
        list(APPEND call_args "HEADER_RECURSIVE")
    endif()
    
    if (args_header_case_sensitive)
        list(APPEND call_args "HEADER_CASE_SENSITIVE")
    endif()

    if (NOT "${EMPTY}${args_list_header_ext}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_HEADER_EXT" ${args_list_header_ext})
    endif()
    
    if (NOT "${EMPTY}${args_list_header_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_HEADER_TAG" ${args_list_header_tag})
    endif()

    if (NOT "${EMPTY}${args_header_ext}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_EXT" ${args_header_ext})
    endif()
    
    if (NOT "${EMPTY}${args_header_tag}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_TAG" ${args_header_tag})
    endif()

    if (NOT "${EMPTY}${args_base_header_dir}" STREQUAL "${EMPTY}")
        list(APPEND call_args "BASE_HEADER_DIR" ${args_base_header_dir})
    endif()

    if (NOT "${EMPTY}${args_header_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "HEADER_GROUP_NAME" ${args_header_group_name})
    endif()
    
    if (NOT "${EMPTY}${args_src_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "SRC_GROUP_NAME" ${args_src_group_name})
    endif()
    
    if (NOT "${EMPTY}${args_other_src_group_name}" STREQUAL "${EMPTY}")
        list(APPEND call_args "OTHER_SRC_GROUP_NAME" ${args_other_src_group_name})
    endif()

    if (NOT "${EMPTY}${args_list_compile_def_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_COMPILE_DEF_ARG" ${args_list_compile_def_arg})
    endif()
    
    if (NOT "${EMPTY}${args_list_compile_option_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_COMPILE_OPTION_ARG" ${args_list_compile_option_arg})
    endif()
    
    if (NOT "${EMPTY}${args_list_include_dir_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_INCLUDE_DIR_ARG" ${args_list_include_dir_arg})
    endif()
    
    if (NOT "${EMPTY}${args_list_link_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_LINK_ARG" ${args_list_link_arg})
    endif()

    if (NOT "${EMPTY}${args_list_other_src}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_OTHER_SRC" ${args_list_other_src})
    endif()
    
    if (NOT "${EMPTY}${args_list_property_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_PROPERTY_ARG" ${args_list_property_arg})
    endif()
    
    if (NOT "${EMPTY}${args_list_test_cmd_arg}" STREQUAL "${EMPTY}")
        list(APPEND call_args "LIST_TEST_CMD_ARG" ${args_list_test_cmd_arg})
    endif()

    if (NOT "${EMPTY}${args_include_dir}" STREQUAL "${EMPTY}")
        list(APPEND call_args "INCLUDE_DIR" ${args_include_dir})
    endif()

    unset("${output_call_args}")
    if (NOT "${EMPTY}${output_call_args}" STREQUAL "${EMPTY}")
        set(${output_call_args} ${call_args} PARENT_SCOPE)
    endif()
    
endfunction(parse_args)
