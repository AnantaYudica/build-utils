function(get_test_target_name_format prefix name tag output)
    cmake_parse_arguments(get_test_target_name_format "" "" "ARGS" ${ARGN}) 
    set("${output}" "${prefix}${name}${tag}" PARENT_SCOPE)
endfunction(get_test_target_name_format)
