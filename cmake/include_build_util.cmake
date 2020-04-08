function(include_build_util)
    cmake_parse_arguments(include_build_util "" 
        "NAME;RELATIVE_DIR;INCLUDE_DIR" "" ${ARGN}) 

    set(relative_dir "${include_build_util_RELATIVE_DIR}")
    set(name "${include_build_util_NAME}")

    if("${name}" STREQUAL "")
        message(FATAL_ERROR "parameter NAME is not defined")
    endif()

    if(NOT "${include_build_util_INCLUDE_DIR}" STREQUAL "" )
        set(base_dir "${include_build_util_INCLUDE_DIR}")
    else()
        set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    endif()
    
    if(NOT "${relative_dir}" STREQUAL "")
        set(cmake_util_path "${base_dir}/${relative_dir}/${name}.cmake")
    elseif("${relative_dir}" STREQUAL "")
        set(cmake_util_path "${base_dir}/${name}.cmake")
    endif()

    if (EXISTS "${cmake_util_path}")
        include("${cmake_util_path}")
    else()
        message(FATAL_ERROR "file \"${cmake_util_path}\" not exist")
    endif()

endfunction(include_build_util)
