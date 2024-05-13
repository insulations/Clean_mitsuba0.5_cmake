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
include src/volume/CMakeFiles/gridvolume.dir/depend.make

# Include the progress variables for this target.
include src/volume/CMakeFiles/gridvolume.dir/progress.make

# Include the compile flags for this target's objects.
include src/volume/CMakeFiles/gridvolume.dir/flags.make

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o: src/volume/CMakeFiles/gridvolume.dir/flags.make
src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o: src/volume/gridvolume.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pony/mitsuba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o"
	cd /home/pony/mitsuba/src/volume && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gridvolume.dir/gridvolume.cpp.o -c /home/pony/mitsuba/src/volume/gridvolume.cpp

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gridvolume.dir/gridvolume.cpp.i"
	cd /home/pony/mitsuba/src/volume && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pony/mitsuba/src/volume/gridvolume.cpp > CMakeFiles/gridvolume.dir/gridvolume.cpp.i

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gridvolume.dir/gridvolume.cpp.s"
	cd /home/pony/mitsuba/src/volume && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pony/mitsuba/src/volume/gridvolume.cpp -o CMakeFiles/gridvolume.dir/gridvolume.cpp.s

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.requires:
.PHONY : src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.requires

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.provides: src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.requires
	$(MAKE) -f src/volume/CMakeFiles/gridvolume.dir/build.make src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.provides.build
.PHONY : src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.provides

src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.provides.build: src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o

# Object files for target gridvolume
gridvolume_OBJECTS = \
"CMakeFiles/gridvolume.dir/gridvolume.cpp.o"

# External object files for target gridvolume
gridvolume_EXTERNAL_OBJECTS =

binaries/plugins/gridvolume.so: src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o
binaries/plugins/gridvolume.so: src/volume/CMakeFiles/gridvolume.dir/build.make
binaries/plugins/gridvolume.so: binaries/libmitsuba-core.so
binaries/plugins/gridvolume.so: binaries/libmitsuba-render.so
binaries/plugins/gridvolume.so: binaries/libmitsuba-core.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libHalf.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libIex.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libImath.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libIlmThread.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libfftw3.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libfftw3_threads.so
binaries/plugins/gridvolume.so: /usr/lib/x86_64-linux-gnu/libxerces-c.so
binaries/plugins/gridvolume.so: src/volume/CMakeFiles/gridvolume.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/gridvolume.so"
	cd /home/pony/mitsuba/src/volume && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gridvolume.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/volume/CMakeFiles/gridvolume.dir/build: binaries/plugins/gridvolume.so
.PHONY : src/volume/CMakeFiles/gridvolume.dir/build

src/volume/CMakeFiles/gridvolume.dir/requires: src/volume/CMakeFiles/gridvolume.dir/gridvolume.cpp.o.requires
.PHONY : src/volume/CMakeFiles/gridvolume.dir/requires

src/volume/CMakeFiles/gridvolume.dir/clean:
	cd /home/pony/mitsuba/src/volume && $(CMAKE_COMMAND) -P CMakeFiles/gridvolume.dir/cmake_clean.cmake
.PHONY : src/volume/CMakeFiles/gridvolume.dir/clean

src/volume/CMakeFiles/gridvolume.dir/depend:
	cd /home/pony/mitsuba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pony/mitsuba /home/pony/mitsuba/src/volume /home/pony/mitsuba /home/pony/mitsuba/src/volume /home/pony/mitsuba/src/volume/CMakeFiles/gridvolume.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/volume/CMakeFiles/gridvolume.dir/depend

