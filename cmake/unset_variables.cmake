
function(unset_variables)
    string(CONCAT one_options "PREFIX")
    cmake_parse_arguments(unset_variables "" "${one_options}" "" ${ARGN}) 

    unset(l_prefix)
    if (NOT "${EMPTY}${unset_variables_PREFIX}" STREQUAL "${EMPTY}")

        set(l_prefix ${unset_variables_PREFIX})
    elseif (DEFINED BUILD_UTILS_PREFIX)
        set(l_prefix ${BUILD_UTILS_PREFIX})
    else()
        set(l_prefix "")
    endif()

    if (NOT "${EMPTY}${l_prefix}" STREQUAL "${EMPTY}")
        string(TOUPPER "${BUILD_UTILS_PREFIX}" l_prefix_upper)
        set(BUILD_UTILS_PREFIX "${l_prefix}" 
            CACHE INTERNAL "build-utils prefix" FORCE)
        set(BUILD_UTILS_PREFIX_UPPER_ "${l_prefix_upper}_" 
            CACHE INTERNAL "build-utils prefix" FORCE)
    else()
        set(BUILD_UTILS_PREFIX "" CACHE INTERNAL "build-utils prefix" FORCE)
        set(BUILD_UTILS_PREFIX_UPPER_ "" CACHE INTERNAL "build-utils prefix" FORCE)
    endif()

    unset(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR CACHE)
    unset(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR CACHE)
    unset(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_UTILS_DIR CACHE)
    unset(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR CACHE)
    unset(${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_ENABLE_TESTING CACHE)
    unset(BUILD_UTILS_CMAKE_BASE_SRC_DIR CACHE)
    unset(BUILD_UTILS_PREFIX CACHE)
    unset(BUILD_UTILS_PREFIX_UPPER_ CACHE)
    
endfunction(unset_variables)
