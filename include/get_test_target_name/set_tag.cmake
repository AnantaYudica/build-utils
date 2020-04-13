
function(get_test_target_name_set_tag tag output)
    cmake_parse_arguments(get_test_target_name_set_tag "" "" "ARGS" ${ARGN}) 
    set("${output}" "${tag}" PARENT_SCOPE)
endfunction(get_test_target_name_set_tag)
