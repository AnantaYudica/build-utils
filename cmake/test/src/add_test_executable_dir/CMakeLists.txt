
if (NOT CMAKE_BASE_SRC_DIR)
    set(CMAKE_BASE_SRC_DIR "" CACHE PATH "project directory" FORCE)
endif()

include(${TEST_BASE_DIR}/set_variables.cmake)

set_variables(CMAKE_BASE_SRC_DIR ${CMAKE_BASE_SRC_DIR} 
    INCLUDE_DIR ${INCLUDE_DIR}
    TEST_BASE_DIR ${TEST_BASE_DIR}
    TEST_UTILS_DIR ${TEST_UTILS_DIR}
    TEST_SOURCE_DIR ${TEST_SOURCE_DIR}
    TEST_NAME ${TEST_NAME}
    TEST_BASE_SOURCE_DIR ${TEST_BASE_SOURCE_DIR})

include(${CMAKE_BASE_SRC_DIR}/include_build_util.cmake)
include(${TEST_BASE_DIR}/include_test_util.cmake)

include_build_util(NAME add_test_executable_dir INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

include(${TEST_BASE_SOURCE_DIR}/parse_args.cmake)

set(assert_call_result_list_target_name ${TEST_BASE_SOURCE_DIR}/assert_call_1.cmake)
set(assert_call_result_list_target_dir ${TEST_BASE_SOURCE_DIR}/assert_call_2.cmake)
set(assert_call_result_list_target_link_arg ${TEST_BASE_SOURCE_DIR}/assert_call_3.cmake)
set(assert_call_result_list_target_include_dir_arg ${TEST_BASE_SOURCE_DIR}/assert_call_4.cmake)
set(assert_call_result_list_target_compile_def_arg ${TEST_BASE_SOURCE_DIR}/assert_call_5.cmake)
set(assert_call_result_list_target_compile_option_arg ${TEST_BASE_SOURCE_DIR}/assert_call_6.cmake)
set(assert_call_result_list_target_property_arg ${TEST_BASE_SOURCE_DIR}/assert_call_7.cmake)
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
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_link_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_1}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property_arg} 
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
    "sub1sub1test1;sub1test1;sub2sub1test1;sub2sub1test2;test1;test2")
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
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_link_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_2}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property_arg} 
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
    "beginsub1sub1test1;beginsub1test1;beginsub2sub1test1;beginsub2sub1test2"
    ";begintest1;begintest2")
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
    "sub1sub1test1;sub1test1;sub2sub1test1;sub2sub1test2;test1;test2")
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
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_link_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_include_dir_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_def_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_compile_option_arg} 
    LIST_RESULT "EMPTY" 
    ARGS "${args_4}")
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_property_arg} 
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
    ";list_compile_def_arg;PUBLIC;-DTEST1;PUBLIC;-DTEST2")

assert(EQUAL FOREACH COUNT 
    CALL ${assert_call_result_list_target_compile_def_arg} RESULT 24 
    ARGS "${args_6}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "-DTEST1" 
    CALL ${assert_call_result_list_target_compile_def_arg} RESULT 6 
    ARGS "${args_6}")
assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_compile_def_arg} LIST_RESULT "PUBLIC;-DTEST1;-DTEST2" 
    ARGS "${args_6}")

string(CONCAT args_7 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_compile_option_arg;PUBLIC;-Wall;PUBLIC;-Werror")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_compile_option_arg} 
    RESULT 24 
    ARGS "${args_7}")
assert(EQUAL FOREACH COUNT_IF_STREQUAL "-Wall"
    CALL ${assert_call_result_list_target_compile_option_arg} 
    RESULT 6 
    ARGS "${args_7}")
assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_compile_option_arg} 
    LIST_RESULT "PUBLIC;-Wall;-Werror"
    ARGS "${args_7}")

string(CONCAT args_8 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_include_dir_arg;PUBLIC;/a;PUBLIC;/b")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_include_dir_arg} 
    RESULT 24
    ARGS "${args_8}")

assert(EQUAL FOREACH COUNT_IF_STREQUAL "/a" 
    CALL ${assert_call_result_list_target_include_dir_arg} 
    RESULT 6
    ARGS "${args_8}")
    
assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_include_dir_arg} 
    LIST_RESULT "PUBLIC;/a;/b"
    ARGS "${args_8}")

string(CONCAT args_9 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_link_arg;PUBLIC;lib_a;PUBLIC;lib_b")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_link_arg} 
    RESULT 24
    ARGS "${args_9}")
    
