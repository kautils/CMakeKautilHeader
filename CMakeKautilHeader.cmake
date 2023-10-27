if(NOT DEFINED KAUTIL_THIRD_PARTY_DIR)
    set(KAUTIL_THIRD_PARTY_DIR ${CMAKE_BINARY_DIR})
    file(MAKE_DIRECTORY "${KAUTIL_THIRD_PARTY_DIR}")
endif()

macro(git_clone url)
    get_filename_component(git_clone.file_name ${url} NAME)
    get_filename_component(git_clone.dir_name ${url} DIRECTORY)
    get_filename_component(git_clone.dir_name ${git_clone.dir_name} NAME)
    set(git_clone.dest "${KAUTIL_THIRD_PARTY_DIR}/kautil_cmake/${git_clone.dir_name}")
    if(NOT EXISTS "${git_clone.dest}/${git_clone.file_name}")
        file(DOWNLOAD ${url} "${git_clone.dest}/${git_clone.file_name}")
    endif()
    include("${git_clone.dest}/${git_clone.file_name}")
    unset(git_clone.dest)
    unset(git_clone.file_name)
    unset(git_clone.dir_name)
endmacro()



