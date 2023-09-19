### CMakeAndroidGetSdkInfo
* read android build information from specified sdk-root and build-tools-version.  

```cmake
include(CMakeAndroidGetSdkInfo.cmake)
CMakeAndroidGetSdkInfo(sdk ANDROID_SDK path_to_android_sdk_root/intelij BUILD_TOOLS_VERSION 34.0.0)
# if success, set below variable otherwise fatal_error 
    #-- sdk.aapt2=path_to_android_sdk_root/intelij/build-tools/34.0.0/aapt2.exe
    #-- sdk.android_jar=path_to_android_sdk_root/intelij/platforms/android-34/android.jar
    #-- sdk.api_level=34
    #-- sdk.build_tools=path_to_android_sdk_root/intelij/build-tools/34.0.0
    #-- sdk.build_tools_version=34.0.0
    #-- sdk.root=path_to_android_sdk_root/intelij
```