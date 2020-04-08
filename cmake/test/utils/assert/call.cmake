function(call)
    cmake_parse_arguments(call "" "OUTPUT" "ARGS" ${ARGN}) 
    set(${call_OUTPUT} "${call_ARGS}" PARENT_SCOPE)
endfunction(call)
