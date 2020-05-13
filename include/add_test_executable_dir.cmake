
function(add_test_executable_dir_recv base_dir dir 
    is_recursive is_output_target_name is_output_target_dir is_output_target_lib
    is_output_target_include_dir is_output_target_compile_def
    is_output_target_compile_option is_output_target_property
    is_output_target_test_cmd_arg is_output_src is_output_header
    is_output_group_name level list_target_name 
    list_target_dir list_target_lib list_target_include_dir 
    list_target_compile_def list_target_compile_option
    list_target_property list_target_test_cmd_arg list_src list_header  
    list_group_name)

    string(CONCAT one_options "HEADER_RECURSIVE_ARG"
        ";CASE_SENSITIVE_ARG;HEADER_CASE_SENSITIVE_ARG")

    string(CONCAT list_options "SRC_EXPAND_ARGS;HEADER_EXPAND_ARGS")

    string(CONCAT one_options "${one_options}" ";PREFIX;PREFIX_DIR")

    string(CONCAT one_options "${one_options}" ";BASE_HEADER_DIR")
    
    string(CONCAT list_options "${list_options}"
        ";GET_DIRNAME_ARGS;GET_GROUP_NAME_ARGS;GET_HEADER_DIR_ARGS"
        ";GET_HEADER_GROUP_NAME_ARGS;GET_HEADER_ARGS;GET_OTHER_SRC_GROUP_NAME_ARGS"
        ";GET_TARGET_COMPILE_ARGS;GET_TARGET_DIR_ARGS;GET_TARGET_INCLUDE_ARGS"
        ";GET_TARGET_LINK_ARGS;GET_TARGET_NAME_ARGS;GET_TARGET_OTHER_SRC_ARGS"
        ";GET_TARGET_PROPERTIES_ARGS;GET_TEST_CMD_ARGS_ARGS;HEADER_CONDITION_ARGS"
        ";HEADER_FILTER_ARGS;SRC_CONDITION_ARGS;SRC_FILTER_ARGS")

    string(CONCAT one_options "${one_options}"
        ";SRC_GROUP_NAME;HEADER_GROUP_NAME;OTHER_SRC_GROUP_NAME")
        
    string(CONCAT one_options "${one_options}"
        ";INCLUDE_DIR")

    string(CONCAT list_options "${list_options}"
        ";LIST_COMPILE_DEF;LIST_COMPILE_OPTION;LIST_INCLUDE_DIR;LIST_LIB"
        ";LIST_OTHER_SRC;LIST_PROPERTY;LIST_TEST_CMD_ARG")

    cmake_parse_arguments(add_test_executable_dir_recv "" 
        "${one_options}" "${list_options}" ${ARGN}) 

    file(GLOB list_file "${dir}/*")

    set(prefix ${add_test_executable_dir_recv_PREFIX})
    set(prefix_dir ${add_test_executable_dir_recv_PREFIX_DIR})
    
    set(header_recursive_arg ${add_test_executable_dir_recv_HEADER_RECURSIVE_ARG})
    set(case_sensitive_arg ${add_test_executable_dir_recv_CASE_SENSITIVE_ARG})
    set(header_case_sensitive_arg ${add_test_executable_dir_recv_HEADER_CASE_SENSITIVE_ARG})

    set(src_expand_args ${add_test_executable_dir_recv_SRC_EXPAND_ARGS})
    set(header_expand_args ${add_test_executable_dir_recv_HEADER_EXPAND_ARGS})

    set(base_header_dir ${add_test_executable_dir_recv_BASE_HEADER_DIR})

    set(get_dirname_args ${add_test_executable_dir_recv_GET_DIRNAME_ARGS})
    set(get_group_name_args ${add_test_executable_dir_recv_GET_GROUP_NAME_ARGS})
    set(get_header_dir_args ${add_test_executable_dir_recv_GET_HEADER_DIR_ARGS})
    set(get_header_group_name_args ${add_test_executable_dir_recv_GET_HEADER_GROUP_NAME_ARGS})
    set(get_header_args ${add_test_executable_dir_recv_GET_HEADER_ARGS})
    set(get_other_src_group_name_args ${add_test_executable_dir_recv_GET_OTHER_SRC_GROUP_NAME_ARGS})
    set(get_target_compile_args ${add_test_executable_dir_recv_GET_TARGET_COMPILE_ARGS}) 
    set(get_target_dir_args ${add_test_executable_dir_recv_GET_TARGET_DIR_ARGS})
    set(get_target_include_args ${add_test_executable_dir_recv_GET_TARGET_INCLUDE_ARGS})
    set(get_target_link_args ${add_test_executable_dir_recv_GET_TARGET_LINK_ARGS}) 
    set(get_target_name_args ${add_test_executable_dir_recv_GET_TARGET_NAME_ARGS})
    set(get_target_other_src_args ${add_test_executable_dir_recv_GET_TARGET_OTHER_SRC_ARGS}) 
    set(get_target_properties_args ${add_test_executable_dir_recv_GET_TARGET_PROPERTIES_ARGS}) 
    set(get_test_cmd_args_args ${add_test_executable_dir_recv_GET_TEST_CMD_ARGS_ARGS})
    set(header_condition_args ${add_test_executable_dir_recv_HEADER_CONDITION_ARGS})
    set(header_filter_args ${add_test_executable_dir_recv_HEADER_FILTER_ARGS})
    set(src_condition_args ${add_test_executable_dir_recv_SRC_CONDITION_ARGS})
    set(src_filter_args ${add_test_executable_dir_recv_SRC_FILTER_ARGS})

    set(src_group_name ${add_test_executable_dir_recv_SRC_GROUP_NAME})
    set(header_group_name ${add_test_executable_dir_recv_HEADER_GROUP_NAME})
    set(other_src_group_name ${add_test_executable_dir_recv_OTHER_SRC_GROUP_NAME})
    set(list_compile_def ${add_test_executable_dir_recv_LIST_COMPILE_DEF})
    set(list_compile_option ${add_test_executable_dir_recv_LIST_COMPILE_OPTION})
    set(list_include_dir ${add_test_executable_dir_recv_LIST_INCLUDE_DIR})
    set(list_lib ${add_test_executable_dir_recv_LIST_LIB})
    set(list_other_src ${add_test_executable_dir_recv_LIST_OTHER_SRC})
    set(list_property ${add_test_executable_dir_recv_LIST_PROPERTY})
    set(list_test_cmd_arg ${add_test_executable_dir_recv_LIST_TEST_CMD_ARG})

    set(include_dir ${add_test_executable_dir_recv_INCLUDE_DIR})
    
    set(foreach_list_target_name "") 
    set(foreach_list_target_dir "") 
    set(foreach_list_target_lib "")
    set(foreach_list_target_include_dir "")
    set(foreach_list_target_compile_def "")
    set(foreach_list_target_compile_option "")
    set(foreach_list_target_property "")
    set(foreach_list_target_test_cmd_arg "") 
    set(foreach_list_src "") 
    set(foreach_list_header "") 
    set(foreach_list_group_name "")
    
    foreach(it ${list_file})

        file(RELATIVE_PATH relative_path "${base_dir}" "${it}")
        file(RELATIVE_PATH relative_dir "${base_dir}" "${dir}")
        get_filename_component(filename ${it} NAME)
        get_filename_component(curr_dirname ${dir} NAME)

        get_test_name_tag_ext_file("${filename}" 
            NAME src_name TAG src_tag EXT src_ext
            INCLUDE_DIR ${include_dir} ${src_expand_args})
        
        set(is_directory FALSE)
        if (IS_DIRECTORY ${it})
            set(is_directory TRUE)
            set(dirname ${filename})

            add_test_executable_dir_src_filter(ok 
                DIRECTORY
                LEVEL ${level} 
                BASE_DIR ${base_dir} 
                PATH ${it}
                RELATIVE_PATH ${relative_path} 
                DIRNAME ${dirname} 
                NAME "${src_name}${src_tag}" TAG ${src_ext}
                CURR_DIR ${dir}
                RELATIVE_CURR_DIR ${relative_dir}
                CURR_DIRNAME ${curr_dirname}
                INCLUDE_DIR ${include_dir} ${case_sensitive_arg}
                ARGS ${src_filter_args})
        else()
            add_test_executable_dir_src_filter(ok
                LEVEL ${level} 
                BASE_DIR ${base_dir}
                PATH ${it}
                RELATIVE_PATH ${relative_path} 
                CURR_DIR ${dir}
                RELATIVE_CURR_DIR ${relative_dir}
                CURR_DIRNAME ${curr_dirname}
                FILENAME ${filename} 
                NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                INCLUDE_DIR ${include_dir} ${case_sensitive_arg}
                ARGS ${src_filter_args})
        endif()

        if (ok)
            if(is_directory AND (is_recursive))

                math(EXPR next_level "${level}+1")
                
                set(next_list_target_name "") 
                set(next_list_target_dir "") 
                set(next_list_target_lib "")
                set(next_list_target_include_dir "")
                set(next_list_target_compile_def "")
                set(next_list_target_compile_option "")
                set(next_list_target_property "")
                set(next_list_target_test_cmd_arg "") 
                set(next_list_src "") 
                set(next_list_header "") 
                set(next_list_group_name "")

                add_test_executable_dir_get_target_dir(dir_target_name 
                    BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                    DIRNAME ${dirname} NAME "${src_name}${src_tag}" TAG ${src_ext} 
                    CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir}
                    CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                    ARGS ${get_target_dir_args})

                add_test_executable_dir_get_dirname(dirname 
                    BASE_DIR ${base_dir} PATH ${it}
                    RELATIVE_PATH ${relative_path} DIRNAME ${filename} 
                    NAME "${src_name}${src_tag}" TAG ${src_ext} 
                    CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir}
                    CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                    ARGS ${get_dirname_args})

                if (NOT "${prefix_dir}" STREQUAL "")
                    set(next_prefix_dir ${prefix_dir}/${dirname})
                else()
                    set(next_prefix_dir ${dirname})
                endif()

                add_test_executable_dir_recv("${base_dir}" "${dir}/${filename}"
                    ${is_recursive} ${is_output_target_name} ${is_output_target_dir} 
                    ${is_output_target_lib} ${is_output_target_include_dir} 
                    ${is_output_target_compile_def} ${is_output_target_compile_option} 
                    ${is_output_target_property} ${is_output_target_test_cmd_arg} 
                    ${is_output_src} ${is_output_header} ${is_output_group_name} ${next_level} 
                    next_list_target_name next_list_target_dir next_list_target_lib 
                    next_list_target_include_dir next_list_target_compile_def
                    next_list_target_compile_option next_list_target_property 
                    next_list_target_test_cmd_arg next_list_src next_list_header 
                    next_list_group_name
                    PREFIX "${prefix}${dir_target_name}"
                    PREFIX_DIR "${next_prefix_dir}"
                    HEADER_RECURSIVE_ARG ${header_recursive_arg}
                    CASE_SENSITIVE_ARG ${case_sensitive_arg}
                    HEADER_CASE_SENSITIVE_ARG ${header_case_sensitive_arg}
                    SRC_EXPAND_ARGS ${src_expand_args}
                    HEADER_EXPAND_ARGS ${header_expand_args}
                    BASE_HEADER_DIR ${base_header_dir}
                    GET_DIRNAME_ARGS ${get_dirname_args}
                    GET_GROUP_NAME_ARGS ${get_group_name_args}
                    GET_HEADER_DIR_ARGS ${get_header_dir_args}
                    GET_HEADER_GROUP_NAME_ARGS ${get_header_group_name_args}
                    GET_HEADER_ARGS ${get_header_args}
                    GET_OTHER_SRC_GROUP_NAME_ARGS ${get_other_src_group_name_args}
                    GET_TARGET_COMPILE_ARGS ${get_target_compile_args}
                    GET_TARGET_DIR_ARGS ${get_target_dir_args}
                    GET_TARGET_INCLUDE_ARGS ${get_target_include_args}
                    GET_TARGET_LINK_ARGS ${get_target_link_args}
                    GET_TARGET_NAME_ARGS ${get_target_name_args}
                    GET_TARGET_OTHER_SRC_ARGS ${get_target_other_src_args}
                    GET_TARGET_PROPERTIES_ARGS ${get_target_properties_args}
                    GET_TEST_CMD_ARGS_ARGS ${get_test_cmd_args_args}
                    HEADER_CONDITION_ARGS ${header_condition_args}
                    HEADER_FILTER_ARGS ${header_filter_args}
                    SRC_CONDITION_ARGS ${src_condition_args}
                    SRC_FILTER_ARGS ${src_filter_args}
                    SRC_GROUP_NAME ${src_group_name}
                    HEADER_GROUP_NAME ${header_group_name}
                    OTHER_SRC_GROUP_NAME ${other_src_group_name}
                    LIST_COMPILE_DEF ${list_compile_def}
                    LIST_COMPILE_OPTION ${list_compile_option}
                    LIST_INCLUDE_DIR ${list_include_dir}
                    LIST_LIB ${list_lib}
                    LIST_OTHER_SRC ${list_other_src}
                    LIST_PROPERTY ${list_property}
                    LIST_TEST_CMD_ARG ${list_test_cmd_arg}
                    INCLUDE_DIR ${include_dir})
                    
                if (is_output_target_name)
                    list(APPEND foreach_list_target_name ${next_list_target_name}) 
                endif()

                if (is_output_target_dir)
                    list(APPEND foreach_list_target_dir ${next_list_target_dir}) 
                endif()

                if (is_output_target_lib)
                    list(APPEND foreach_list_target_lib ${next_list_target_lib})
                endif()

                if (is_output_target_include_dir)
                    list(APPEND foreach_list_target_include_dir ${next_list_target_include_dir})
                endif()

                if (is_output_target_compile_def)
                    list(APPEND foreach_list_target_compile_def ${next_list_target_compile_def})
                endif()

                if (is_output_target_compile_option)
                    list(APPEND foreach_list_target_compile_option ${next_list_target_compile_option})
                endif()

                if (is_output_target_property)
                    list(APPEND foreach_list_target_property ${next_list_target_property})
                endif()

                if (is_output_target_test_cmd_arg)
                    list(APPEND foreach_list_target_test_cmd_arg ${next_list_target_test_cmd_arg}) 
                endif()

                if (is_output_src)
                    list(APPEND foreach_list_src ${next_list_src}) 
                endif()

                if (is_output_header)
                    list(APPEND foreach_list_header ${next_list_header}) 
                endif()

                if (is_output_group_name)
                    list(APPEND foreach_list_group_name ${next_list_group_name})
                endif()

            elseif(NOT is_directory)

                add_test_executable_dir_src_condition(ok 
                    BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                    FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                    CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                    CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                     ${case_sensitive_arg} ARGS ${src_condition_args})

                if (ok)

                    add_test_executable_dir_get_target_name(target_name 
                        PREFIX ${prefix} PREFIX_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_name_args})

                    add_test_executable_dir_get_header_dir(header_dir 
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_HEADER_DIR ${base_header_dir} 
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext}
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir}
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_header_dir_args})

                    add_test_executable_dir_get_header(${header_dir} target_list_header 
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        HEADER_CONDITION_ARGS ${header_condition_args}
                        HEADER_FILTER_ARGS ${header_filter_args}
                        ARGS ${get_header_args} ${header_recursive_arg} 
                        ${header_expand_args})

                    add_test_executable_dir_get_group_name(
                        DEFAULT_HEADER "${header_group_name}" 
                        DEFAULT_SRC "${src_group_name}"
                        DEFAULT_OTHER_SRC "${other_src_group_name}" 
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        HEADER header_group_name 
                        SRC src_group_name 
                        OTHER_SRC other_src_group_name
                        ARGS ${get_group_name_args})

                    add_test_executable_dir_get_target_link(target_list_lib
                        DEFAULT_LIST_LIB ${list_lib}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path}
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_link_args})

                    add_test_executable_dir_get_target_include(target_list_include_dir
                        DEFAULT_LIST_DIR ${list_include_dir}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path}
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_include_args})

                    add_test_executable_dir_get_target_compile(
                        target_list_compile_def target_list_compile_option
                        DEFAULT_LIST_DEF ${list_compile_def}
                        DEFAULT_LIST_OPTION ${list_compile_option}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_compile_args})

                    add_test_executable_dir_get_target_other_src(target_list_other_src
                        DEFAULT_LIST_SRC ${list_other_src}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_other_src_args})

                    add_test_executable_dir_get_target_properties(target_list_property
                        DEFAULT_LIST_PROPERTY ${list_property}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_target_properties_args})

                        add_test_executable_dir_get_test_cmd_args(target_list_test_cmd_arg
                        DEFAULT_LIST_ARG ${list_test_cmd_arg}
                        TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                        BASE_DIR ${base_dir} PATH ${it} RELATIVE_PATH ${relative_path} 
                        FILENAME ${filename} NAME ${src_name} TAG ${src_tag} EXT ${src_ext} 
                        CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_dir} 
                        CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                        ARGS ${get_test_cmd_args_args})

                    if (NOT "${target_list_header}" STREQUAL "")

                        set(foreach_header_group_name "")
                        foreach(it_header_path ${target_list_header})
                            
                            get_filename_component(header_curr_dir 
                                ${it_header_path} DIRECTORY)
                            get_filename_component(header_filename 
                                ${it_header_path} NAME)
                            get_filename_component(header_curr_dirname 
                                ${header_curr_dir} NAME)
                            file(RELATIVE_PATH header_relative_path 
                                "${header_dir}" "${it_header_path}")
                            file(RELATIVE_PATH header_relative_curr_dir 
                                "${header_dir}" "${header_curr_dir}")
                            add_test_executable_dir_get_header_group_name(it_header_group_name
                                PREFIX ${header_group_name} PATH ${it_header_path}
                                BASE_DIR ${header_dir} RELATIVE_PATH ${header_relative_path}
                                FILENAME ${header_filename} CURR_DIR ${header_curr_dir}
                                RELATIVE_CURR_DIR ${header_relative_curr_dir}
                                CURR_DIRNAME ${header_curr_dirname}
                                SRC_BASE_DIR ${base_dir} SRC_PATH ${it}
                                SRC_RELATIVE_PATH ${relative_path} SRC_FILENAME ${filename}
                                SRC_NAME ${src_name} SRC_TAG ${src_tag} SRC_EXT ${src_ext}
                                SRC_CURR_DIR ${dir} SRC_RELATIVE_CURR_DIR ${relative_dir}
                                SRC_CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir}
                                TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                                ARGS ${get_header_group_name_args})

                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                source_group("${it_header_group_name}" 
                                    FILES ${it_header_path})
                            endif()

                            if (is_output_group_name)
                                list(APPEND foreach_header_group_name ${it_header_group_name})
                            endif()

                        endforeach(it_header_path)

                        if (is_output_group_name)
                            list(REMOVE_DUPLICATES foreach_header_group_name)
                            list(APPEND foreach_list_group_name ${foreach_header_group_name})
                        endif()
                    endif()

                    if (NOT "${src_group_name}" STREQUAL "")
                        if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                            source_group("${src_group_name}" FILES ${it})
                        endif()
                        
                        if (is_output_group_name)
                            list(APPEND foreach_list_group_name ${src_group_name})
                        endif()
                    endif()

                    if (NOT "${other_src_group_name}" STREQUAL ""
                        AND (NOT "${target_list_other_src}" STREQUAL ""))

                        set(foreach_other_src_group_name "")
                        foreach(it_other_src_path ${target_list_other_src})

                            get_filename_component(other_src_curr_dir 
                                ${it_other_src_path} DIRECTORY)
                            get_filename_component(other_src_filename 
                                ${it_other_src_path} NAME)
                            get_filename_component(other_src_curr_dirname 
                                ${other_src_curr_dir} NAME)
                            add_test_executable_dir_get_other_src_group_name(
                                it_other_src_group_name
                                PREFIX ${other_src_group_name} PATH ${it_other_src_path}
                                FILENAME ${other_src_filename} CURR_DIR ${other_src_curr_dir}
                                CURR_DIRNAME ${other_src_curr_dirname}
                                SRC_BASE_DIR ${base_dir} SRC_PATH ${it}
                                SRC_RELATIVE_PATH ${relative_path} SRC_FILENAME ${filename}
                                SRC_NAME ${src_name} SRC_TAG ${src_tag} SRC_EXT ${src_ext}
                                SRC_CURR_DIR ${dir} SRC_RELATIVE_CURR_DIR ${relative_dir}
                                SRC_CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir}
                                TARGET_NAME ${target_name} TARGET_DIR ${prefix_dir}
                                ARGS ${get_other_src_group_name_args})

                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                source_group("${it_other_src_group_name}" 
                                    FILES ${it_other_src_path})
                            endif()

                            if (is_output_group_name)
                                list(APPEND foreach_other_src_group_name 
                                    ${it_other_src_group_name})
                            endif()
                            
                        endforeach(it_other_src_path)

                        if (is_output_group_name)
                            list(REMOVE_DUPLICATES foreach_other_src_group_name)
                            list(APPEND foreach_list_group_name ${foreach_other_src_group_name})
                        endif()
                    endif()

                    if (NOT "${target_name}" STREQUAL "")
                        if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                            add_executable("${target_name}" ${it} ${target_list_other_src} ${target_list_header})
                        endif()

                        if (NOT "${target_list_property}" STREQUAL "")
                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                set_target_properties("${target_name}" PROPERTIES ${target_list_property})
                            endif()

                            if (is_output_target_property)
                                list(APPEND foreach_list_target_property ${target_list_property})
                            endif()
                        endif()

                        if (NOT "${target_list_include_dir}" STREQUAL "")
                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                target_include_directories("${target_name}" ${target_list_include_dir})
                            endif()

                            if (is_output_target_include_dir)
                                list(APPEND foreach_list_target_include_dir ${target_list_include_dir})
                            endif()
                        endif()

                        if (NOT "${target_list_compile_def}" STREQUAL "")
                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                target_compile_definitions("${target_name}" ${target_list_compile_def})
                            endif()
                            
                            if (is_output_target_compile_def)
                                list(APPEND foreach_list_target_compile_def ${target_list_compile_def})
                            endif()

                        endif()

                        if (NOT "${target_list_compile_option}" STREQUAL "")
                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                target_compile_options("${target_name}" ${target_list_compile_option})
                            endif()
                            
                            if (is_output_target_compile_option)
                                list(APPEND foreach_list_target_compile_option ${target_list_compile_option})
                            endif()

                        endif()

                        if (NOT "${target_list_lib}" STREQUAL "")
                            if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                                target_link_libraries("${target_name}" ${target_list_lib})
                            endif()

                            if (is_output_target_lib)
                                list(APPEND foreach_list_target_lib ${target_list_lib})
                            endif()
                        endif()
                        
                        if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                            add_test(NAME "${target_name}" COMMAND ${target_name} 
                                ${target_list_test_cmd_arg})
                        endif()

                        if (NOT "${target_list_test_cmd_arg}" STREQUAL "")
                            if (is_output_target_test_cmd_arg)
                                list(APPEND foreach_list_target_test_cmd_arg 
                                    ${target_list_test_cmd_arg}) 
                            endif()

                        endif()

                        if (is_output_target_name)
                            list(APPEND foreach_list_target_name ${target_name}) 
                        endif()

                        if (is_output_target_dir)
                            list(APPEND foreach_list_target_dir ${prefix_dir}) 
                        endif()

                    endif()

                    if (is_output_src)
                        list(APPEND foreach_list_src ${it} ${target_list_other_src}) 
                    endif()
                    
                    if (is_output_header)
                        list(APPEND foreach_list_header ${target_list_header}) 
                    endif()

                endif()
            endif()
        endif()
    endforeach()

    if (is_output_target_name)
        set(${list_target_name} ${foreach_list_target_name} PARENT_SCOPE)
    endif()
    
    if (is_output_target_dir)
        set(${list_target_dir} ${foreach_list_target_dir} PARENT_SCOPE)
    endif() 
    
    if (is_output_target_lib)
        set(${list_target_lib} ${foreach_list_target_lib} PARENT_SCOPE)
    endif()

    if (is_output_target_include_dir)
        set(${list_target_include_dir} ${foreach_list_target_include_dir} PARENT_SCOPE) 
    endif()
    
    if (is_output_target_compile_def)
        set(${list_target_compile_def} ${foreach_list_target_compile_def} PARENT_SCOPE) 
    endif()
    
    if (is_output_target_compile_option)
        set(${list_target_compile_option} ${foreach_list_target_compile_option} PARENT_SCOPE)
    endif()

    if (is_output_target_property)
        set(${list_target_property} ${foreach_list_target_property} PARENT_SCOPE) 
    endif()
    
    if (is_output_target_test_cmd_arg)
        set(${list_target_test_cmd_arg} ${foreach_list_target_test_cmd_arg} PARENT_SCOPE) 
    endif()
    
    if (is_output_src)
        set(${list_src} ${foreach_list_src} PARENT_SCOPE) 
    endif()
    
    if (is_output_header)
        set(${list_header} ${foreach_list_header} PARENT_SCOPE) 
    endif()
    
    if (is_output_group_name)
        set(${list_group_name} ${foreach_list_group_name} PARENT_SCOPE)
    endif()
    
