function(source_group_dir_condition path output)
    cmake_parse_arguments(source_group_dir_condition "" 
        "BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
   
    if ("${source_group_dir_condition_NAME}" STREQUAL "test1.txt"
        AND (NOT "${source_group_dir_condition_RELATIVE_PATH}" MATCHES ".*b.*"))
        
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(source_group_dir_condition)
