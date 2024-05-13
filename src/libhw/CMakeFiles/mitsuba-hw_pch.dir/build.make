# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pony/mitsuba

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pony/mitsuba

# Utility rule file for mitsuba-hw_pch.

# Include the progress variables for this target.
include src/libhw/CMakeFiles/mitsuba-hw_pch.dir/progress.make

src/libhw/CMakeFiles/mitsuba-hw_pch: src/libhw/mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch

src/libhw/mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch: data/pch/mitsuba_precompiled.hpp
src/libhw/mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch: data/pch/mitsuba_precompiled.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pony/mitsuba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch"
	cd /home/pony/mitsuba/src/libhw && /usr/bin/cmake -E make_directory /home/pony/mitsuba/src/libhw/mitsuba-hw_pch/.
	cd /home/pony/mitsuba/src/libhw && /usr/bin/c++  -fvisibility=hidden -pipe -march=nocona -ffast-math -Wall -Winvalid-pch -mfpmath=sse -fopenmp -O3 -DNDEBUG -DMTS_DEBUG -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -DMTS_SSE -DMTS_HAS_COHERENT_RT -DMTS_HAS_FFTW=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_OPENEXR=1 -DMTS_BUILD_MODULE=MTS_MODULE_HW -DGLEW_MX -I/home/pony/mitsuba/include/eigen3 -I/usr/include/OpenEXR -I/home/pony/mitsuba/include -fPIC -x c++-header -c -o /home/pony/mitsuba/src/libhw/mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch /home/pony/mitsuba/data/pch/mitsuba_precompiled.hpp

mitsuba-hw_pch: src/libhw/CMakeFiles/mitsuba-hw_pch
mitsuba-hw_pch: src/libhw/mitsuba-hw_pch/./mitsuba_precompiled.hpp.gch
mitsuba-hw_pch: src/libhw/CMakeFiles/mitsuba-hw_pch.dir/build.make
.PHONY : mitsuba-hw_pch

# Rule to build all files generated by this target.
src/libhw/CMakeFiles/mitsuba-hw_pch.dir/build: mitsuba-hw_pch
.PHONY : src/libhw/CMakeFiles/mitsuba-hw_pch.dir/build

src/libhw/CMakeFiles/mitsuba-hw_pch.dir/clean:
	cd /home/pony/mitsuba/src/libhw && $(CMAKE_COMMAND) -P CMakeFiles/mitsuba-hw_pch.dir/cmake_clean.cmake
.PHONY : src/libhw/CMakeFiles/mitsuba-hw_pch.dir/clean

src/libhw/CMakeFiles/mitsuba-hw_pch.dir/depend:
	cd /home/pony/mitsuba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pony/mitsuba /home/pony/mitsuba/src/libhw /home/pony/mitsuba /home/pony/mitsuba/src/libhw /home/pony/mitsuba/src/libhw/CMakeFiles/mitsuba-hw_pch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libhw/CMakeFiles/mitsuba-hw_pch.dir/depend

