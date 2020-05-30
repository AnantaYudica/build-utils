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
    TEST_CMAKE_BASE_SRC_DIR ${TEST_CMAKE_BASE_SRC_DIR})

include(${CMAKE_BASE_SRC_DIR}/include_build_util.cmake)
include(${TEST_BASE_DIR}/include_test_util.cmake)

include_build_util(NAME get_test_name_tag_ext_file INCLUDE_DIR ${INCLUDE_DIR})

include_test_util(NAME assert)

set(call_default_1 ${TEST_CMAKE_BASE_SRC_DIR}/assert_call_1.cmake 
    CACHE PATH "call get_test_name_tag_ext_file with args")
set(call_default_2 ${TEST_CMAKE_BASE_SRC_DIR}/assert_call_2.cmake 
    CACHE PATH "call get_test_name_tag_ext_file with args")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "EMPTY;EMPTY;EMPTY")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;0;0;0;0;0;0;0;0;0")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "EMPTY;EMPTY;txt" 
    ARGS "filename;.txt")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;0;0;0;0;0;0;1;1;3" 
    ARGS "filename;.txt")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "EMPTY;test;txt" 
    ARGS "filename;.test.txt")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;0;0;1;1;4;5;1;6;3" 
    ARGS "filename;.test.txt")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;EMPTY;txt" 
    ARGS "filename;name.txt")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;0;4;0;4;1;5;3" 
    ARGS "filename;name.txt")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;name.test.txt")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;1;5;4;9;1;10;3" 
    ARGS "filename;name.test.txt")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;EMPTY;EMPTY" 
    ARGS "filename;name")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;0;4;0;4;0;4;0"  
    ARGS "filename;name")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;dir/dir/name.test.txt;index;8")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "8;4;12;1;13;4;17;1;18;3" 
    ARGS "filename;dir/dir/name.test.txt;index;8")
    
assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;name.test.txt and name2.test2.txt;length;13")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;1;5;4;9;1;10;3" 
    ARGS "filename;name.test.txt and name2.test2.txt;length;13")

assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;dir/dir/name.test.txt and dir/dir/name2.test2.txt;index;8;length;13")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "8;4;12;1;13;4;17;1;18;3" 
    ARGS "filename;dir/dir/name.test.txt and dir/dir/name2.test2.txt;index;8;length;13")
    
assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;name--test.txt;tag_delimiter;--")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;2;6;4;10;1;11;3" 
    ARGS "filename;name--test.txt;tag_delimiter;--")

set(tag_condition ${TEST_CMAKE_BASE_SRC_DIR}/get_test_name_tag_ext_file_tag_condition.cmake 
    CACHE PATH "tag_condition for get_test_name_tag_ext_file")
    
assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;-test-;txt" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition}")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;0;4;6;10;1;11;3" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition}")

set(get_tag ${TEST_CMAKE_BASE_SRC_DIR}/get_test_name_tag_ext_file_get_tag.cmake 
    CACHE PATH "get_tag for get_test_name_tag_ext_file")
    
assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "name;test;txt" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition};get_tag;${get_tag}")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;0;5;4;10;1;11;3" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition};get_tag;${get_tag}")

set(get_name ${TEST_CMAKE_BASE_SRC_DIR}/get_test_name_tag_ext_file_get_name.cmake 
    CACHE PATH "get_name for get_test_name_tag_ext_file")
    
assert(EQUAL STR FOREACH CALL ${call_default_1} LIST_RESULT "NAME;test;txt" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition};get_tag;${get_tag};get_name;${get_name}")
assert(EQUAL FOREACH CALL ${call_default_2} LIST_RESULT "0;4;4;0;5;4;10;1;11;3" 
    ARGS "filename;name-test-.txt;tag_delimiter;-.*-;tag_condition;${tag_condition};get_tag;${get_tag};get_name;${get_name}")
