#mark_as_advanced(CURL_LIBRARY CURL_INCLUDE_DIR)
set(CURL_INCLUDE_DIR "${THIRDPARTY_PATH}/curl-7.51.0/include")
set(CURL_LIBRARY_DIR "${THIRDPARTY_PATH}/curl-7.51.0/lib/windows/vs2013/x86/md/Release")

find_library(CURL_LIBRARY NAMES curl 
  PATHS "${CURL_INCLUDE_DIR}")

find_path(CURL_INCLUDE_DIR NAMES curl/curl.h)

set(CURL_REQUIRED_VARS CURL_LIBRARY CURL_INCLUDE_DIR)

if(WIN32)
	find_file(CURL_DLL NAMES libcurl.dll libcurl-4.dll
		PATHS
		"C:/Windows/System32"
    "${CURL_LIBRARY_DIR}"
		DOC "Path to the cURL DLL (for installation)")
	mark_as_advanced(CURL_DLL)
	set(CURL_REQUIRED_VARS ${CURL_REQUIRED_VARS} CURL_DLL)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CURL DEFAULT_MSG ${CURL_REQUIRED_VARS})

