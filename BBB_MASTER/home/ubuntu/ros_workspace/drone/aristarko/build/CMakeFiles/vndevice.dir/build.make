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
CMAKE_SOURCE_DIR = /home/ubuntu/ros_workspace/drone/aristarko

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/ros_workspace/drone/aristarko/build

# Include any dependencies generated for this target.
include CMakeFiles/vndevice.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vndevice.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vndevice.dir/flags.make

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: CMakeFiles/vndevice.dir/flags.make
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: ../vnccp/src/vndevice.c
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: ../manifest.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/cpp_common/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rostime/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/roscpp_traits/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/roscpp_serialization/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/genmsg/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/genpy/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/message_runtime/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/std_msgs/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/geometry_msgs/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/catkin/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/gencpp/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/genlisp/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/message_generation/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rosbuild/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rosconsole/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rosgraph_msgs/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/xmlrpcpp/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/roscpp/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rosgraph/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rospack/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/roslib/package.xml
CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o: /opt/ros/indigo/share/rospy/package.xml
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/ros_workspace/drone/aristarko/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o   -c /home/ubuntu/ros_workspace/drone/aristarko/vnccp/src/vndevice.c

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/ros_workspace/drone/aristarko/vnccp/src/vndevice.c > CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.i

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/ros_workspace/drone/aristarko/vnccp/src/vndevice.c -o CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.s

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.requires:
.PHONY : CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.requires

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.provides: CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.requires
	$(MAKE) -f CMakeFiles/vndevice.dir/build.make CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.provides.build
.PHONY : CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.provides

CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.provides.build: CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o

# Object files for target vndevice
vndevice_OBJECTS = \
"CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o"

# External object files for target vndevice
vndevice_EXTERNAL_OBJECTS =

../lib/libvndevice.so: CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o
../lib/libvndevice.so: CMakeFiles/vndevice.dir/build.make
../lib/libvndevice.so: CMakeFiles/vndevice.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library ../lib/libvndevice.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vndevice.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vndevice.dir/build: ../lib/libvndevice.so
.PHONY : CMakeFiles/vndevice.dir/build

CMakeFiles/vndevice.dir/requires: CMakeFiles/vndevice.dir/vnccp/src/vndevice.c.o.requires
.PHONY : CMakeFiles/vndevice.dir/requires

CMakeFiles/vndevice.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vndevice.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vndevice.dir/clean

CMakeFiles/vndevice.dir/depend:
	cd /home/ubuntu/ros_workspace/drone/aristarko/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/ros_workspace/drone/aristarko /home/ubuntu/ros_workspace/drone/aristarko /home/ubuntu/ros_workspace/drone/aristarko/build /home/ubuntu/ros_workspace/drone/aristarko/build /home/ubuntu/ros_workspace/drone/aristarko/build/CMakeFiles/vndevice.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vndevice.dir/depend

