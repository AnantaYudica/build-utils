
function(get_test_target_name target_name_out)
    cmake_parse_arguments(get_test_target_name "" 
        "PREFIX;NAME;TAG;FORMAT;SET_NAME;SET_PREFIX;SET_TAG;INCLUDE_DIR" 
        "PREFIX_ARGS;NAME_ARGS;TAG_ARGS" ${ARGN}) 

    set(base_dir "${BUILD_UTILS_INCLUDE_DIR}")
    if (NOT "${get_test_target_name_INCLUDE_DIR}" STREQUAL "")
        set(base_dir "${get_test_target_name_INCLUDE_DIR}")
    endif()
    
    if ("${get_test_target_name_FORMAT}" STREQUAL "" OR (NOT EXISTS "${get_test_target_name_FORMAT}"))
        include(${base_dir}/get_test_target_name/format.cmake)
    else()
        include(${get_test_target_name_FORMAT})
    endif()

    if ("${get_test_target_name_SET_NAME}" STREQUAL "" OR (NOT EXISTS "${get_test_target_name_SET_NAME}"))
        include(${base_dir}/get_test_target_name/set_name.cmake)
    else()
        include(${get_test_target_name_SET_NAME})
    endif()

    if ("${get_test_target_name_SET_PREFIX}" STREQUAL "" OR (NOT EXISTS "${get_test_target_name_SET_PREFIX}"))
        include(${base_dir}/get_test_target_name/set_prefix.cmake)
    else()
        include(${get_test_target_name_SET_PREFIX})
    endif()

    if ("${get_test_target_name_SET_TAG}" STREQUAL "" OR (NOT EXISTS "${get_test_target_name_SET_TAG}"))
        include(${base_dir}/get_test_target_name/set_tag.cmake)
    else()
        include(${get_test_target_name_SET_TAG})
    endif()

    set(name "")
    set(tag "")
    set(prefix "")

    if (NOT "${get_test_target_name_PREFIX}" STREQUAL "")
        set(prefix "${get_test_target_name_PREFIX}")
    endif()

    if (NOT "${get_test_target_name_NAME}" STREQUAL "")
        set(name "${get_test_target_name_NAME}")
    endif()

    if (NOT "${get_test_target_name_TAG}" STREQUAL "")
        set(tag "${get_test_target_name_TAG}")
    endif()

    get_test_target_name_set_prefix("${prefix}" prefix ARGS ${get_test_target_name_PREFIX_ARGS})
    get_test_target_name_set_name("${name}" name ARGS ${get_test_target_name_NAME_ARGS})
    get_test_target_name_set_tag("${tag}" tag ARGS ${get_test_target_name_TAG_ARGS})

    get_test_target_name_format("${prefix}" "${name}" "${tag}" result)
    
    set(${target_name_out} "${result}" PARENT_SCOPE)

endfunction(get_test_target_name)
