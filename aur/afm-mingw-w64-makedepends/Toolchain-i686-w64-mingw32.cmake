SET(CMAKE_SYSTEM_NAME Windows)

# specify the cross compiler
SET(CMAKE_C_COMPILER /usr/bin/i686-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/i686-w64-mingw32-g++)

# pkg-config architeture specific
SET(PKG_CONFIG_FOUND ON)
SET(PKG_CONFIG_EXECUTABLE /usr/bin/i686-w64-mingw32-pkg-config)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/i686-w64-mingw32)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Make sure Qt can be detected by CMake
SET(QT_BINARY_DIR /usr/i686-w64-mingw32/bin /usr/bin)
SET(QT_INCLUDE_DIRS_NO_SYSTEM ON)

# set the resource compiler (RHBZ #652435)
SET(CMAKE_RC_COMPILER /usr/bin/i686-w64-mingw32-windres)
SET(CMAKE_MC_COMPILER /usr/bin/i686-w64-mingw32-windmc)

# override boost thread component suffix as mingw-w64-boost is compiled with threadapi=win32
SET(Boost_THREADAPI win32)

# These are needed for compiling lapack (RHBZ #753906)
SET(CMAKE_Fortran_COMPILER /usr/bin/i686-w64-mingw32-gfortran)
SET(CMAKE_AR:FILEPATH /usr/bin/i686-w64-mingw32-ar)
SET(CMAKE_RANLIB:FILEPATH /usr/bin/i686-w64-mingw32-ranlib)
