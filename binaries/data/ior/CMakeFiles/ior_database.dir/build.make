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

# Utility rule file for ior_database.

# Include the progress variables for this target.
include data/ior/CMakeFiles/ior_database.dir/progress.make

data/ior/CMakeFiles/ior_database: binaries/./data/ior/.iordatabase.flag

binaries/./data/ior/.iordatabase.flag:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pony/mitsuba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying IOR database directory"
	cd /home/pony/mitsuba/data/ior && /usr/bin/cmake -E copy_directory /home/pony/mitsuba/data/ior /home/pony/mitsuba/binaries/./data/ior
	cd /home/pony/mitsuba/data/ior && /usr/bin/cmake -E remove -f /home/pony/mitsuba/binaries/./data/ior/CMakeLists.txt
	cd /home/pony/mitsuba/data/ior && /usr/bin/cmake -E touch /home/pony/mitsuba/binaries/./data/ior/.iordatabase.flag

ior_database: data/ior/CMakeFiles/ior_database
ior_database: binaries/./data/ior/.iordatabase.flag
ior_database: data/ior/CMakeFiles/ior_database.dir/build.make
.PHONY : ior_database

# Rule to build all files generated by this target.
data/ior/CMakeFiles/ior_database.dir/build: ior_database
.PHONY : data/ior/CMakeFiles/ior_database.dir/build

data/ior/CMakeFiles/ior_database.dir/clean:
	cd /home/pony/mitsuba/data/ior && $(CMAKE_COMMAND) -P CMakeFiles/ior_database.dir/cmake_clean.cmake
.PHONY : data/ior/CMakeFiles/ior_database.dir/clean

data/ior/CMakeFiles/ior_database.dir/depend:
	cd /home/pony/mitsuba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pony/mitsuba /home/pony/mitsuba/data/ior /home/pony/mitsuba /home/pony/mitsuba/data/ior /home/pony/mitsuba/data/ior/CMakeFiles/ior_database.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : data/ior/CMakeFiles/ior_database.dir/depend

