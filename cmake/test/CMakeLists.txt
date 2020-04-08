
if (NOT IS_DIRECTORY "${BUILD_UTILS_BASE_SOURCE_DIR}")
    message(FATAL_ERROR "BUILD_UTILS_BASE_SOURCE_DIR : \"${BUILD_UTILS_BASE_SOURCE_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${BUILD_UTILS_INCLUDE_DIR}")
    message(FATAL_ERROR "BUILD_UTILS_INCLUDE_DIR : \"${BUILD_UTILS_INCLUDE_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${BUILD_UTILS_TEST_BASE_DIR}")
    message(FATAL_ERROR "BUILD_UTILS_TEST_BASE_DIR : \"${BUILD_UTILS_TEST_BASE_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${BUILD_UTILS_TEST_UTILS_DIR}")
    message(FATAL_ERROR "BUILD_UTILS_TEST_UTILS_DIR : \"${BUILD_UTILS_TEST_UTILS_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${BUILD_UTILS_TEST_SOURCE_DIR}")
    message(FATAL_ERROR "BUILD_UTILS_TEST_SOURCE_DIR : \"${BUILD_UTILS_TEST_SOURCE_DIR}\" is not directory")
endif()

file(GLOB test_build_utils_list "${BUILD_UTILS_TEST_SOURCE_DIR}/*")
foreach(it ${test_build_utils_list})
    if(IS_DIRECTORY ${it})
        set(name "")
        get_filename_component(name "${it}" NAME)
        add_test(NAME "${name}" COMMAND ${CMAKE_COMMAND} 
            -D BASE_SOURCE_DIR=${BUILD_UTILS_BASE_SOURCE_DIR}
            -D INCLUDE_DIR=${BUILD_UTILS_INCLUDE_DIR}
            -D TEST_BASE_DIR=${BUILD_UTILS_TEST_BASE_DIR}
            -D TEST_UTILS_DIR=${BUILD_UTILS_TEST_UTILS_DIR}
            -D TEST_SOURCE_DIR=${BUILD_UTILS_TEST_SOURCE_DIR}
            -D TEST_NAME=${name}
            -D TEST_BASE_SOURCE_DIR=${it}
            -P "${it}/main.cmake")
    endif()
endforeach()

