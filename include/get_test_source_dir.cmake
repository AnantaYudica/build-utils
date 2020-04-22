function(get_test_source_dir_recv base_dir dir list_output is_recursive 
    is_case_sensitive level)
    cmake_parse_arguments(get_test_source_dir_recv "" "INCLUDE_DIR" 
        "FILTER_ARGS;CONDITION_ARGS" ${ARGN}) 

    set(filter_args "${get_test_source_dir_recv_FILTER_ARGS}")
    set(condition_args "${get_test_source_dir_recv_CONDITION_ARGS}")
    set(include_dir "${get_test_source_dir_recv_INCLUDE_DIR}")

    file(GLOB list_path "${dir}/*")
    
    set(case_sensitive_arg "")
    if (is_case_sensitive)
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(foreach_list_path "")
    foreach(it ${list_path})
        file(RELATIVE_PATH relative_dir "${base_dir}" "${it}")
        get_filename_component(file_name ${it} NAME)
        get_test_source_dir_filter(${it} ok LEVEL ${level} BASE_DIR ${base_dir} 
            RELATIVE_PATH ${relative_dir} FILENAME ${file_name}
            ARGS ${filter_args} INCLUDE_DIR ${include_dir} ${case_sensitive_arg})
        if (ok)
            if(IS_DIRECTORY ${it} AND (is_recursive))
                set(next_list_path "")
                math(EXPR next_level "${level}+1")
                get_test_source_dir_recv("${base_dir}" "${dir}/${file_name}" next_list_path
                    ${is_recursive} ${is_case_sensitive} ${next_level} 
                    FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args}
                    INCLUDE_DIR ${include_dir})
                list(APPEND foreach_list_path ${next_list_path})
            elseif(NOT IS_DIRECTORY ${it})
                get_test_source_dir_condition(${it} ok BASE_DIR ${base_dir} 
                    RELATIVE_PATH ${relative_dir} FILENAME ${file_name}
                    ARGS ${condition_args} INCLUDE_DIR ${include_dir} ${case_sensitive_arg})
                if (ok)
                    list(APPEND foreach_list_path ${it})
                endif()
            endif()
        endif()
    endforeach(it)
    set(${list_output} "${foreach_list_path}" PARENT_SCOPE)
endfunction(get_test_source_dir_recv)


function(get_test_source_dir dir list_output)
    cmake_parse_arguments(get_test_source_dir "RECURSIVE;CASE_SENSITIVE" 
        "FILTER;CONDITION;INCLUDE_DIR" 
        "FILTER_ARGS;CONDITION_ARGS" ${ARGN}) 

    set(filter_args ${get_test_source_dir_FILTER_ARGS})
    set(condition_args ${get_test_source_dir_CONDITION_ARGS})

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_source_dir_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_source_dir_INCLUDE_DIR}")
    endif()
    
    if("${get_test_source_dir_FILTER}" STREQUAL "" OR (NOT EXISTS "${get_test_source_dir_FILTER}"))
        include(${base_dir}/get_test_source_dir/filter.cmake)
    else()
        include(${get_test_source_dir_FILTER})
    endif()
    
    if("${get_test_source_dir_CONDITION}" STREQUAL "" OR (NOT EXISTS "${get_test_source_dir_CONDITION}"))
        include(${base_dir}/get_test_source_dir/condition.cmake)
    else()
        include(${get_test_source_dir_CONDITION})
    endif()

    set(output_list_path "")

    get_test_source_dir_recv("${dir}" "${dir}" output_list_path
        ${get_test_source_dir_RECURSIVE} 
        ${get_test_source_dir_CASE_SENSITIVE} 0 
        FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args}
        INCLUDE_DIR ${base_dir})

    set(${list_output} "${output_list_path}" PARENT_SCOPE)
    
endfunction(get_test_source_dir)
