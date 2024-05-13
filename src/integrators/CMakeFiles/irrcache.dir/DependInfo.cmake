# The set of languages for which implicit dependencies are needed:
SET(CMAKE_DEPENDS_LANGUAGES
  "CXX"
  )
# The set of files for implicit dependencies of each language:
SET(CMAKE_DEPENDS_CHECK_CXX
  "/home/pony/mitsuba/src/integrators/misc/irrcache.cpp" "/home/pony/mitsuba/src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o"
  "/home/pony/mitsuba/src/integrators/misc/irrcache_proc.cpp" "/home/pony/mitsuba/src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o"
  "/home/pony/mitsuba/data/pch/mitsuba_precompiled.hpp" "/home/pony/mitsuba/src/integrators/irrcache_pch/mitsuba_precompiled.hpp.gch"
  )
SET(CMAKE_CXX_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
SET(CMAKE_TARGET_DEFINITIONS
  "MTS_DEBUG"
  "MTS_HAS_COHERENT_RT"
  "MTS_HAS_FFTW=1"
  "MTS_HAS_LIBJPEG=1"
  "MTS_HAS_LIBPNG=1"
  "MTS_HAS_OPENEXR=1"
  "MTS_SSE"
  "SINGLE_PRECISION"
  "SPECTRUM_SAMPLES=3"
  )

# Targets to which this target links.
SET(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/pony/mitsuba/src/libcore/CMakeFiles/mitsuba-core.dir/DependInfo.cmake"
  "/home/pony/mitsuba/src/librender/CMakeFiles/mitsuba-render.dir/DependInfo.cmake"
  )

# The include file search paths:
SET(CMAKE_C_TARGET_INCLUDE_PATH
  "include/eigen3"
  "/usr/include/OpenEXR"
  "include"
  "src/integrators"
  )
SET(CMAKE_CXX_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})
SET(CMAKE_Fortran_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})
SET(CMAKE_ASM_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})
