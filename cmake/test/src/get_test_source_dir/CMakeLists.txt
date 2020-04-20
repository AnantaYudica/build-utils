if (NOT BASE_SOURCE_DIR)
    set(BASE_SOURCE_DIR "" CACHE PATH "project directory" FORCE)
endif()

include(${TEST_BASE_DIR}/set_variables.cmake)

set_variables(BASE_SOURCE_DIR ${BASE_SOURCE_DIR} 
    INCLUDE_DIR ${INCLUDE_DIR}
    TEST_BASE_DIR ${TEST_BASE_DIR}
    TEST_UTILS_DIR ${TEST_UTILS_DIR}
    TEST_SOURCE_DIR ${TEST_SOURCE_DIR}
    TEST_NAME ${TEST_NAME}
    TEST_BASE_SOURCE_DIR ${TEST_BASE_SOURCE_DIR})

include(${BASE_SOURCE_DIR}/include_build_util.cmake)
include(${TEST_BASE_DIR}/include_test_util.cmake)

include_build_util(NAME get_test_source_dir INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_1 RECURSIVE 
    INCLUDE_DIR ${INCLUDE_DIR})

set(call_length ${TEST_BASE_SOURCE_DIR}/assert_call_length.cmake 
    CACHE PATH "call length of list args")

set(call_find ${TEST_BASE_SOURCE_DIR}/assert_call_find.cmake
    CACHE PATH "call find of list args")

assert(EQUAL CALL ${call_length} RESULT 0 ARGS )
assert(EQUAL CALL ${call_length} RESULT 9 ARGS ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_1})

set(condition ${TEST_BASE_SOURCE_DIR}/get_test_source_dir_condition.cmake)
set(filter ${TEST_BASE_SOURCE_DIR}/get_test_source_dir_filter.cmake)

get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_2 RECURSIVE
    CONDITION ${condition} INCLUDE_DIR ${INCLUDE_DIR})
    
assert(EQUAL CALL ${call_length} RESULT 4 ARGS ${list_path_2})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_2})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_2})

get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_3 RECURSIVE
    FILTER ${filter} INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_length} RESULT 7 ARGS ${list_path_3})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_3})
 
get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_4 RECURSIVE
    FILTER ${filter} CONDITION ${condition} INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_length} RESULT 3 ARGS ${list_path_4})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_4})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_4})
    
get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_5 INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_length} RESULT 1 ARGS ${list_path_5})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_5})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_5})

get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_6 RECURSIVE
    FILTER ${filter} CONDITION ${condition} 
    FILTER_ARGS "level;3"
    INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_length} RESULT 4 ARGS ${list_path_6})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_6})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_6})

get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_7 RECURSIVE
    FILTER ${filter} CONDITION ${condition} 
    CONDITION_ARGS "name;test2.txt;relative_path_regex;^[^c]+$"
    INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_length} RESULT 2 ARGS ${list_path_7})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_7})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_7})
 
get_test_source_dir(${TEST_BASE_SOURCE_DIR}/dir list_path_8 RECURSIVE
    FILTER ${filter} CONDITION ${condition} 
    FILTER_ARGS "level;3"
    CONDITION_ARGS "name;test2.txt;relative_path_regex;^[^a]+$"
    INCLUDE_DIR ${INCLUDE_DIR})   

assert(EQUAL CALL ${call_length} RESULT 1 ARGS ${list_path_8})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_8})
assert(EQUAL CALL ${call_find} RESULT 0 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_8})