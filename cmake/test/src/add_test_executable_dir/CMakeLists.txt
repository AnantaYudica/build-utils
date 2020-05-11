
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
set(assert_call_result_list_target_test_cmd_arg ${TEST_BASE_SOURCE_DIR}/assert_call_8.cmake)
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
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_test_cmd_arg} 
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
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_test_cmd_arg} 
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

string(CONCAT args_3 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";prefix;begin")
string(CONCAT list_target_name_3
    "begintest1;begintest1;begintest1;begintest2;begintest1;begintest2")
string(CONCAT list_target_dir_3
    "sub1/sub1;sub1;sub2/sub1;sub2/sub1")
string(CONCAT list_src_3 
    "${TEST_BASE_SOURCE_DIR}/dir_1/sub1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test2.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt")
string(CONCAT list_group_name_3
    "Source Files")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "${list_target_name_3}" 
    ARGS "${args_3}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_dir} 
    LIST_RESULT "${list_target_dir_3}" 
    ARGS "${args_3}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_3}" 
    ARGS "${args_3}")
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_3}" 
    ARGS "${args_3}")
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_3}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "Source Files" CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_3}")

string(CONCAT args_4 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";prefix_dir;root")
string(CONCAT list_target_name_4
    "test1;test1;test1;test2;test1;test2")
string(CONCAT list_target_dir_4
    "root/sub1/sub1;root/sub1;root/sub2/sub1;root/sub2/sub1;root;root")
string(CONCAT list_src_4 
    "${TEST_BASE_SOURCE_DIR}/dir_1/sub1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test2.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt")
string(CONCAT list_group_name_4
    "Source Files")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "${list_target_name_4}" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_dir} 
    LIST_RESULT "${list_target_dir_4}" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_lib} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_test_cmd_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_4}" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_header} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_4}" 
    ARGS "${args_4}")
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_4}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "Source Files" CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_4}")

string(CONCAT args_5 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";src_group_name;Source Group Files")
string(CONCAT list_group_name_5
    "Source Group Files")
    
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_5}" 
    ARGS "${args_5}")
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_5}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "Source Group Files" CALL ${assert_call_result_list_group_name} 
    RESULT 6
    ARGS "${args_5}")

string(CONCAT args_6 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_compile_def;PUBLIC;-DTEST1;PUBLIC;-DTEST2")

assert(EQUAL FOREACH COUNT 
    CALL ${assert_call_result_list_target_compile_def} RESULT 24 
    ARGS "${args_6}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "-DTEST1" 
    CALL ${assert_call_result_list_target_compile_def} RESULT 6 
    ARGS "${args_6}")
assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_compile_def} LIST_RESULT "PUBLIC;-DTEST1;-DTEST2" 
    ARGS "${args_6}")

string(CONCAT args_7 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_compile_option;PUBLIC;-Wall;PUBLIC;-Werror")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_compile_option} 
    RESULT 24 
    ARGS "${args_7}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "-Wall"
    CALL ${assert_call_result_list_target_compile_option} 
    RESULT 6 
    ARGS "${args_7}")
assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_compile_option} 
    LIST_RESULT "PUBLIC;-Wall;-Werror"
    ARGS "${args_7}")

string(CONCAT args_8 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_include_dir;PUBLIC;/a;PUBLIC;/b")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_include_dir} 
    RESULT 24
    ARGS "${args_8}")

assert(EQUAL FOREACH COUNT_IF_STREQUAL "/a" 
    CALL ${assert_call_result_list_target_include_dir} 
    RESULT 6
    ARGS "${args_8}")
    
assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_include_dir} 
    LIST_RESULT "PUBLIC;/a;/b"
    ARGS "${args_8}")

string(CONCAT args_9 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_lib;PUBLIC;lib_a;PUBLIC;lib_b")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_lib} 
    RESULT 24
    ARGS "${args_9}")
    
assert(EQUAL FOREACH COUNT_IF_STREQUAL "lib_a"
    CALL ${assert_call_result_list_target_lib} 
    RESULT 6
    ARGS "${args_9}")

assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_lib} 
    LIST_RESULT "PUBLIC;lib_a;lib_b"
    ARGS "${args_9}")

string(CONCAT args_10 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_other_src;/b/test1.txt;/b/test2.txt")

string(CONCAT list_src_10 
    "${TEST_BASE_SOURCE_DIR}/dir_1/sub1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test2.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt"
    ";/b/test1.txt;/b/test2.txt")
    
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_src} 
    RESULT 18 
    ARGS "${args_10}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_src} 
    LIST_RESULT ${list_src_10} 
    ARGS "${args_10}")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 12
    ARGS "${args_10}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "Source Files;Other Source Files"
    ARGS "${args_10}")

string(CONCAT args_11 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_property;FOLDER;test")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_property} 
    RESULT 12 ARGS "${args_11}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_target_property} 
    LIST_RESULT "FOLDER;test" 
    ARGS "${args_11}")

string(CONCAT args_12 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_test_cmd_arg;-config;/config.ini")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_test_cmd_arg} 
    RESULT 12 
    ARGS "${args_12}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_target_test_cmd_arg} 
    LIST_RESULT "-config;/config.ini" 
    ARGS "${args_12}")

message(FATAL_ERROR "")