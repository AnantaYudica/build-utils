
function(get_test_target_name_set_prefix prefix output)
    cmake_parse_arguments(get_test_target_name_set_prefix "" "" "ARGS" ${ARGN}) 
    set("${output}" "${prefix}" PARENT_SCOPE)
endfunction(get_test_target_name_set_prefix)
