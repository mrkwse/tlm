# Locate breakpad library
# This module defines
#  BREAKPAD_FOUND, if false, do not try to link with breakpad
#  BREAKPAD_LIBRARIES, Library path and libs
#  BREAKPAD_INCLUDE_DIR, where to find the ICU headers

string(TOLOWER ${CMAKE_SYSTEM_NAME} LCASE_SYSTEM)

FIND_PATH(BREAKPAD_INCLUDE_DIR client/${LCASE_SYSTEM}/handler/exception_handler.h
          HINTS
               ENV BREAKPAD_DIR
          PATHS
               C:/compile/google-breakpad/src
               /usr/Developer/Projects/breakpad-install-linux/include/breakpad)
IF (WIN32)
  FIND_LIBRARY(BREAKPAD_EXCEPTION_HANDLER_LIBRARY
               NAMES exception_handler
               HINTS
                   ENV BREAKPAD_DIR
               PATHS
                  C:/compile/google-breakpad/src/client/windows/${CMAKE_BUILD_TYPE}/lib
  				 )

  FIND_LIBRARY(BREAKPAD_CRASH_GENERATION_LIBRARY
               NAMES crash_generation_client
               HINTS
                   ENV BREAKPAD_DIR
               PATHS
                  C:/compile/google-breakpad/src/client/windows/${CMAKE_BUILD_TYPE}/lib
  				 )

  FIND_LIBRARY(BREAKPAD_COMMON_LIBRARY
               NAMES common
               HINTS
                   ENV BREAKPAD_DIR
               PATHS
                  C:/compile/google-breakpad/src/client/windows/${CMAKE_BUILD_TYPE}/lib
  				 )
    SET(BREAKPAD_LIBRARIES ${BREAKPAD_EXCEPTION_HANDLER_LIBRARY} ${BREAKPAD_CRASH_GENERATION_LIBRARY} ${BREAKPAD_COMMON_LIBRARY})

ELSE (WIN32)
  FIND_LIBRARY(BREAKPAD_LIBRARIES
               NAMES breakpad_client
               HINTS
                  ENV BREAKPAD_DIR
               PATHS
                  /usr/Developer/Projects/breakpad-install-linux/lib
              )
ENDIF (WIN32)


IF (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)
  SET(BREAKPAD_FOUND true)
  MESSAGE(STATUS "Found breakpad in ${BREAKPAD_INCLUDE_DIR} : ${BREAKPAD_LIBRARIES}")
ELSE (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)
  SET(BREAKPAD_FOUND false)
  MESSAGE(STATUS "Breakpad not found")
ENDIF (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)

MARK_AS_ADVANCED(BREAKPAD_FOUND BREAKPAD_INCLUDE_DIR BREAKPAD_LIBRARIES)
