#mark_as_advanced(SQLITE3_LIBRARY SQLITE3_INCLUDE_DIR) 
if(WIN32)
    set(SQLITE3_LIBRARY_DIR "${THIRDPARTY_PATH}/sqlite3")
    set(SQLITE3_INCLUDE_DIR "${THIRDPARTY_PATH}/sqlite3")

    find_path(SQLITE3_INCLUDE_DIR sqlite3.h)

    find_library(SQLITE3_LIBRARY NAMES sqlite3
              PATHS "${SQLITE3_LIBRARY_DIR}")
endif()
if(UNIX)
  find_path(SQLITE3_INCLUDE_DIR sqlite3.h)
  find_library(SQLITE3_LIBRARY NAMES sqlite3)
endif()


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SQLite3 DEFAULT_MSG SQLITE3_LIBRARY SQLITE3_INCLUDE_DIR)

