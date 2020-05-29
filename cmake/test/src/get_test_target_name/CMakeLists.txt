if (NOT CMAKE_BASE_SRC_DIR)
    set(CMAKE_BASE_SRC_DIR "" CACHE PATH "project directory" FORCE)
endif()

include(${TEST_BASE_DIR}/set_variables.cmake)

set_variables(CMAKE_BASE_SRC_DIR ${CMAKE_BASE_SRC_DIR} 
    INCLUDE_DIR ${INCLUDE_DIR}
    TEST_BASE_DIR ${TEST_BASE_DIR}
    TEST_UTILS_DIR ${TEST_UTILS_DIR}
    TEST_SRC_DIR ${TEST_SRC_DIR}
    TEST_NAME ${TEST_NAME}
    TEST_BASE_SOURCE_DIR ${TEST_BASE_SOURCE_DIR})

include(${CMAKE_BASE_SRC_DIR}/include_build_util.cmake)
include(${TEST_BASE_DIR}/include_test_util.cmake)

include_build_util(NAME get_test_target_name INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

set(call_default ${TEST_BASE_SOURCE_DIR}/assert_call.cmake 
    CACHE PATH "call get_test_target_name with args")

set(format ${TEST_BASE_SOURCE_DIR}/get_test_target_name_format.cmake 
    CACHE PATH "format for get_test_target_name")
set(set_prefix ${TEST_BASE_SOURCE_DIR}/get_test_target_name_set_prefix.cmake 
    CACHE PATH "set prefix for get_test_target_name")
set(set_name ${TEST_BASE_SOURCE_DIR}/get_test_target_name_set_name.cmake 
    CACHE PATH "set name for get_test_target_name")
set(set_tag ${TEST_BASE_SOURCE_DIR}/get_test_target_name_set_tag.cmake 
    CACHE PATH "set tag for get_test_target_name")

assert(EQUAL STR CALL ${call_default} RESULT "call" ARGS "prefix;call")
assert(EQUAL STR CALL ${call_default} RESULT "calltest" ARGS "name;test;prefix;call")
assert(EQUAL STR CALL ${call_default} RESULT "calltestgo" ARGS "name;test;prefix;call;tag;go")
assert(EQUAL STR CALL ${call_default} RESULT "callgo" ARGS "prefix;call;tag;go")
assert(EQUAL STR CALL ${call_default} RESULT "test" ARGS "name;test")
assert(EQUAL STR CALL ${call_default} RESULT "testgo" ARGS "name;test;tag;go")
assert(EQUAL STR CALL ${call_default} RESULT "go" ARGS "tag;go")

assert(EQUAL STR CALL ${call_default} RESULT "call-1" 
    ARGS "prefix;call;set_prefix;${set_prefix};prefix_args;1")
assert(EQUAL STR CALL ${call_default} RESULT "test-2" 
    ARGS "name;test;set_name;${set_name};name_args;2")
assert(EQUAL STR CALL ${call_default} RESULT "go-3" 
    ARGS "tag;go;set_tag;${set_tag};tag_args;3")

assert(EQUAL STR CALL ${call_default} RESULT "call-1test-2go-3" 
    ARGS "name;test;prefix;call;tag;go;set_prefix;${set_prefix};set_name;${set_name};set_tag;${set_tag};prefix_args;1;name_args;2;tag_args;3")

    assert(EQUAL STR CALL ${call_default} RESULT "call-1_test-2_go-3" 
    ARGS "name;test;prefix;call;tag;go;format;${format};set_prefix;${set_prefix};set_name;${set_name};set_tag;${set_tag};prefix_args;1;name_args;2;tag_args;3")

