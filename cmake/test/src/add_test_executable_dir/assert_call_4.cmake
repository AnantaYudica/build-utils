function(assert_call)
    cmake_parse_arguments(assert_call "" "OUTPUT" "ARGS" ${ARGN}) 

    parse_args(dir result_call_args ARGS ${assert_call_ARGS})

    add_test_executable_dir(${dir} ${result_call_args} LIST_TARGET_INCLUDE_DIR_ARG output)

    if (NOT "${EMPTY}${output}" STREQUAL "${EMPTY}")
        set(${assert_call_OUTPUT} "${output}" PARENT_SCOPE)
    else()
        set(${assert_call_OUTPUT} "EMPTY" PARENT_SCOPE)
    endif()

endfunction(assert_call)
