
if (NOT IS_DIRECTORY "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}")
    string(CONCAT msg "BUILD_UTILS_CMAKE_BASE_SRC_DIR : "
        "\"${BUILD_UTILS_CMAKE_BASE_SRC_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

unset(l_prefix_)
if (NOT DEFINED BUILD_UTILS_PREFIX 
    OR ("${EMPTY}${BUILD_UTILS_PREFIX}" STREQUAL "${EMPTY}"))
    
    set(BUILD_UTILS_PREFIX "" CACHE INTERNAL "build-utils prefix" FORCE)
    set(BUILD_UTILS_PREFIX_UPPER_ "" CACHE INTERNAL "build-utils prefix" FORCE)
    set(l_prefix_ "")
else()
    set(l_prefix_ "${BUILD_UTILS_PREFIX}_")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR : "
        "\"${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR : "
        "\"${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_UTILS_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_UTILS_DIR : "
        "\"${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_UTILS_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR : "
        "\"${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

file(GLOB test_build_utils_list "${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR}/*")
foreach(it ${test_build_utils_list})
    if(IS_DIRECTORY ${it})
        get_filename_component(name "${it}" NAME)
        add_test(NAME "${l_prefix_}build_utils__${name}" COMMAND ${CMAKE_COMMAND} 
            -D CMAKE_BASE_SRC_DIR=${BUILD_UTILS_CMAKE_BASE_SRC_DIR}
            -D INCLUDE_DIR=${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_INCLUDE_DIR}
            -D TEST_BASE_DIR=${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_BASE_DIR}
            -D TEST_UTILS_DIR=${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_UTILS_DIR}
            -D TEST_SRC_DIR=${${BUILD_UTILS_PREFIX_UPPER_}BUILD_UTILS_TEST_SRC_DIR}
            -D TEST_NAME=${name}
            -D TEST_CMAKE_BASE_SRC_DIR=${it}
            -P "${it}/CMakeLists.txt")
        unset(name)
    endif()
endforeach()

unset(l_prefix_)
