include(FindPackageHandleStandardArgs)
find_program(R_EXECUTABLE R)
if(R_EXECUTABLE)
    execute_process(COMMAND "${R_EXECUTABLE} RHOME" OUTPUT_VARIABLE R_HOME_DIR OUTPUT_STRIP_TRAILING_WHITESPACE)
#  set(R_HOME ${R_BASE_DIR} CACHE PATH "R home directory obtained from R RHOME")
#  mark_as_advanced(R_HOME)
    execute_process(COMMAND "${R_EXECUTABLE} --slave -e print(Sys.getenv(\"R_INCLUDE_DIR\"))" OUTPUT_VARIABLE TMPSTR OUTPUT_STRIP_TRAILING_WHITESPACE)
#[1] "/usr/share/R/include"
#    string(REGEX REPLACE "[ ]*(R_LIBS_USER)[ ]*\n\"(.*)\"" "\\2"   R_LIBS_USER ${_rlibsuser})
    set(R_INCLUDE_DIR /usr/share/R/include)
    list(APPEND R_INCLUDE_DIRS ${R_INCLUDE_DIR})
endif(R_EXECUTABLE)

find_program(RSCRIPT_EXECUTABLE Rscript)
find_library(R_LIBRARIES R PATHS ${R_HOME_DIR} PATH_SUFFIXES lib)
mark_as_advanced(R_EXECUTABLE R_INCLUDE_DIRS R_LIBRARIES)
find_package_handle_standard_args(R DEFAULT_MSG R_EXECUTABLE R_INCLUDE_DIRS R_LIBRARIES)
