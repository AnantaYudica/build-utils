
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

include_build_util(NAME add_test_executable_dir INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

include(${TEST_BASE_SOURCE_DIR}/parse_args.cmake)

set(assert_call_result_list_target_name ${TEST_BASE_SOURCE_DIR}/assert_call_1.cmake)
set(assert_call_result_list_target_dir ${TEST_BASE_SOURCE_DIR}/assert_call_2.cmake)
set(assert_call_result_list_target_lib ${TEST_BASE_SOURCE_DIR}/assert_call_3.cmake)
set(assert_call_result_list_target_include_dir ${TEST_BASE_SOURCE_DIR}/assert_call_4.cmake)
set(assert_call_result_list_target_compile_def ${TEST_BASE_SOURCE_DIR}/assert_call_5.cmake)
set(assert_call_result_list_target_compile_option ${TEST_BASE_SOURCE_DIR}/assert_call_6.cmake)
set(assert_call_result_list_target_property ${TEST_BASE_SOURCE_DIR}/assert_call_7.cmake)
set(assert_call_result_list_target_cmd_arg ${TEST_BASE_SOURCE_DIR}/assert_call_8.cmake)
set(assert_call_result_list_src ${TEST_BASE_SOURCE_DIR}/assert_call_9.cmake)
set(assert_call_result_list_header ${TEST_BASE_SOURCE_DIR}/assert_call_10.cmake)
set(assert_call_result_list_group_name ${TEST_BASE_SOURCE_DIR}/assert_call_11.cmake)

set(args_1 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR}")
string(CONCAT list_src_1 
    "${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt")
string(CONCAT list_group_name_1
    "Source Files")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "test1;test2" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_dir} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_lib} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_cmd_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_1}" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_header} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_1}" 
    ARGS "${args_1}")
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 2
    ARGS "${args_1}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "Source Files" CALL ${assert_call_result_list_group_name} 
    RESULT 2
    ARGS "${args_1}")

set(args_2 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive")
string(CONCAT list_target_name_2
    "test1;test1;test1;test2;test1;test2")
string(CONCAT list_target_dir_2
    "sub1/sub1;sub1;sub2/sub1;sub2/sub1")
string(CONCAT list_src_2 
    "${TEST_BASE_SOURCE_DIR}/dir_1/sub1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test2.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt")
string(CONCAT list_group_name_2
    "Source Files")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "${list_target_name_2}" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_dir} 
    LIST_RESULT "${list_target_dir_2}" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_lib} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_cmd_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_2}" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_header} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_2}" 
    ARGS "${args_2}")
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_2}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "Source Files" CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_2}")

message(FATAL_ERROR "")