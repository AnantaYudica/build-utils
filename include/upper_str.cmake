
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
        math(EXPR length "${input_length}-${index}")
    elseif (NOT "${upper_str_LENGTH}" STREQUAL "")
        set(length ${upper_str_LENGTH})
    else()
        message(ERROR "ERROR at LENGTH arg")
    endif()

    if (${index} GREATER ${input_length})
        set(index 0)
        set(length 0)
    elseif(${index} LESS 0)
        set(index 0)
    endif()

    if (${length} GREATER ${input_length})
        math(EXPR length "${input_length}-${index}")
    elseif(${length} LESS 0)
        set(length 0)
    endif()

    math(EXPR input_pre_index 0)
    math(EXPR input_pre_length "${index}")
    math(EXPR input_post_index "${index}+${length}")
    math(EXPR input_post_length "${input_length}-${input_post_index}")

    string(SUBSTRING ${input} ${index} ${length} upper)

    if (${input_pre_length} GREATER 0)
        string(SUBSTRING ${input} ${input_pre_index} ${input_pre_length} pre)
    endif()
    if (${input_post_length} GREATER 0)
        string(SUBSTRING ${input} ${input_post_index} ${input_post_length} post)
    endif()

    if(NOT ${upper} STREQUAL "")
        string(TOUPPER ${upper} upper)
    endif()

    set(${output} "${pre}${upper}${post}" PARENT_SCOPE)

endfunction(upper_str)
