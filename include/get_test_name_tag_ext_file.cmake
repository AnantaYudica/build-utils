
function(get_test_name_tag_ext_file filename)
    
    set(one_options "NAME;TAG;EXT;GET_TAG;GET_NAME;TAG_CONDITION;TAG_DELIMITER;INCLUDE_DIR")
    string(CONCAT one_options "${one_options}" ";INDEX;LENGTH;NAME_INDEX;NAME_LENGTH"
        ";TAG_DELIMITER_INDEX;TAG_DELIMITER_LENGTH;TAG_INDEX;TAG_LENGTH"
        ";EXT_DELIMITER_INDEX;EXT_DELIMITER_LENGTH;EXT_INDEX;EXT_LENGTH")

    cmake_parse_arguments(get_test_name_tag_ext_file "" "${one_options}" "" ${ARGN}) 

    set(filename_index 0)
    if (NOT "${get_test_name_tag_ext_file_INDEX}" STREQUAL "")
        set(filename_index ${get_test_name_tag_ext_file_INDEX})
    endif()
    
    string(LENGTH "${filename}" filename_length)
    math(EXPR filename_length "${filename_length}-${filename_index}")
    if (NOT "${get_test_name_tag_ext_file_LENGTH}" STREQUAL "")
        set(filename_length ${get_test_name_tag_ext_file_LENGTH})
    endif()

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_name_tag_ext_file_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_name_tag_ext_file_INCLUDE_DIR}")
    endif()

    if("${get_test_name_tag_ext_file_GET_TAG}" STREQUAL "" 
        OR (NOT EXISTS "${get_test_name_tag_ext_file_GET_TAG}"))

        include(${base_dir}/get_test_name_tag_ext_file/get_tag.cmake)
    else()
        include(${get_test_name_tag_ext_file_GET_TAG})
    endif()

    if("${get_test_name_tag_ext_file_GET_NAME}" STREQUAL "" 
        OR (NOT EXISTS "${get_test_name_tag_ext_file_GET_NAME}"))
        
        include(${base_dir}/get_test_name_tag_ext_file/get_name.cmake)
    else()
        include(${get_test_name_tag_ext_file_GET_NAME})
    endif()

    if("${get_test_name_tag_ext_file_TAG_CONDITION}" STREQUAL "" 
        OR (NOT EXISTS "${get_test_name_tag_ext_file_TAG_CONDITION}"))
        
        include(${base_dir}/get_test_name_tag_ext_file/tag_condition.cmake)
    else()
        include(${get_test_name_tag_ext_file_TAG_CONDITION})
    endif()

    if("${get_test_name_tag_ext_file_TAG_DELIMITER}" STREQUAL "")
        set(tag_delim ".")
    else()
        set(tag_delim "${get_test_name_tag_ext_file_TAG_DELIMITER}")
    endif()

    string(LENGTH "${tag_delim}" in_tag_delim_length)
    
    set(name_out "")
    set(tag_out "")
    set(ext_out "")
    
    set(name_index 0)
    set(name_length 0)
    set(tag_delim_index 0)
    set(tag_delim_length 0)
    set(tag_index 0)
    set(tag_length 0)
    set(ext_delim_index 0)
    set(ext_delim_length 0)
    set(ext_index 0)
    set(ext_length 0)

    string(SUBSTRING "${filename}" ${filename_index} ${filename_length} filename_str)

    if(${filename_length} GREATER 0)

        string(FIND ${filename_str} "." ext_delimiter_pos REVERSE)
        if (${ext_delimiter_pos} GREATER -1)
            math(EXPR ext_index "${ext_delimiter_pos}+1")
            math(EXPR ext_length "${filename_length}-${ext_index}")
            set(ext_delim_index ${ext_delimiter_pos})
            set(ext_delim_length 1)
            string(SUBSTRING "${filename_str}" ${ext_index} ${ext_length} ext_out)
        else()
            set(ext_delim_index ${filename_length})
            set(ext_delim_length 0)
            set(ext_index ${filename_length})
            set(ext_length 0)
        endif()

        if (${ext_delim_index} GREATER 0)

            set(tag_delim_index ${ext_delim_index})
            set(tag_index ${ext_delim_index})

            set(tag_buffer_str "")
            foreach(it RANGE ${ext_delim_index} 1 -1)
                math(EXPR index "${it}-1")
                math(EXPR tag_buffer_str_length "${ext_delim_index}-${index}")

                string(SUBSTRING "${filename_str}" ${index} ${tag_buffer_str_length} tag_buffer_str)
                string(SUBSTRING "${filename_str}" ${index} 1 chr)
                get_test_name_tag_ext_file_tag_condition("${filename_str}" ${index}
                    ${tag_buffer_str_length} ok tag_delim_index tag_delim_length 
                    STRING ${tag_buffer_str} CHARACTER ${chr} 
                    DELIMITER ${tag_delim} 
                    DELIMITER_LENGTH ${in_tag_delim_length}
                    EXT_DELIMITER_INDEX ${ext_delim_index}  
                    EXT_DELIMITER_LENGTH ${ext_delim_length} 
                    EXT_INDEX ${ext_index} EXT_LENGTH ${ext_length})
                if (ok)
                    math(EXPR index "${index}+${tag_delim_length}")
                    math(EXPR tag_buffer_str_length "${tag_buffer_str_length}-${tag_delim_length}")
                    string(SUBSTRING "${filename_str}" ${index} ${tag_buffer_str_length} tag_buffer_str)
                    get_test_name_tag_ext_file_get_tag("${filename_str}" ${index} ${tag_buffer_str_length}
                        ${tag_delim_index} ${tag_delim_length} tag_out tag_index tag_length 
                        STRING ${tag_buffer_str}
                        DELIMITER ${tag_delim} 
                        DELIMITER_LENGTH ${in_tag_delim_length}
                        EXT_DELIMITER_INDEX ${ext_delim_index}  
                        EXT_DELIMITER_LENGTH ${ext_delim_length} 
                        EXT_INDEX ${ext_index} EXT_LENGTH ${ext_length})
                    break()
                endif()
            endforeach(it)
            
            set(name_index ${tag_delim_index})

            get_test_name_tag_ext_file_get_name("${filename_str}" 0 ${tag_delim_index} 
                name_out name_index name_length
                TAG_DELIMITER_INDEX ${tag_delim_index}
                TAG_DELIMITER_LENGTH ${tag_delim_length}
                TAG_INDEX ${tag_index} TAG_LENGTH ${tag_length}
                EXT_DELIMITER_INDEX ${ext_delim_index}  
                EXT_DELIMITER_LENGTH ${ext_delim_length} 
                EXT_INDEX ${ext_index} EXT_LENGTH ${ext_length})
        endif()

    endif()
    
    if (NOT "${get_test_name_tag_ext_file_NAME}" STREQUAL "")
        set("${get_test_name_tag_ext_file_NAME}" "${name_out}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_TAG}" STREQUAL "")
        set("${get_test_name_tag_ext_file_TAG}" "${tag_out}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_EXT}" STREQUAL "")
        set("${get_test_name_tag_ext_file_EXT}" "${ext_out}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_NAME_INDEX}" STREQUAL "")
        math(EXPR name_index "${name_index}+${filename_index}")
        set("${get_test_name_tag_ext_file_NAME_INDEX}" "${name_index}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_NAME_LENGTH}" STREQUAL "")
        set("${get_test_name_tag_ext_file_NAME_LENGTH}" "${name_length}" PARENT_SCOPE)
    endif()
    
    if (NOT "${get_test_name_tag_ext_file_TAG_DELIMITER_INDEX}" STREQUAL "")
        math(EXPR tag_delim_index "${tag_delim_index}+${filename_index}")
        set("${get_test_name_tag_ext_file_TAG_DELIMITER_INDEX}" "${tag_delim_index}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_TAG_DELIMITER_LENGTH}" STREQUAL "")
        set("${get_test_name_tag_ext_file_TAG_DELIMITER_LENGTH}" "${tag_delim_length}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_TAG_INDEX}" STREQUAL "")
        math(EXPR tag_index "${tag_index}+${filename_index}")
        set("${get_test_name_tag_ext_file_TAG_INDEX}" "${tag_index}" PARENT_SCOPE)
    endif()

    if (NOT "${get_test_name_tag_ext_file_TAG_LENGTH}" STREQUAL "")
        set("${get_test_name_tag_ext_file_TAG_LENGTH}" "${tag_length}" PARENT_SCOPE)
    endif()
    
    if (NOT "${get_test_name_tag_ext_file_EXT_DELIMITER_INDEX}" STREQUAL "")
        math(EXPR ext_delim_index "${ext_delim_index}+${filename_index}")
        set("${get_test_name_tag_ext_file_EXT_DELIMITER_INDEX}" "${ext_delim_index}" PARENT_SCOPE)
    endif()
    
    if (NOT "${get_test_name_tag_ext_file_EXT_DELIMITER_LENGTH}" STREQUAL "")
        set("${get_test_name_tag_ext_file_EXT_DELIMITER_LENGTH}" "${ext_delim_length}" PARENT_SCOPE)
    endif()
    
    if (NOT "${get_test_name_tag_ext_file_EXT_INDEX}" STREQUAL "")
        math(EXPR ext_index "${ext_index}+${filename_index}")
        set("${get_test_name_tag_ext_file_EXT_INDEX}" "${ext_index}" PARENT_SCOPE)
    endif()
    
    if (NOT "${get_test_name_tag_ext_file_EXT_LENGTH}" STREQUAL "")
        set("${get_test_name_tag_ext_file_EXT_LENGTH}" "${ext_length}" PARENT_SCOPE)
    endif()

endfunction(get_test_name_tag_ext_file)
