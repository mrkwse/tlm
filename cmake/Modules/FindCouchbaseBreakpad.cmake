# Locate breakpad library
# This module defines
#  BREAKPAD_FOUND, if false, do not try to link with breakpad
#  BREAKPAD_LIBRARIES, Library path and libs
#  BREAKPAD_INCLUDE_DIR, where to find the ICU headers

FIND_PATH(BREAKPAD_INCLUDE_DIR client/windows/handler/exception_handler.h
          HINTS
               ENV BREAKPAD_DIR
          PATHS
               C:/compile/google-breakpad/src)

FIND_LIBRARY(BREAKPAD_LIBRARIES
             NAMES exception_handler
             HINTS
                 ENV BREAKPAD_DIR
             PATHS
                C:/compile/google-breakpad/src/client/windows/${CMAKE_BUILD_TYPE}/lib
				 )

IF (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)
  SET(BREAKPAD_FOUND true)
  MESSAGE(STATUS "Found breakpad in ${BREAKPAD_INCLUDE_DIR} : ${BREAKPAD_LIBRARIES}")
ELSE (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)
  SET(BREAKPAD_FOUND false)
  MESSAGE(STATUS "Breakpad not found")
ENDIF (BREAKPAD_LIBRARIES AND BREAKPAD_INCLUDE_DIR)

MARK_AS_ADVANCED(BREAKPAD_FOUND BREAKPAD_INCLUDE_DIR BREAKPAD_LIBRARIES)
