function(get_test_target_name_format prefix name tag output)
    set("${output}" "${prefix}_${name}_${tag}" PARENT_SCOPE)
endfunction(get_test_target_name_format)
