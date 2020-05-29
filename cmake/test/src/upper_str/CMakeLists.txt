
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

include_build_util(NAME upper_str INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

set(call_default_args ${TEST_BASE_SOURCE_DIR}/assert_call_1.cmake 
    CACHE PATH "call upper_str function with default parameter")
set(call_length_args ${TEST_BASE_SOURCE_DIR}/assert_call_2.cmake 
    CACHE PATH "call upper_str function with length parameter")

assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0")

assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0" -1)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0" 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDE0" ARGS "abcDe0" 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDE0" ARGS "abcDe0" 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 3)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 4)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 5)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 6)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 7)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 0 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "AbcDe0" ARGS "abcDe0" 0 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABcDe0" ARGS "abcDe0" 0 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDe0" ARGS "abcDe0" 0 3)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDe0" ARGS "abcDe0" 0 4)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0" 0 5)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0" 0 6)
assert(EQUAL STR CALL ${call_default_args} RESULT "ABCDE0" ARGS "abcDe0" 0 7)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 1 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBcDe0" ARGS "abcDe0" 1 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDe0" ARGS "abcDe0" 1 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDe0" ARGS "abcDe0" 1 3)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDE0" ARGS "abcDe0" 1 4)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDE0" ARGS "abcDe0" 1 5)
assert(EQUAL STR CALL ${call_default_args} RESULT "aBCDE0" ARGS "abcDe0" 1 6)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 2 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDe0" ARGS "abcDe0" 2 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDe0" ARGS "abcDe0" 2 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDE0" ARGS "abcDe0" 2 3)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDE0" ARGS "abcDe0" 2 4)
assert(EQUAL STR CALL ${call_default_args} RESULT "abCDE0" ARGS "abcDe0" 2 5)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 3 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 3 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 3 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 3 3)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 3 4)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 4 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 4 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 4 2)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDE0" ARGS "abcDe0" 4 3)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 5 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 5 1)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 5 2)

assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 6 0)
assert(EQUAL STR CALL ${call_default_args} RESULT "abcDe0" ARGS "abcDe0" 6 1)

assert(EQUAL STR CALL ${call_length_args} RESULT "abcDe0" ARGS "abcDe0" -1)
assert(EQUAL STR CALL ${call_length_args} RESULT "abcDe0" ARGS "abcDe0" 0)
assert(EQUAL STR CALL ${call_length_args} RESULT "AbcDe0" ARGS "abcDe0" 1)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABcDe0" ARGS "abcDe0" 2)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABCDe0" ARGS "abcDe0" 3)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABCDe0" ARGS "abcDe0" 4)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABCDE0" ARGS "abcDe0" 5)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABCDE0" ARGS "abcDe0" 6)
assert(EQUAL STR CALL ${call_length_args} RESULT "ABCDE0" ARGS "abcDe0" 7)
