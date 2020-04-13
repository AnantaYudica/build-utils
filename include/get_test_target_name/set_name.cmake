
function(get_test_target_name_set_name name output)
    cmake_parse_arguments(get_test_target_name_set_name "" "" "ARGS" ${ARGN}) 
    set("${output}" "${name}" PARENT_SCOPE)
endfunction(get_test_target_name_set_name)
