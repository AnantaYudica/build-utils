
function(upper_str input output)
    cmake_parse_arguments(upper_str "" "INDEX;LENGTH" "" ${ARGN}) 

    string(LENGTH ${input} input_length)

    if ("${upper_str_INDEX}" STREQUAL "")
        set(index 0)
    elseif(NOT "${upper_str_INDEX}" STREQUAL "")
        set(index ${upper_str_INDEX})
    else()
        message(ERROR "ERROR at INDEX arg")
    endif()

    if ("${upper_str_LENGTH}" STREQUAL "")
        set(length ${input_length})
    elseif (NOT "${upper_str_LENGTH}" STREQUAL "")
        set(length ${upper_str_LENGTH})
    else()
        message(ERROR "ERROR at LENGTH arg")
    endif()

    if (${index} GREATER ${input_length})
        message(STATUS "INDEX : ${index}")
        set(index 0)
        set(length 0)
    elseif(${index} LESS 0)
        set(index 0)
    endif()

    if ("${length}" GREATER "${input_length}")
        math(EXPR length "${input_length}-${index}")
    elseif(${length} LESS 0)
        set(length 0)
    endif()

    math(EXPR input_pre_index 0)
    math(EXPR input_pre_length "${index}")
    math(EXPR input_post_index "${index}+${length}")
    math(EXPR input_post_length "${input_length}-${input_post_index}")

    string(SUBSTRING ${input} ${index} ${length} upper)

    if (NOT ${input_pre_length} EQUAL 0)
        string(SUBSTRING ${input} ${input_pre_index} ${input_pre_length} pre)
    endif()
    if (NOT ${input_post_length} EQUAL 0)
        string(SUBSTRING ${input} ${input_post_index} ${input_post_length} post)
    endif()

    string(TOUPPER ${upper} upper)

    set(${output} "${pre}${upper}${post}" PARENT_SCOPE)

endfunction(upper_str)
