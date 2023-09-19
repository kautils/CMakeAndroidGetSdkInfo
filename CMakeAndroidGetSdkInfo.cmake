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

