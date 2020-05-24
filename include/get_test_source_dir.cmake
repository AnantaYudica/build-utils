function(get_test_source_dir_recv base_dir dir list_output is_recursive level)
    cmake_parse_arguments(get_test_source_dir_recv "" "INCLUDE_DIR;CASE_SENSITIVE_ARG" 
        "FILTER_ARGS;CONDITION_ARGS" ${ARGN}) 

    set(filter_args "${get_test_source_dir_recv_FILTER_ARGS}")
    set(condition_args "${get_test_source_dir_recv_CONDITION_ARGS}")
    set(include_dir "${get_test_source_dir_recv_INCLUDE_DIR}")
    set(case_sensitive_arg ${get_test_source_dir_recv_CASE_SENSITIVE_ARG})

    file(GLOB list_path "${dir}/*")

    set(foreach_list_path "")
    foreach(it ${list_path})
        file(RELATIVE_PATH relative_curr_dir "${base_dir}" "${dir}")
        file(RELATIVE_PATH relative_path "${base_dir}" "${it}")
        get_filename_component(curr_dirname ${dir} NAME)
        set(is_directory FALSE)
        if(IS_DIRECTORY ${it})
            set(is_directory TRUE)
            get_filename_component(dirname ${it} NAME)
            get_test_source_dir_filter(ok DIRECTORY
                LEVEL ${level} BASE_DIR ${base_dir} PATH ${it} 
                RELATIVE_PATH ${relative_path} DIRNAME ${dirname} 
                CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_curr_dir} 
                CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                ARGS ${filter_args} ${case_sensitive_arg})
        else()
            get_filename_component(filename ${it} NAME)
            get_test_source_dir_filter(ok 
                LEVEL ${level} BASE_DIR ${base_dir} PATH ${it} 
                RELATIVE_PATH ${relative_path} FILENAME ${filename} 
                CURR_DIR ${dir} RELATIVE_CURR_DIR ${relative_curr_dir}
                CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir} 
                ARGS ${filter_args} ${case_sensitive_arg})
        endif()

        if (ok)
            if(is_directory AND (is_recursive))
                set(next_list_path "")
                math(EXPR next_level "${level}+1")
                get_test_source_dir_recv("${base_dir}" "${dir}/${dirname}" next_list_path
                    ${is_recursive} ${next_level} 
                    FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args}
                    INCLUDE_DIR ${include_dir})
                list(APPEND foreach_list_path ${next_list_path})
            elseif(NOT is_directory)
                get_test_source_dir_condition(ok 
                    BASE_DIR ${base_dir} PATH ${it} 
                    RELATIVE_PATH ${relative_path} 
                    FILENAME ${filename} CURR_DIR ${dir} 
                    RELATIVE_CURR_DIR ${relative_curr_dir} 
                    CURR_DIRNAME ${curr_dirname} INCLUDE_DIR ${include_dir}
                    ARGS ${condition_args} ${case_sensitive_arg})
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
    if (NOT "${EMPTY}${get_test_source_dir_INCLUDE_DIR}" STREQUAL "${EMPTY}")
        set(base_dir "${get_test_source_dir_INCLUDE_DIR}")
    endif()
    
    if("${EMPTY}${get_test_source_dir_FILTER}" STREQUAL "${EMPTY}" 
        OR (NOT EXISTS "${get_test_source_dir_FILTER}"))
        
        include(${base_dir}/get_test_source_dir/filter.cmake)
    else()
        include(${get_test_source_dir_FILTER})
    endif()
    
    if("${EMPTY}${get_test_source_dir_CONDITION}" STREQUAL "${EMPTY}" 
        OR (NOT EXISTS "${get_test_source_dir_CONDITION}"))
        
        include(${base_dir}/get_test_source_dir/condition.cmake)
    else()
        include(${get_test_source_dir_CONDITION})
    endif()

    set(case_sensitive_arg "")
    if (get_test_source_dir_CASE_SENSITIVE)
        set(case_sensitive_arg "CASE_SENSITIVE")
    endif()

    set(output_list_path "")

    get_test_source_dir_recv("${dir}" "${dir}" output_list_path
        ${get_test_source_dir_RECURSIVE} 0 
        FILTER_ARGS ${filter_args} CONDITION_ARGS ${condition_args}
        INCLUDE_DIR ${base_dir} CASE_SENSITIVE_ARG ${case_sensitive_arg})

    set(${list_output} "${output_list_path}" PARENT_SCOPE)
    
endfunction(get_test_source_dir)
