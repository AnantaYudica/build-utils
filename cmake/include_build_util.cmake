function(include_build_util)
    cmake_parse_arguments(include_build_util "" 
        "NAME;RELATIVE_DIR;INCLUDE_DIR" "" ${ARGN}) 

    if (NOT DEFINED BUILD_UTILS_PREFIX 
        OR ("${EMPTY}${BUILD_UTILS_PREFIX}" STREQUAL "${EMPTY}"))
        
        set(BUILD_UTILS_PREFIX "" CACHE INTERNAL "build-utils prefix" FORCE)
        set(BUILD_UTILS_PREFIX_UPPER_ "" CACHE INTERNAL "build-utils prefix" FORCE)
    endif()

    set(relative_dir "${include_build_util_RELATIVE_DIR}")
    set(name "${include_build_util_NAME}")

    if("${EMPTY}${name}" STREQUAL "${EMPTY}")
        message(FATAL_ERROR "parameter NAME is not defined")
    endif()

    if(NOT "${EMPTY}${include_build_util_INCLUDE_DIR}" STREQUAL "${EMPTY}" )
        set(base_dir "${include_build_util_INCLUDE_DIR}")
    else()
        set(base_dir "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR}")
    endif()
    
    if(NOT "${EMPTY}${relative_dir}" STREQUAL "${EMPTY}")
        set(cmake_util_path "${base_dir}/${relative_dir}/${name}.cmake")
    elseif("${EMPTY}${relative_dir}" STREQUAL "${EMPTY}")
        set(cmake_util_path "${base_dir}/${name}.cmake")
    endif()

    if (EXISTS "${cmake_util_path}")
        include("${cmake_util_path}")
    else()
        message(FATAL_ERROR "file \"${cmake_util_path}\" not exist")
    endif()

endfunction(include_build_util)