endfunction(add_test_executable_dir_recv)

function(add_test_executable_dir dir)

    string(CONCAT bool_options "RECURSIVE;CASE_SENSITIVE")
    
    string(CONCAT one_options "PREFIX;PREFIX_DIR")

    string(CONCAT one_options "${one_options}" 
        ";GET_DIRNAME;GET_GROUP_NAME;GET_HEADER_DIR;GET_HEADER_GROUP_NAME"
        ";GET_HEADER;GET_OTHER_SRC_GROUP_NAME;GET_TARGET_COMPILE"
        ";GET_TARGET_DIR;GET_TARGET_INCLUDE;GET_TARGET_LINK;GET_TARGET_NAME"
        ";GET_TARGET_OTHER_SRC;GET_TARGET_PROPERTIES;GET_TEST_CMD_ARGS"
        ";HEADER_CONDITION;HEADER_FILTER;SRC_CONDITION;SRC_FILTER")

    string(CONCAT list_options "GET_DIRNAME_ARGS;GET_GROUP_NAME_ARGS"
        ";GET_HEADER_DIR_ARGS;GET_HEADER_GROUP_NAME_ARGS;GET_HEADER_ARGS"
        ";GET_OTHER_SRC_GROUP_NAME_ARGS;GET_TARGET_COMPILE_ARGS"
        ";GET_TARGET_DIR_ARGS;GET_TARGET_INCLUDE_ARGS;GET_TARGET_LINK_ARGS"
        ";GET_TARGET_NAME_ARGS;GET_TARGET_OTHER_SRC_ARGS"
        ";GET_TARGET_PROPERTIES_ARGS;GET_TEST_CMD_ARGS_ARGS;HEADER_CONDITION_ARGS"
        ";HEADER_FILTER_ARGS;SRC_CONDITION_ARGS;SRC_FILTER_ARGS")

    string(CONCAT one_options "${one_options}" 
        ";SRC_GET_TAG;SRC_GET_NAME;SRC_TAG_CONDITION;SRC_TAG_DELIMITER")

    string(CONCAT one_options "${one_options}"
        ";HEADER_GET_TAG;HEADER_GET_NAME;HEADER_TAG_CONDITION;HEADER_TAG_DELIMITER")

    string(CONCAT list_options "${list_options}" 
        ";LIST_SRC_EXT;LIST_SRC_TAG")
    string(CONCAT one_options "${one_options}"
        ";SRC_EXT;SRC_TAG")

    string(CONCAT bool_options "${bool_options}"
        ";HEADER_RECURSIVE;HEADER_CASE_SENSITIVE")
    string(CONCAT list_options "${list_options}"
        ";LIST_HEADER_EXT;LIST_HEADER_TAG")
    string(CONCAT one_options "${one_options}"
        ";HEADER_EXT;HEADER_TAG;BASE_HEADER_DIR")

    string(CONCAT one_options "${one_options}"
        ";HEADER_GROUP_NAME;SRC_GROUP_NAME;OTHER_SRC_GROUP_NAME")
    
    string(CONCAT list_options "${list_options}"
        ";LIST_COMPILE_DEF;LIST_COMPILE_OPTION;LIST_INCLUDE_DIR;LIST_LIB"
        ";LIST_OTHER_SRC;LIST_PROPERTY;LIST_TEST_CMD_ARG")

    string(CONCAT one_options "${one_options}" 
        ";INCLUDE_DIR")

    string(CONCAT one_options "${one_options}" 
        ";LIST_TARGET_NAME;LIST_TARGET_DIR;LIST_TARGET_LIB"
        ";LIST_TARGET_INCLUDE_DIR;LIST_TARGET_COMPILE_DEF"
        ";LIST_TARGET_COMPILE_OPTION;LIST_TARGET_PROPERTY"
        ";LIST_TARGET_TEST_CMD_ARG;LIST_SRC;LIST_HEADER"
        ";LIST_GROUP_NAME")

    cmake_parse_arguments(add_test_executable_dir "${bool_options}" 
        "${one_options}" "${list_options}" ${ARGN}) 

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${add_test_executable_dir_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${add_test_executable_dir_INCLUDE_DIR}")
    endif()
    
    set(case_sensitive_arg "")
    set(is_case_sensitive FALSE)
    if (NOT "${add_test_executable_dir_CASE_SENSITIVE}" STREQUAL "")
        set(is_case_sensitive ${add_test_executable_dir_CASE_SENSITIVE})
        if (is_case_sensitive)
            set(case_sensitive_arg "CASE_SENSITIVE")
        endif()
    endif()
    
    set(header_case_sensitive_arg "")
    set(is_header_case_sensitive FALSE)
    if (NOT "${add_test_executable_dir_HEADER_CASE_SENSITIVE}" STREQUAL "")
        set(is_header_case_sensitive ${add_test_executable_dir_HEADER_CASE_SENSITIVE})
        if (is_header_case_sensitive)
            set(header_case_sensitive_arg "CASE_SENSITIVE")
        endif()
    endif()

    set(list_src_ext "")
    if (NOT "${add_test_executable_dir_LIST_SRC_EXT}" STREQUAL "")
        list(APPEND list_src_ext ${add_test_executable_dir_LIST_SRC_EXT})
    elseif(NOT "${add_test_executable_dir_SRC_EXT}" STREQUAL "")
        list(APPEND list_src_ext ${add_test_executable_dir_SRC_EXT})
    endif()

    set(list_src_tag "")
    if (NOT "${add_test_executable_dir_LIST_SRC_TAG}" STREQUAL "")
        list(APPEND list_src_tag ${add_test_executable_dir_LIST_SRC_TAG})
    elseif(NOT "${add_test_executable_dir_SRC_TAG}" STREQUAL "")
        list(APPEND list_src_tag ${add_test_executable_dir_SRC_TAG})
    endif()

    if (NOT is_case_sensitive)
        set(list_src_ext_tmp "")
        set(list_src_tag_tmp "")
        foreach(it ${list_src_ext})
            string(TOLOWER "${it}" it_lower)
            list(APPEND list_src_ext_tmp "${it_lower}")
        endforeach(it)
        foreach(it ${list_src_tag})
            string(TOLOWER "${it}" it_lower)
            list(APPEND list_src_tag_tmp "${it_lower}")
        endforeach(it)
        set(list_src_ext ${list_src_ext_tmp})
        set(list_src_tag ${list_src_tag_tmp})
    endif()

    set(list_header_ext "")
    if (NOT "${add_test_executable_dir_LIST_HEADER_EXT}" STREQUAL "")
        list(APPEND list_header_ext ${add_test_executable_dir_LIST_HEADER_EXT})
    elseif(NOT "${add_test_executable_dir_HEADER_EXT}" STREQUAL "")
        list(APPEND list_header_ext ${add_test_executable_dir_HEADER_EXT})
    endif()

    set(list_header_tag "")
    if (NOT "${add_test_executable_dir_LIST_HEADER_TAG}" STREQUAL "")
        list(APPEND list_header_tag ${add_test_executable_dir_LIST_HEADER_TAG})
    elseif(NOT "${add_test_executable_dir_HEADER_TAG}" STREQUAL "")
        list(APPEND list_header_tag ${add_test_executable_dir_HEADER_TAG})
    endif()

    if (NOT is_header_case_sensitive)
        set(list_header_ext_tmp "")
        set(list_header_tag_tmp "")
        foreach(it ${list_header_ext})
            string(TOLOWER "${it}" it_lower)
            list(APPEND list_header_ext_tmp "${it_lower}")
        endforeach(it)
        foreach(it ${list_header_tag})
            string(TOLOWER "${it}" it_lower)
            list(APPEND list_header_tag_tmp "${it_lower}")
        endforeach(it)
        set(list_header_ext ${list_header_ext_tmp})
        set(list_header_tag ${list_header_tag_tmp})
    endif()

    if("${add_test_executable_dir_GET_DIRNAME}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_DIRNAME}"))
        
        include(${base_dir}/add_test_executable_dir/get_dirname.cmake)
    else()
        include(${add_test_executable_dir_GET_DIRNAME})
    endif()

    if("${add_test_executable_dir_GET_GROUP_NAME}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_GROUP_NAME}"))
        
        include(${base_dir}/add_test_executable_dir/get_group_name.cmake)
    else()
        include(${add_test_executable_dir_GET_GROUP_NAME})
    endif()

    if("${add_test_executable_dir_GET_HEADER_DIR}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_HEADER_DIR}"))
        
        include(${base_dir}/add_test_executable_dir/get_header_dir.cmake)
    else()
        include(${add_test_executable_dir_GET_HEADER_DIR})
    endif()

    if ("${add_test_executable_dir_GET_HEADER_GROUP_NAME}" STREQUAL ""
        OR (NOT EXISTS "${add_test_executable_dir_GET_HEADER_GROUP_NAME}"))

        include(${base_dir}/add_test_executable_dir/get_header_group_name.cmake)
    else()
        include(${add_test_executable_dir_GET_HEADER_GROUP_NAME})
    endif()

    if("${add_test_executable_dir_GET_HEADER}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_HEADER}"))
        
        include(${base_dir}/add_test_executable_dir/get_header.cmake)
    else()
        include(${add_test_executable_dir_GET_HEADER})
    endif()

    if ("${add_test_executable_dir_GET_OTHER_SRC_GROUP_NAME}" STREQUAL ""
        OR (NOT EXISTS "${add_test_executable_dir_GET_OTHER_SRC_GROUP_NAME}"))

        include(${base_dir}/add_test_executable_dir/get_other_src_group_name.cmake)
    else()
        include(${add_test_executable_dir_GET_OTHER_SRC_GROUP_NAME})
    endif()

    if("${add_test_executable_dir_GET_TARGET_COMPILE}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_COMPILE}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_compile.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_COMPILE})
    endif()

    if("${add_test_executable_dir_GET_TARGET_DIR}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_DIR}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_dir.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_DIR})
    endif()
    
    if("${add_test_executable_dir_GET_TARGET_INCLUDE}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_INCLUDE}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_include.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_INCLUDE})
    endif()
    
    if("${add_test_executable_dir_GET_TARGET_LINK}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_LINK}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_link.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_LINK})
    endif()

    if("${add_test_executable_dir_GET_TARGET_NAME}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_NAME}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_name.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_NAME})
    endif()
    
    if("${add_test_executable_dir_GET_TARGET_OTHER_SRC}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_OTHER_SRC}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_other_src.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_OTHER_SRC})
    endif()

    if("${add_test_executable_dir_GET_TARGET_PROPERTIES}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TARGET_PROPERTIES}"))
        
        include(${base_dir}/add_test_executable_dir/get_target_properties.cmake)
    else()
        include(${add_test_executable_dir_GET_TARGET_PROPERTIES})
    endif()

    if("${add_test_executable_dir_GET_TEST_CMD_ARGS}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_GET_TEST_CMD_ARGS}"))
        
        include(${base_dir}/add_test_executable_dir/get_test_cmd_args.cmake)
    else()
        include(${add_test_executable_dir_GET_TEST_CMD_ARGS})
    endif()

    if("${add_test_executable_dir_HEADER_CONDITION}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_HEADER_CONDITION}"))
        
        if (NOT "${list_header_tag}" STREQUAL "")
            set(header_condition ${base_dir}/add_test_executable_dir/header_condition/list_tag.cmake)
            list(APPEND add_test_executable_dir_HEADER_CONDITION_ARGS "LIST_TAG"
                ${list_header_tag})
        endif()
    else()
        set(header_condition ${add_test_executable_dir_HEADER_CONDITION})
    endif()

    if("${add_test_executable_dir_HEADER_FILTER}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_HEADER_FILTER}"))
        
        if (NOT "${list_header_ext}" STREQUAL "")
            set(header_filter ${base_dir}/add_test_executable_dir/header_filter/list_ext.cmake)
            list(APPEND add_test_executable_dir_HEADER_FILTER_ARGS "LIST_EXT"
                ${list_header_ext})
        endif()
    else()
        set(header_filter ${add_test_executable_dir_HEADER_FILTER})
    endif()

    if ("${header_condition}" STREQUAL ""
        AND ("${header_filter}" STREQUAL ""))
        
        set(header_condition ${base_dir}/add_test_executable_dir/header_condition/default.cmake)
        set(header_filter ${base_dir}/add_test_executable_dir/header_filter/default.cmake)
    elseif ("${header_condition}" STREQUAL ""
        AND (NOT "${header_filter}" STREQUAL ""))

        set(header_condition ${base_dir}/add_test_executable_dir/header_condition/list_tag.cmake)
    elseif(NOT "${header_condition}" STREQUAL ""
        AND ("${header_filter}" STREQUAL ""))

        set(header_filter ${base_dir}/add_test_executable_dir/header_filter/list_ext.cmake)
    endif()

    include(${header_condition})
    include(${header_filter})

    if("${add_test_executable_dir_SRC_CONDITION}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_SRC_CONDITION}"))
        
        if(NOT "${list_src_tag}" STREQUAL "")
            include(${base_dir}/add_test_executable_dir/src_condition/list_tag.cmake)
            list(APPEND add_test_executable_dir_SRC_CONDITION_ARGS "LIST_TAG"
                ${list_src_tag})
        else()
            include(${base_dir}/add_test_executable_dir/src_condition/default.cmake)
        endif()
    else()
        include(${add_test_executable_dir_SRC_CONDITION})
    endif()

    if("${add_test_executable_dir_SRC_FILTER}" STREQUAL "" 
        OR (NOT EXISTS "${add_test_executable_dir_SRC_FILTER}"))
        
        if (NOT "${list_src_ext}" STREQUAL "")
            include(${base_dir}/add_test_executable_dir/src_filter/list_ext.cmake)
            list(APPEND add_test_executable_dir_SRC_FILTER_ARGS "LIST_EXT"
                ${list_src_ext})
        else()
            include(${base_dir}/add_test_executable_dir/src_filter/default.cmake)
        endif()
    else()
        include(${add_test_executable_dir_SRC_FILTER})
    endif()

    set(is_recursive FALSE)
    if (NOT "${add_test_executable_dir_RECURSIVE}" STREQUAL "")
        set(is_recursive ${add_test_executable_dir_RECURSIVE})
    endif()

    set(header_recursive_arg "")
    set(is_header_recursive FALSE)
    if (NOT "${add_test_executable_dir_HEADER_RECURSIVE}" STREQUAL "")
        set(is_header_recursive ${add_test_executable_dir_HEADER_RECURSIVE})
        if (is_header_recursive)
            set(header_recursive_arg "RECURSIVE")
        endif()
    endif()

    set(src_expand_args "")
    if (NOT "${add_test_executable_dir_SRC_GET_TAG}" STREQUAL "")
        list(APPEND src_expand_args 
            "GET_TAG" ${add_test_executable_dir_SRC_GET_TAG})
    endif()

    if (NOT "${add_test_executable_dir_SRC_GET_NAME}")
        list(APPEND src_expand_args 
            "GET_NAME" ${add_test_executable_dir_SRC_GET_NAME})
    endif()

    if(NOT "${add_test_executable_dir_SRC_TAG_CONDITION}" STREQUAL "")
        list(APPEND src_expand_args 
            "TAG_CONDITION" ${add_test_executable_dir_SRC_TAG_CONDITION})
    endif()

    if (NOT "${add_test_executable_dir_SRC_TAG_DELIMITER}" STREQUAL "")
        list(APPEND src_expand_args 
            "TAG_DELIMITER" ${add_test_executable_dir_SRC_TAG_DELIMITER})
    endif() 
    
    set(header_expand_args "")
    if (NOT "${add_test_executable_dir_HEADER_GET_TAG}" STREQUAL "")
        list(APPEND header_expand_args 
            "GET_TAG" ${add_test_executable_dir_HEADER_GET_TAG})
    endif()

    if (NOT "${add_test_executable_dir_HEADER_GET_NAME}")
        list(APPEND header_expand_args 
            "GET_NAME" ${add_test_executable_dir_HEADER_GET_NAME})
    endif()

    if(NOT "${add_test_executable_dir_HEADER_TAG_CONDITION}" STREQUAL "")
        list(APPEND header_expand_args 
            "TAG_CONDITION" ${add_test_executable_dir_HEADER_TAG_CONDITION})
    endif()

    if (NOT "${add_test_executable_dir_HEADER_TAG_DELIMITER}" STREQUAL "")
        list(APPEND header_expand_args 
            "TAG_DELIMITER" ${add_test_executable_dir_HEADER_TAG_DELIMITER})
    endif() 

    set(base_header_dir "")
    if (NOT "${add_test_executable_dir_BASE_HEADER_DIR}" STREQUAL "")
        set(base_header_dir "${add_test_executable_dir_BASE_HEADER_DIR}")
    endif()

    if (NOT DEFINED add_test_executable_dir_DEFAULT_SRC_GROUP_NAME)
        set(src_group_name "Source Files")
    else()
        set(src_group_name "${add_test_executable_dir_DEFAULT_SRC_GROUP_NAME}")
    endif()
    if (NOT "${add_test_executable_dir_SRC_GROUP_NAME}" STREQUAL "")
        set(src_group_name ${add_test_executable_dir_SRC_GROUP_NAME})
    endif()

    if (NOT DEFINED add_test_executable_dir_DEFAULT_HEADER_GROUP_NAME)
        set(header_group_name "Header Files")
    else()
        set(header_group_name "${add_test_executable_dir_DEFAULT_HEADER_GROUP_NAME}")
    endif()
    if (NOT "${add_test_executable_dir_HEADER_GROUP_NAME}" STREQUAL "")
        set(header_group_name ${add_test_executable_dir_HEADER_GROUP_NAME})
    endif()

    if (NOT DEFINED add_test_executable_dir_DEFAULT_OTHER_SRC_GROUP_NAME)
        set(other_src_group_name "Other Source Files")
    else()
        set(other_src_group_name "${add_test_executable_dir_DEFAULT_OTHER_SRC_GROUP_NAME}")
    endif()
    if (NOT "${add_test_executable_dir_OTHER_SRC_GROUP_NAME}" STREQUAL "")
        set(other_src_group_name ${add_test_executable_dir_OTHER_SRC_GROUP_NAME})
    endif()
    
    if (NOT COMMAND get_test_name_tag_ext_file)
        include_build_util(NAME get_test_name_tag_ext_file INCLUDE_DIR ${base_dir})
    endif()

    set(enable_output_target_name FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_NAME}" STREQUAL "")
        set(enable_output_target_name TRUE)
    endif()

    set(enable_output_target_dir FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_DIR}" STREQUAL "")
        set(enable_output_target_dir TRUE)
    endif()

    set(enable_output_target_lib FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_LIB}" STREQUAL "")
        set(enable_output_target_lib TRUE)
    endif()

    set(enable_output_target_include_dir FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_INCLUDE_DIR}" STREQUAL "")
        set(enable_output_target_include_dir TRUE)
    endif()

    set(enable_output_target_compile_def FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_COMPILE_DEF}" STREQUAL "")
        set(enable_output_target_compile_def TRUE)
    endif()

    set(enable_output_target_compile_option FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_COMPILE_OPTION}" STREQUAL "")
        set(enable_output_target_compile_option TRUE)
    endif()

    set(enable_output_target_property FALSE)
    if (NOT "${add_test_executable_dir_LIST_TARGET_PROPERTY}" STREQUAL "")
        set(enable_output_target_property TRUE)
    endif()

    set(enable_output_target_test_cmd_arg FALSE) 
    if (NOT "${add_test_executable_dir_LIST_TARGET_TEST_CMD_ARG}" STREQUAL "")
        set(enable_output_target_test_cmd_arg TRUE)
    endif()

    set(enable_output_src FALSE) 
    if (NOT "${add_test_executable_dir_LIST_SRC}" STREQUAL "")
        set(enable_output_src TRUE) 
    endif()

    set(enable_output_header FALSE) 
    if (NOT "${add_test_executable_dir_LIST_HEADER}" STREQUAL "")
        set(enable_output_header TRUE) 
    endif()

    set(enable_output_group_name FALSE)
    if (NOT "${add_test_executable_dir_LIST_GROUP_NAME}" STREQUAL "")
        set(enable_output_group_name TRUE)
    endif()
    
    set(list_target_name "") 
    set(list_target_dir "") 
    set(list_target_lib "")
    set(list_target_include_dir "")
    set(list_target_compile_def "")
    set(list_target_compile_option "")
    set(list_target_property "")
    set(list_target_test_cmd_arg "") 
    set(list_src "") 
    set(list_header "") 
    set(list_group_name "")
    
    add_test_executable_dir_recv(${dir} ${dir}
        ${is_recursive} ${enable_output_target_name} ${enable_output_target_dir}
        ${enable_output_target_lib} ${enable_output_target_include_dir}
        ${enable_output_target_compile_def} ${enable_output_target_compile_option}
        ${enable_output_target_property} ${enable_output_target_test_cmd_arg}
        ${enable_output_src} ${enable_output_header} ${enable_output_group_name} 0 
        list_target_name list_target_dir list_target_lib
        list_target_include_dir list_target_compile_def list_target_compile_option
        list_target_property list_target_test_cmd_arg list_src list_header list_group_name
        PREFIX ${add_test_executable_dir_PREFIX}
        PREFIX_DIR ${add_test_executable_dir_PREFIX_DIR}
        HEADER_RECURSIVE_ARG ${header_recursive_arg}
        CASE_SENSITIVE_ARG ${case_sensitive_arg}
        HEADER_CASE_SENSITIVE_ARG ${header_case_sensitive_arg}
        SRC_EXPAND_ARGS ${src_expand_args}
        HEADER_EXPAND_ARGS ${header_expand_args}
        BASE_HEADER_DIR ${base_header_dir}
        GET_DIRNAME_ARGS ${add_test_executable_dir_GET_DIRNAME_ARGS}
        GET_GROUP_NAME_ARGS ${add_test_executable_dir_GET_GROUP_NAME_ARGS}
        GET_HEADER_DIR_ARGS ${add_test_executable_dir_GET_HEADER_DIR_ARGS}
        GET_HEADER_GROUP_NAME_ARGS ${add_test_executable_dir_GET_HEADER_GROUP_NAME_ARGS}
        GET_HEADER_ARGS ${add_test_executable_dir_GET_HEADER_ARGS}
        GET_OTHER_SRC_GROUP_NAME_ARGS ${add_test_executable_dir_GET_OTHER_SRC_GROUP_NAME_ARGS}
        GET_TARGET_COMPILE_ARGS ${add_test_executable_dir_GET_TARGET_COMPILE_ARGS}
        GET_TARGET_DIR_ARGS ${add_test_executable_dir_GET_TARGET_DIR_ARGS}
        GET_TARGET_INCLUDE_ARGS ${add_test_executable_dir_GET_TARGET_INCLUDE_ARGS}
        GET_TARGET_LINK_ARGS ${add_test_executable_dir_GET_TARGET_LINK_ARGS}
        GET_TARGET_NAME_ARGS ${add_test_executable_dir_GET_TARGET_NAME_ARGS}
        GET_TARGET_OTHER_SRC_ARGS ${add_test_executable_dir_GET_TARGET_OTHER_SRC_ARGS}
        GET_TARGET_PROPERTIES_ARGS ${add_test_executable_dir_GET_TARGET_PROPERTIES_ARGS}
        GET_TEST_CMD_ARGS_ARGS ${add_test_executable_dir_GET_TEST_CMD_ARGS_ARGS}
        HEADER_CONDITION_ARGS ${add_test_executable_dir_HEADER_CONDITION_ARGS}
        HEADER_FILTER_ARGS ${add_test_executable_dir_HEADER_FILTER_ARGS}
        SRC_CONDITION_ARGS ${add_test_executable_dir_SRC_CONDITION_ARGS}
        SRC_FILTER_ARGS ${add_test_executable_dir_SRC_FILTER_ARGS}
        SRC_GROUP_NAME ${src_group_name}
        HEADER_GROUP_NAME ${header_group_name}
        OTHER_SRC_GROUP_NAME ${other_src_group_name}
        LIST_COMPILE_DEF ${add_test_executable_dir_LIST_COMPILE_DEF}
        LIST_COMPILE_OPTION ${add_test_executable_dir_LIST_COMPILE_OPTION}
        LIST_INCLUDE_DIR ${add_test_executable_dir_LIST_INCLUDE_DIR}
        LIST_LIB ${add_test_executable_dir_LIST_LIB}
        LIST_OTHER_SRC ${add_test_executable_dir_LIST_OTHER_SRC}
        LIST_PROPERTY ${add_test_executable_dir_LIST_PROPERTY}
        LIST_TEST_CMD_ARG ${add_test_executable_dir_LIST_TEST_CMD_ARG}
        INCLUDE_DIR ${base_dir})

    if (enable_output_target_name)
        set(${add_test_executable_dir_LIST_TARGET_NAME} ${list_target_name} PARENT_SCOPE) 
    endif()
    
    if (enable_output_target_dir)
        set(${add_test_executable_dir_LIST_TARGET_DIR} ${list_target_dir} PARENT_SCOPE) 
    endif()

    if (enable_output_target_lib)
        set(${add_test_executable_dir_LIST_TARGET_LIB} ${list_target_lib} PARENT_SCOPE)
    endif()

    if (enable_output_target_include_dir)
        set(${add_test_executable_dir_LIST_TARGET_INCLUDE_DIR} ${list_target_include_dir} PARENT_SCOPE)
    endif()

    if (enable_output_target_compile_def)
        set(${add_test_executable_dir_LIST_TARGET_COMPILE_DEF} ${list_target_compile_def} PARENT_SCOPE)
    endif()

    if (enable_output_target_compile_option)
        set(${add_test_executable_dir_LIST_TARGET_COMPILE_OPTION} ${list_target_compile_option} PARENT_SCOPE)
    endif()

    if (enable_output_target_property)
        set(${add_test_executable_dir_LIST_TARGET_PROPERTY} ${list_target_property} PARENT_SCOPE)
    endif()

    if (enable_output_target_test_cmd_arg)
        set(${add_test_executable_dir_LIST_TARGET_TEST_CMD_ARG} ${list_target_test_cmd_arg} PARENT_SCOPE) 
    endif()

    if (enable_output_src)
        set(${add_test_executable_dir_LIST_SRC} ${list_src} PARENT_SCOPE) 
    endif()

    if (enable_output_header)
        set(${add_test_executable_dir_LIST_HEADER} ${list_header} PARENT_SCOPE) 
    endif()

    if (enable_output_group_name)
        set(${add_test_executable_dir_LIST_GROUP_NAME} ${list_group_name} PARENT_SCOPE)
    endif()

endfunction(add_test_executable_dir)