assert(EQUAL FOREACH COUNT_IF_STREQUAL "lib_a"
    CALL ${assert_call_result_list_target_link_arg} 
    RESULT 6
    ARGS "${args_9}")

assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_link_arg} 
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
    ";list_property_arg;FOLDER;test")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_property_arg} 
    RESULT 12 ARGS "${args_11}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_target_property_arg} 
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

string(CONCAT args_13 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";list_other_src;/b/test1.txt;/b/test2.txt;other_src_group_name;b Source Files")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_group_name} 
    RESULT 12
    ARGS "${args_13}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "Source Files;b Source Files"
    ARGS "${args_13}")

string(CONCAT args_14 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_ext;txt")

string(CONCAT list_src_14 
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_14}" 
    ARGS "${args_14}")

string(CONCAT args_15 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_tag;main")

string(CONCAT list_src_15 
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test5.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_15}" 
    ARGS "${args_15}")

string(CONCAT args_16 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_ext;Ini;case_sensitive")

string(CONCAT list_src_16
    "${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini") 

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_16}" 
    ARGS "${args_16}")

string(CONCAT args_17 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_tag;Main;case_sensitive")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini" 
    ARGS "${args_17}")

string(CONCAT args_18 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";list_src_ext;Ini;ini;case_sensitive")

string(CONCAT list_src_18
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test5.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_18}" 
    ARGS "${args_18}")

string(CONCAT args_19 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";list_src_tag;Main;main;case_sensitive")

string(CONCAT list_src_19
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test5.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_19}" 
    ARGS "${args_19}")

string(CONCAT args_20 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_ext;txt")

string(CONCAT list_header_20   
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt")

string(CONCAT list_group_name_20
    "Source Files;Header Files")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 45
    ARGS "${args_20}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_20} 
    ARGS "${args_20}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_20}" 
    ARGS "${args_20}")

string(CONCAT args_21 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_tag;header")

string(CONCAT list_header_21
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 26
    ARGS "${args_21}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_21} 
    ARGS "${args_21}")

string(CONCAT args_22 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR}"
    ";header_tag;header;header_recursive")

string(CONCAT list_header_22
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini")
    
string(CONCAT list_group_name_22
    "Source Files;Header Files;Header Files\\sub1;Header Files\\sub2\\sub1")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 35
    ARGS "${args_22}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_22} 
    ARGS "${args_22}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_22}" 
    ARGS "${args_22}")

string(CONCAT args_23 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_ext;Ini;header_case_sensitive")

string(CONCAT list_header_23
    "${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini") 
    
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 14
    ARGS "${args_23}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_23} 
    ARGS "${args_23}")
    
string(CONCAT args_24 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_tag;Header;header_case_sensitive")
    
string(CONCAT list_header_24
    "${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini") 

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 7
    ARGS "${args_24}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_24} 
    ARGS "${args_24}")

string(CONCAT args_25 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";list_header_ext;ini;Ini;header_case_sensitive")
    
string(CONCAT list_header_25
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test5.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test6.Main.Ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini") 

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 29
    ARGS "${args_25}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_25} 
    ARGS "${args_25}")

string(CONCAT args_26 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";list_header_tag;header;Header;header_case_sensitive")

string(CONCAT list_header_26
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test7.Header.Ini")
    
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 26
    ARGS "${args_26}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_26} 
    ARGS "${args_26}")

string(CONCAT args_27 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_ext;txt;header_group_name;Group Header Files")

string(CONCAT list_group_name_27
    "Source Files;Group Header Files")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_27}" 
    ARGS "${args_27}")

string(CONCAT args_28 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";header_ext;txt;header_tag;header;header_case_sensitive"
    ";base_header_dir;${TEST_BASE_SOURCE_DIR}/dir_2")

string(CONCAT list_header_28
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt")
    
string(CONCAT list_group_name_28
    "Source Files;Header Files;Header Files\\sub1;Header Files\\sub2\\sub1")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 6
    ARGS "${args_28}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_28} 
    ARGS "${args_28}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_28}" 
    ARGS "${args_28}")

string(CONCAT args_29 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_dirname;${TEST_BASE_SOURCE_DIR}/impl/get_dirname.cmake;get_dirname_args;UPPER")

string(CONCAT list_target_dir_29
    "SUB1/SUB1;SUB1;SUB2/SUB1;SUB2/SUB1")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_dir} 
    LIST_RESULT "${list_target_dir_29}" 
    ARGS "${args_29}")

