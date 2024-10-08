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

# Include any dependencies generated for this target.
include CMakeFiles/smoothsurface.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/smoothsurface.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/smoothsurface.dir/flags.make

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o: CMakeFiles/smoothsurface.dir/flags.make
CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o: smoothsurface.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pony/mitsuba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o -c /home/pony/mitsuba/smoothsurface.cpp

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/smoothsurface.dir/smoothsurface.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pony/mitsuba/smoothsurface.cpp > CMakeFiles/smoothsurface.dir/smoothsurface.cpp.i

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/smoothsurface.dir/smoothsurface.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pony/mitsuba/smoothsurface.cpp -o CMakeFiles/smoothsurface.dir/smoothsurface.cpp.s

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.requires:
.PHONY : CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.requires

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.provides: CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.requires
	$(MAKE) -f CMakeFiles/smoothsurface.dir/build.make CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.provides.build
.PHONY : CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.provides

CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.provides.build: CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o

# Object files for target smoothsurface
smoothsurface_OBJECTS = \
"CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o"

# External object files for target smoothsurface
smoothsurface_EXTERNAL_OBJECTS =

binaries/plugins/smoothsurface.so: CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o
binaries/plugins/smoothsurface.so: CMakeFiles/smoothsurface.dir/build.make
binaries/plugins/smoothsurface.so: binaries/libmitsuba-core.so
binaries/plugins/smoothsurface.so: binaries/libmitsuba-render.so
binaries/plugins/smoothsurface.so: binaries/libmitsuba-hw.so
binaries/plugins/smoothsurface.so: binaries/libmitsuba-render.so
binaries/plugins/smoothsurface.so: binaries/libmitsuba-core.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libHalf.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libIex.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libImath.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libIlmThread.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libfftw3.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libfftw3_threads.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libxerces-c.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGLU.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGL.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libSM.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libICE.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libX11.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libXext.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGLEWmx.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGLU.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGL.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libSM.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libICE.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libX11.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libXext.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libGLEWmx.so
binaries/plugins/smoothsurface.so: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
binaries/plugins/smoothsurface.so: CMakeFiles/smoothsurface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module binaries/plugins/smoothsurface.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/smoothsurface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/smoothsurface.dir/build: binaries/plugins/smoothsurface.so
.PHONY : CMakeFiles/smoothsurface.dir/build

CMakeFiles/smoothsurface.dir/requires: CMakeFiles/smoothsurface.dir/smoothsurface.cpp.o.requires
.PHONY : CMakeFiles/smoothsurface.dir/requires

CMakeFiles/smoothsurface.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/smoothsurface.dir/cmake_clean.cmake
.PHONY : CMakeFiles/smoothsurface.dir/clean

CMakeFiles/smoothsurface.dir/depend:
	cd /home/pony/mitsuba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pony/mitsuba /home/pony/mitsuba /home/pony/mitsuba /home/pony/mitsuba /home/pony/mitsuba/CMakeFiles/smoothsurface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/smoothsurface.dir/depend

