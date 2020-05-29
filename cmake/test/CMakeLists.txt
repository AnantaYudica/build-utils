
if (NOT IS_DIRECTORY "${BUILD_UTILS_CMAKE_BASE_SRC_DIR}")
    string(CONCAT msg "BUILD_UTILS_CMAKE_BASE_SRC_DIR : "
        "\"${BUILD_UTILS_CMAKE_BASE_SRC_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT DEFINED BUILD_UTILS_PREFIX)
    set(BUILD_UTILS_PREFIX "" CACHE INTERNAL "build-utils prefix" FORCE)
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR : "
        "\"${${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR : "
        "\"${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR : "
        "\"${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

if (NOT IS_DIRECTORY "${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SRC_DIR}")
    string(CONCAT msg "${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SRC_DIR : "
        "\"${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SRC_DIR}\" is not directory")
    message(FATAL_ERROR "${msg}")
endif()

file(GLOB test_build_utils_list "${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SRC_DIR}/*")
foreach(it ${test_build_utils_list})
    if(IS_DIRECTORY ${it})
        set(name "")
        get_filename_component(name "${it}" NAME)
        add_test(NAME "${name}" COMMAND ${CMAKE_COMMAND} 
            -D CMAKE_BASE_SRC_DIR=${BUILD_UTILS_CMAKE_BASE_SRC_DIR}
            -D INCLUDE_DIR=${${BUILD_UTILS_PREFIX}BUILD_UTILS_INCLUDE_DIR}
            -D TEST_BASE_DIR=${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_BASE_DIR}
            -D TEST_UTILS_DIR=${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_UTILS_DIR}
            -D TEST_SOURCE_DIR=${${BUILD_UTILS_PREFIX}BUILD_UTILS_TEST_SRC_DIR}
            -D TEST_NAME=${name}
            -D TEST_BASE_SOURCE_DIR=${it}
            -P "${it}/CMakeLists.txt")
    endif()
endforeach()

