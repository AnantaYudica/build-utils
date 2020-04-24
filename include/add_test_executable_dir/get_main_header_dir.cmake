function(add_test_executable_dir_get_main_header_dir path header_dir)
    string(CONCAT one_options "TARGET_NAME;BASE_HEADER_DIR"
        ";DIR;BASE_DIR;RELATIVE_PATH;FILENAME;NAME;TAG_EXT;INCLUDE_DIR")
    string(CONCAT list_options "ARGS")
    cmake_parse_arguments(add_test_executable_dir_get_main_header_dir "" 
        "${one_options}" "${list_options}" ${ARGN}) 

    set(dir ${add_test_executable_dir_get_main_header_dir_DIR})
    set(base_header_dir ${add_test_executable_dir_get_main_header_dir_BASE_HEADER_DIR})

    if (NOT "${base_header_dir}" STREQUAL "")
        file(RELATIVE_PATH relative_dir "${base_dir}" "${dir}")
        get_filename_component(current_header_dir "${base_header_dir}/${relative_dir}" ABSOLUTE)
        set(${header_dir} ${current_header_dir} PARENT_SCOPE)
    else()
        set(${header_dir} ${dir} PARENT_SCOPE)
    endif()
    
endfunction(add_test_executable_dir_get_main_header_dir)
