
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

include_build_util(NAME source_group_dir INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

source_group_dir(root ${TEST_BASE_SOURCE_DIR}/dir 
    OUTPUT_LIST_NAME list_name_1 OUTPUT_LIST_PATH list_path_1
    INCLUDE_DIR ${INCLUDE_DIR})

set(call_length ${TEST_BASE_SOURCE_DIR}/assert_call_length.cmake 
    CACHE PATH "call length of list args")

set(call_find ${TEST_BASE_SOURCE_DIR}/assert_call_find.cmake
    CACHE PATH "call find of list args")

assert(EQUAL CALL ${call_length} RESULT 0 ARGS )
assert(EQUAL CALL ${call_length} RESULT 9 ARGS ${list_name_1})
assert(EQUAL CALL ${call_length} RESULT 9 ARGS ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "root")
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root" ${list_name_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 2 ARGS "root/a" ${list_name_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 3 ARGS "root/b" ${list_name_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/c" ${list_name_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_1})

assert(EQUAL CALL ${call_find} RESULT 2 ARGS "root/c/a" ${list_name_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_1})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test2.txt" ${list_path_1})

set(condition ${TEST_BASE_SOURCE_DIR}/source_group_dir_condition.cmake)
set(filter ${TEST_BASE_SOURCE_DIR}/source_group_dir_filter.cmake)

source_group_dir(root ${TEST_BASE_SOURCE_DIR}/dir 
    CONDITION ${condition}
    OUTPUT_LIST_NAME list_name_2 OUTPUT_LIST_PATH list_path_2
    INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root" ${list_name_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_2})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/a" ${list_name_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_2})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "root/b" ${list_name_2})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/c" ${list_name_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_2})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/c/a" ${list_name_2})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/a/test1.txt" ${list_path_2})

source_group_dir(root ${TEST_BASE_SOURCE_DIR}/dir 
    FILTER ${filter}
    OUTPUT_LIST_NAME list_name_3 OUTPUT_LIST_PATH list_path_3
    INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root" ${list_name_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_3})

assert(EQUAL CALL ${call_find} RESULT 2 ARGS "root/a" ${list_name_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test2.txt" ${list_path_3})

assert(EQUAL CALL ${call_find} RESULT 3 ARGS "root/b" ${list_name_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test1.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test2.txt" ${list_path_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/b/test3.txt" ${list_path_3})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/c" ${list_name_3})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_3})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "root/c/a" ${list_name_3})

source_group_dir(root ${TEST_BASE_SOURCE_DIR}/dir 
    FILTER ${filter} CONDITION ${condition}
    OUTPUT_LIST_NAME list_name_4 OUTPUT_LIST_PATH list_path_4
    INCLUDE_DIR ${INCLUDE_DIR})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root" ${list_name_4})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/test1.txt" ${list_path_4})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/a" ${list_name_4})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/a/test1.txt" ${list_path_4})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "root/b" ${list_name_4})

assert(EQUAL CALL ${call_find} RESULT 1 ARGS "root/c" ${list_name_4})
assert(EQUAL CALL ${call_find} RESULT 1 ARGS "${TEST_BASE_SOURCE_DIR}/dir/c/test1.txt" ${list_path_4})

assert(EQUAL CALL ${call_find} RESULT 0 ARGS "root/c/a" ${list_name_4})
