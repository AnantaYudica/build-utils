function(assert_call)
    cmake_parse_arguments(assert_call "" "OUTPUT" "ARGS" ${ARGN}) 
    set(${call_OUTPUT} "${assert_call_ARGS}" PARENT_SCOPE)
endfunction(assert_call)
