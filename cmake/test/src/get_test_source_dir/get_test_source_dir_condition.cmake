function(get_test_source_dir_condition path output)
    cmake_parse_arguments(get_test_source_dir_condition "" 
        "BASE_DIR;RELATIVE_PATH;NAME" "" ${ARGN}) 
    if ("${get_test_source_dir_condition_NAME}" STREQUAL "test1.txt"
        AND (NOT "${get_test_source_dir_condition_RELATIVE_PATH}" MATCHES ".*b.*"))
        
        set(${output} TRUE PARENT_SCOPE)
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction(get_test_source_dir_condition)