string(CONCAT args_30 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_group_name;${TEST_BASE_SOURCE_DIR}/impl/get_group_name.cmake;get_group_name_args;UPPER")
    
string(CONCAT list_group_name_30
    "SOURCE FILES")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_30}" 
    ARGS "${args_30}")

string(CONCAT args_31 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_header_dir;${TEST_BASE_SOURCE_DIR}/impl/get_header_dir.cmake"
    ";get_header_dir_args;INDEX;1;LIST_HEADER_DIR;EMPTY;${TEST_BASE_SOURCE_DIR}/dir_2"
    ";header_tag;header;header_case_sensitive")

string(CONCAT list_header_31
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt")
    
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 6
    ARGS "${args_31}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_31} 
    ARGS "${args_31}")

string(CONCAT args_32 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR}"
    ";get_header_group_name;${TEST_BASE_SOURCE_DIR}/impl/get_header_group_name.cmake"
    ";get_header_group_name_args;UPPER"
    ";header_tag;header;header_recursive")

string(CONCAT list_group_name_32
    "Source Files;HEADER FILES;HEADER FILES\\SUB1;HEADER FILES\\SUB2\\SUB1")
    
assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "${list_group_name_32}" 
    ARGS "${args_32}")

string(CONCAT list_header_33
    "${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt")

string(CONCAT args_33 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_header;${TEST_BASE_SOURCE_DIR}/impl/get_header.cmake"
    ";get_header_args;LIST_HEADER_PATH;${list_header_33}")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 12
    ARGS "${args_33}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT "${list_header_33}" 
    ARGS "${args_33}")

string(CONCAT args_34 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_other_src_group_name;${TEST_BASE_SOURCE_DIR}/impl/get_other_src_group_name.cmake"
    ";get_other_src_group_name_args;UPPER"
    ";list_other_src;/b/test1.txt;/b/test2.txt")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_group_name} 
    LIST_RESULT "Source Files;OTHER SOURCE FILES"
    ARGS "${args_34}")

string(CONCAT args_35 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_compile;${TEST_BASE_SOURCE_DIR}/impl/get_target_compile.cmake"
    ";get_target_compile_args;UPPER"
    ";list_compile_def_arg;public;-dtest1;public;-dtest2"
    ";list_compile_option_arg;public;-wall;public;-werror")

assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_compile_def_arg} 
    LIST_RESULT "PUBLIC;-DTEST1;-DTEST2" 
    ARGS "${args_35}")

assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_compile_option_arg} 
    LIST_RESULT "PUBLIC;-WALL;-WERROR"
    ARGS "${args_35}")

string(CONCAT args_36 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_dir;${TEST_BASE_SOURCE_DIR}/impl/get_target_dir.cmake"
    ";get_target_dir_args;UPPER")

string(CONCAT list_target_name_36
    "SUB1SUB1test1;SUB1test1;SUB2SUB1test1;SUB2SUB1test2;test1;test2")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "${list_target_name_36}" 
    ARGS "${args_36}")

string(CONCAT args_37 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_include;${TEST_BASE_SOURCE_DIR}/impl/get_target_include.cmake"
    ";get_target_include_args;INCLUDE_BASE_DIR;${TEST_BASE_SOURCE_DIR}/dir_2"
    ";list_include_dir_arg;PUBLIC;test1.header.txt;PUBLIC;sub1/test1.header.txt")

string(CONCAT list_target_include_dir_37 
    "PUBLIC;${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt")

assert(EQUAL STR FOREACH CONTAIN 
    CALL ${assert_call_result_list_target_include_dir_arg} 
    LIST_RESULT "${list_target_include_dir_37}"
    ARGS "${args_37}")

string(CONCAT args_38 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_link;${TEST_BASE_SOURCE_DIR}/impl/get_target_link.cmake"
    ";get_target_link_args;LIST_LINK_INDEX;0;1;4;5"
    ";list_link_arg;PUBLIC;lib_a;PUBLIC;lib_b;PUBLIC;lib_c")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_link_arg} 
    RESULT 24
    ARGS "${args_38}")

assert(EQUAL STR FOREACH CONTAIN
    CALL ${assert_call_result_list_target_link_arg} 
    LIST_RESULT "PUBLIC;lib_a;lib_c"
    ARGS "${args_38}")

