
function(source_group_dir_recv prefix_name base_dir dir is_recursive 
    is_output_name is_output_path output_list_name output_list_path level)

    cmake_parse_arguments(source_group_dir_recv "" "INCLUDE_DIR;CASE_SENSITIVE_ARG" 
        "FILTER_ARGS;CONDITION_ARGS;GET_PREFIX_NAME_ARGS" ${ARGN}) 

    set(filter_args ${source_group_dir_recv_FILTER_ARGS})
    set(condition_args ${source_group_dir_recv_CONDITION_ARGS})
    set(include_dir ${source_group_dir_recv_INCLUDE_DIR})
    set(get_prefix_name_args ${source_group_dir_recv_GET_PREFIX_NAME_ARGS})
    set(case_sensitive_arg ${source_group_dir_recv_CASE_SENSITIVE_ARG})

    file(GLOB list_files "${dir}/*")

    set(foreach_list_name "")
    set(foreach_list_path "")

    foreach(it ${list_files})
        file(RELATIVE_PATH relative_dir "${base_dir}" "${it}")
        get_filename_component(file_name ${it} NAME)
        source_group_dir_filter(${it} ok LEVEL ${level} BASE_DIR ${base_dir} 
            RELATIVE_PATH ${relative_dir} FILENAME ${file_name} ARGS ${filter_args}
            INCLUDE_DIR ${include_dir} ${case_sensitive_arg})
        if (ok)
            if(IS_DIRECTORY ${it} AND (is_recursive)) 
                set(next_list_name "")
                set(next_list_path "")
                math(EXPR next_level "${level}+1")

                source_group_dir_get_prefix_name(${it} "${prefix_name}" 
                    next_prefix_name LEVEL ${level} BASE_DIR ${base_dir} 
                    RELATIVE_PATH ${relative_dir} FILENAME ${file_name} 
                    ARGS ${get_prefix_name_args}
                    INCLUDE_DIR ${include_dir})

                source_group_dir_recv("${next_prefix_name}" "${base_dir}"
                    "${dir}/${file_name}" ${is_recursive}
                    ${is_output_name} ${is_output_path}
                    next_list_name next_list_path ${next_level}
                    FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args}
                    GET_PREFIX_NAME_ARGS ${get_prefix_name_args}
                    INCLUDE_DIR ${include_dir})

                if (is_output_name)
                    list(APPEND foreach_list_name ${next_list_name})
                endif()
                if (is_output_path)
                    list(APPEND foreach_list_path ${next_list_path})
                endif()
            elseif(NOT IS_DIRECTORY ${it})
                source_group_dir_condition(${it} ok BASE_DIR ${base_dir} 
                    RELATIVE_PATH ${relative_dir} FILENAME ${file_name} ARGS ${condition_args}
                    INCLUDE_DIR ${include_dir} ${case_sensitive_arg})
                if (ok)
                    if(NOT DEFINED CMAKE_SCRIPT_MODE_FILE)
                        source_group(${prefix_name} FILES ${it})
                    endif()

                    if (is_output_name)
                        list(APPEND foreach_list_name ${prefix_name})
                    endif()
                    if (is_output_path)
                        list(APPEND foreach_list_path ${it})
                    endif()
                endif()
            endif()
        endif()
    endforeach()
    
    if (is_output_name)
        set(${output_list_name} "${foreach_list_name}" PARENT_SCOPE)
    endif()
    if (is_output_path)
        set(${output_list_path} "${foreach_list_path}" PARENT_SCOPE)
    endif()

endfunction(source_group_dir_recv)

function(source_group_dir prefix_name dir)
    cmake_parse_arguments(source_group_dir "RECURSIVE;CASE_SENSITIVE" 
        "FILTER;CONDITION;LIST_NAME;LIST_PATH;INCLUDE_DIR;GET_PREFIX_NAME" 
        "FILTER_ARGS;CONDITION_ARGS;GET_PREFIX_NAME_ARGS" ${ARGN}) 
    
    set(filter_args ${source_group_dir_FILTER_ARGS})
    set(condition_args ${source_group_dir_CONDITION_ARGS})
    set(get_prefix_name_args ${source_group_dir_GET_PREFIX_NAME_ARGS})

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${source_group_dir_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${source_group_dir_INCLUDE_DIR}")
    endif()

    if("${source_group_dir_FILTER}" STREQUAL "" 
        OR (NOT EXISTS "${source_group_dir_FILTER}"))
        
        include(${base_dir}/source_group_dir/filter.cmake)
    else()
        include(${source_group_dir_FILTER})
    endif()

    if("${source_group_dir_CONDITION}" STREQUAL "" 
        OR (NOT EXISTS "${source_group_dir_CONDITION}"))
        
        include(${base_dir}/source_group_dir/condition.cmake)
    else()
        include(${source_group_dir_CONDITION})
    endif()

    if("${source_group_dir_GET_PREFIX_NAME}" STREQUAL "" 
        OR (NOT EXISTS "${source_group_dir_GET_PREFIX_NAME}"))

        include(${base_dir}/source_group_dir/get_prefix_name.cmake)
    else()
        include(${source_group_dir_GET_PREFIX_NAME})
    endif()
    
    set(enable_output_name FALSE)
    unset("${source_group_dir_LIST_NAME}")
    if(NOT "${source_group_dir_LIST_NAME}" STREQUAL "")
        set(enable_output_name TRUE)
    endif()

    set(enable_output_path FALSE)
    unset("${source_group_dir_LIST_PATH}")
    if(NOT "${source_group_dir_LIST_PATH}" STREQUAL "")
        set(enable_output_path TRUE)
    endif()
    
    set(case_sensitive_arg "")
    if (source_group_dir_CASE_SENSITIVE)
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(output_list_name "")
    set(output_list_path "")

    source_group_dir_recv(${prefix_name} "${dir}" ${dir} 
        ${source_group_dir_RECURSIVE}
        ${enable_output_name} ${enable_output_path}
        output_list_name output_list_path 0 
        FILTER_ARGS ${filter_args}
        CONDITION_ARGS ${condition_args}
        GET_PREFIX_NAME_ARGS ${get_prefix_name_args}
        INCLUDE_DIR ${base_dir}
        CASE_SENSITIVE_ARG ${case_sensitive_arg})

    if(enable_output_name)
        set(${source_group_dir_LIST_NAME} "${output_list_name}" PARENT_SCOPE)
    endif()
    if(enable_output_path)
        set(${source_group_dir_LIST_PATH} "${output_list_path}" PARENT_SCOPE)
    endif()

endfunction(source_group_dir)
