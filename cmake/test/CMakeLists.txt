
if (NOT IS_DIRECTORY "${BASE_SOURCE_DIR}")
    message(FATAL_ERROR "BASE_SOURCE_DIR : \"${BASE_SOURCE_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${INCLUDE_DIR}")
    message(FATAL_ERROR "INCLUDE_DIR : \"${INCLUDE_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${TEST_DIR}")
    message(FATAL_ERROR "TEST_DIR : \"${TEST_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${TEST_UTILS_DIR}")
    message(FATAL_ERROR "TEST_UTILS_DIR : \"${TEST_UTILS_DIR}\" is not directory")
endif()

if (NOT IS_DIRECTORY "${TEST_BUILD_UTILS_DIR}")
    message(FATAL_ERROR "TEST_BUILD_UTILS_DIR : \"${TEST_BUILD_UTILS_DIR}\" is not directory")
endif()

file(GLOB test_build_utils_list "${TEST_BUILD_UTILS_DIR}/*")
foreach(it ${test_build_utils_list})
    set(name "")
    get_filename_component(name "${it}" NAME_WE)
    add_test(NAME upper_str COMMAND ${CMAKE_COMMAND} 
        -D BASE_SOURCE_DIR="${PROJECT_SOURCE_DIR}"
        -D INCLUDE_DIR="${SOURCE_DIR}"
        -D TEST_DIR="${TEST_DIR}"
        -D TEST_UTILS_DIR="${TEST_UTILS_DIR}"
        -D TEST_BUILD_UTILS_DIR="${TEST_BUILD_UTILS_DIR}"
        -P "${it}")
endforeach()