string(CONCAT args_39 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_name;${TEST_BASE_SOURCE_DIR}/impl/get_target_name.cmake"
    ";get_target_name_args;UPPER")

string(CONCAT list_target_name_39
    "sub1sub1TEST1;sub1TEST1;sub2sub1TEST1;sub2sub1TEST2;TEST1;TEST2")
    
assert(EQUAL STR FOREACH CALL ${assert_call_result_list_target_name} 
    LIST_RESULT "${list_target_name_39}" 
    ARGS "${args_39}")

string(CONCAT args_40 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_other_src;${TEST_BASE_SOURCE_DIR}/impl/get_target_other_src.cmake"
    ";get_target_other_src_args;LIST_OTHER_SRC_INDEX;1;3"
    ";list_other_src;/b/test1.txt;/b/test2.txt;/b/test3.txt;/b/test4.txt")

string(CONCAT list_src_40 
    "${TEST_BASE_SOURCE_DIR}/dir_1/sub1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/sub2/sub1/test2.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test1.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_1/test2.txt"
    ";/b/test2.txt;/b/test4.txt")
    
assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_src} 
    RESULT 18 
    ARGS "${args_40}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_src} 
    LIST_RESULT ${list_src_40} 
    ARGS "${args_40}")

string(CONCAT args_41 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_target_properties;${TEST_BASE_SOURCE_DIR}/impl/get_target_properties.cmake"
    ";get_target_properties_args;LIST_PROPERTY_INDEX;2;3"
    ";list_property_arg;FOLDER;test1;FOLDER;test2")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_property_arg} 
    RESULT 12 ARGS "${args_41}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_target_property_arg} 
    LIST_RESULT "FOLDER;test2" 
    ARGS "${args_41}")

string(CONCAT args_42 "dir;${TEST_BASE_SOURCE_DIR}/dir_1;include_dir;${INCLUDE_DIR};recursive"
    ";get_test_cmd_args;${TEST_BASE_SOURCE_DIR}/impl/get_test_cmd_args.cmake"
    ";get_test_cmd_args_args;LIST_TEST_CMD_INDEX;2;3"
    ";list_test_cmd_arg;-config;/config1.ini;-config;/config2.ini")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_target_test_cmd_arg} 
    RESULT 12 
    ARGS "${args_42}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_target_test_cmd_arg} 
    LIST_RESULT "-config;/config2.ini" 
    ARGS "${args_42}")

string(CONCAT args_43 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_condition;${TEST_BASE_SOURCE_DIR}/impl/header_condition.cmake"
    ";header_condition_args;HEADER_NAME_REGEX;test1\\.header.*")

string(CONCAT list_header_43
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 11
    ARGS "${args_43}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_43} 
    ARGS "${args_43}")

string(CONCAT args_44 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";header_condition;${TEST_BASE_SOURCE_DIR}/impl/header_condition.cmake"
    ";header_condition_args;HEADER_NAME_REGEX;.*\\.header\\.txt")

string(CONCAT list_header_44
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test1.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test2.header.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test1.header.txt")

assert(EQUAL FOREACH COUNT CALL ${assert_call_result_list_header} 
    RESULT 19
    ARGS "${args_44}")

assert(EQUAL STR FOREACH CONTAIN CALL ${assert_call_result_list_header} 
    LIST_RESULT ${list_header_44} 
    ARGS "${args_44}")

string(CONCAT args_45 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_condition;${TEST_BASE_SOURCE_DIR}/impl/src_condition.cmake"
    ";src_condition_args;SRC_NAME_REGEX;.*main.*")

string(CONCAT list_src_45
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test4.main.ini"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test4.main"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test5.main.ini")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_45}" 
    ARGS "${args_45}")

string(CONCAT args_46 "dir;${TEST_BASE_SOURCE_DIR}/dir_2;include_dir;${INCLUDE_DIR};recursive"
    ";src_filter;${TEST_BASE_SOURCE_DIR}/impl/src_filter.cmake"
    ";src_filter_args;SRC_NAME_REGEX;.*main\\.txt")

string(CONCAT list_src_46
    "${TEST_BASE_SOURCE_DIR}/dir_2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test1.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/sub2/sub1/test3.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test2.main.txt"
    ";${TEST_BASE_SOURCE_DIR}/dir_2/test3.main.txt")

assert(EQUAL STR FOREACH CALL ${assert_call_result_list_src} 
    LIST_RESULT "${list_src_46}" 
    ARGS "${args_46}")
