# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luna/backup_ws/src/ros_phoenix

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luna/backup_ws/build/ros_phoenix

# Utility rule file for CTRE_Phoenix-unzip.

# Include any custom commands dependencies for this target.
include CMakeFiles/CTRE_Phoenix-unzip.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/CTRE_Phoenix-unzip.dir/progress.make

CMakeFiles/CTRE_Phoenix-unzip: ctre/5.21.2/api-cpp/linux/x86-64/shared/libCTRE_Phoenix.so

ctre/5.21.2/api-cpp/linux/x86-64/shared/libCTRE_Phoenix.so:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/luna/backup_ws/build/ros_phoenix/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Unpacking CTRE_Phoenix"
	cd /home/luna/backup_ws/build/ros_phoenix/ctre/5.21.2/api-cpp && /usr/bin/cmake -E tar xzf /home/luna/backup_ws/build/ros_phoenix/ctre/5.21.2/api-cpp/api-cpp-5.21.2-linuxx86-64.zip
	cd /home/luna/backup_ws/build/ros_phoenix/ctre/5.21.2/api-cpp && /usr/bin/cmake -E tar xzf /home/luna/backup_ws/build/ros_phoenix/ctre/5.21.2/api-cpp/api-cpp-5.21.2-headers.zip

CTRE_Phoenix-unzip: CMakeFiles/CTRE_Phoenix-unzip
CTRE_Phoenix-unzip: ctre/5.21.2/api-cpp/linux/x86-64/shared/libCTRE_Phoenix.so
CTRE_Phoenix-unzip: CMakeFiles/CTRE_Phoenix-unzip.dir/build.make
.PHONY : CTRE_Phoenix-unzip

# Rule to build all files generated by this target.
CMakeFiles/CTRE_Phoenix-unzip.dir/build: CTRE_Phoenix-unzip
.PHONY : CMakeFiles/CTRE_Phoenix-unzip.dir/build

CMakeFiles/CTRE_Phoenix-unzip.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CTRE_Phoenix-unzip.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CTRE_Phoenix-unzip.dir/clean

CMakeFiles/CTRE_Phoenix-unzip.dir/depend:
	cd /home/luna/backup_ws/build/ros_phoenix && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luna/backup_ws/src/ros_phoenix /home/luna/backup_ws/src/ros_phoenix /home/luna/backup_ws/build/ros_phoenix /home/luna/backup_ws/build/ros_phoenix /home/luna/backup_ws/build/ros_phoenix/CMakeFiles/CTRE_Phoenix-unzip.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CTRE_Phoenix-unzip.dir/depend

