
if(NOT DEFINED KAUTIL_THIRD_PARTY_DIR)
    set(KAUTIL_THIRD_PARTY_DIR ${CMAKE_BINARY_DIR})
    file(MAKE_DIRECTORY "${KAUTIL_THIRD_PARTY_DIR}")
endif()

macro(git_clone url)
    get_filename_component(file_name ${url} NAME)
    if(NOT EXISTS ${KAUTIL_THIRD_PARTY_DIR}/kautil_cmake/${file_name})
        file(DOWNLOAD ${url} "${KAUTIL_THIRD_PARTY_DIR}/kautil_cmake/${file_name}")
    endif()
    include("${KAUTIL_THIRD_PARTY_DIR}/kautil_cmake/${file_name}")
    unset(file_name)
endmacro()
git_clone(https://raw.githubusercontent.com/kautils/CMakeAndroidAapt2CompileDir/v0.0.1/CMakeAndroidAapt2CompileDir.cmake)


macro(CMakeAndroidGetSdkInfo sdk )
    
    set(${PROJECT_NAME}_m_evacu ${m})
    set(m ${PROJECT_NAME}.CMakeAndroidGetSdkInfo)
    list(APPEND ${m}_unsetter ${m}_VERBOSE ${m}_DEBUG_VERBOSE ${m}_ANDROID_SDK ${m}_BUILD_TOOLS_VERSION)
    cmake_parse_arguments(${m} "VERBOSE;DEBUG_VERBOSE" "ANDROID_SDK;BUILD_TOOLS_VERSION" "" ${ARGV})
    
    string(FIND "${${m}_BUILD_TOOLS_VERSION}" "." ${sdk}.api_level)
    string(SUBSTRING "${${m}_BUILD_TOOLS_VERSION}" 0 ${${sdk}.api_level} ${sdk}.api_level )
    set(${sdk}.root ${${m}_ANDROID_SDK})
    set(${sdk}.build_tools_version ${${m}_BUILD_TOOLS_VERSION})
    set(${sdk}.build_tools ${${m}_ANDROID_SDK}/build-tools/${${m}_BUILD_TOOLS_VERSION})
    set(${sdk}.android_jar D:/Android/intelij/platforms/android-${${sdk}.api_level}/android.jar)
    set(${sdk}.aapt2 "${${sdk}.build_tools}/aapt2.exe")
    
    if(NOT EXISTS ${${m}_ANDROID_SDK})
        message(FATAL_ERROR "invalid android sdk : ${${m}_ANDROID_SDK}")
    endif()
    
    if(NOT EXISTS ${${sdk}.build_tools})
        message(FATAL_ERROR "invalid android sdk build tools : ${${sdk}.build_tools}")
    endif()
    
    if(NOT EXISTS ${${sdk}.aapt2})
        message(FATAL_ERROR "invalid android sdk aapt2 : ${${sdk}.aapt2}")
    endif()
    
    if(NOT EXISTS ${${sdk}.android_jar})
        message(FATAL_ERROR "invalid android.jar : ${${sdk}.android_jar}")
    endif()

    foreach(__v ${${m}_unsetter})
        unset(${__v})
    endforeach()
    unset(${m}_unsetter)
    set(m ${${PROJECT_NAME}_m_evacu})
    unset(${PROJECT_NAME}.CMakeAndroidGetSdkInfo)
endmacro()

