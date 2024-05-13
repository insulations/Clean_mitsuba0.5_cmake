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
include src/integrators/CMakeFiles/multichannel.dir/depend.make

# Include the progress variables for this target.
include src/integrators/CMakeFiles/multichannel.dir/progress.make

# Include the compile flags for this target's objects.
include src/integrators/CMakeFiles/multichannel.dir/flags.make

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o: src/integrators/CMakeFiles/multichannel.dir/flags.make
src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o: src/integrators/misc/multichannel.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pony/mitsuba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o"
	cd /home/pony/mitsuba/src/integrators && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/multichannel.dir/misc/multichannel.cpp.o -c /home/pony/mitsuba/src/integrators/misc/multichannel.cpp

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/multichannel.dir/misc/multichannel.cpp.i"
	cd /home/pony/mitsuba/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pony/mitsuba/src/integrators/misc/multichannel.cpp > CMakeFiles/multichannel.dir/misc/multichannel.cpp.i

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/multichannel.dir/misc/multichannel.cpp.s"
	cd /home/pony/mitsuba/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pony/mitsuba/src/integrators/misc/multichannel.cpp -o CMakeFiles/multichannel.dir/misc/multichannel.cpp.s

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.requires:
.PHONY : src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.requires

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.provides: src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.requires
	$(MAKE) -f src/integrators/CMakeFiles/multichannel.dir/build.make src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.provides.build
.PHONY : src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.provides

src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.provides.build: src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o

# Object files for target multichannel
multichannel_OBJECTS = \
"CMakeFiles/multichannel.dir/misc/multichannel.cpp.o"

# External object files for target multichannel
multichannel_EXTERNAL_OBJECTS =

binaries/plugins/multichannel.so: src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o
binaries/plugins/multichannel.so: src/integrators/CMakeFiles/multichannel.dir/build.make
binaries/plugins/multichannel.so: binaries/libmitsuba-core.so
binaries/plugins/multichannel.so: binaries/libmitsuba-render.so
binaries/plugins/multichannel.so: binaries/libmitsuba-core.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libz.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libpng.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libHalf.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libIex.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libImath.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libIlmThread.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libIlmImf.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libpthread.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libfftw3.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libfftw3_threads.so
binaries/plugins/multichannel.so: /usr/lib/x86_64-linux-gnu/libxerces-c.so
binaries/plugins/multichannel.so: src/integrators/CMakeFiles/multichannel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/multichannel.so"
	cd /home/pony/mitsuba/src/integrators && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multichannel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/integrators/CMakeFiles/multichannel.dir/build: binaries/plugins/multichannel.so
.PHONY : src/integrators/CMakeFiles/multichannel.dir/build

src/integrators/CMakeFiles/multichannel.dir/requires: src/integrators/CMakeFiles/multichannel.dir/misc/multichannel.cpp.o.requires
.PHONY : src/integrators/CMakeFiles/multichannel.dir/requires

src/integrators/CMakeFiles/multichannel.dir/clean:
	cd /home/pony/mitsuba/src/integrators && $(CMAKE_COMMAND) -P CMakeFiles/multichannel.dir/cmake_clean.cmake
.PHONY : src/integrators/CMakeFiles/multichannel.dir/clean

src/integrators/CMakeFiles/multichannel.dir/depend:
	cd /home/pony/mitsuba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pony/mitsuba /home/pony/mitsuba/src/integrators /home/pony/mitsuba /home/pony/mitsuba/src/integrators /home/pony/mitsuba/src/integrators/CMakeFiles/multichannel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/integrators/CMakeFiles/multichannel.dir/depend
