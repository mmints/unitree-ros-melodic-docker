# Unitree Go1 Docker

A Docker container for ROS _Melodic_ based Unitree robots.

## Build
Get the needed dependencies. Unitrees ROS package repositories are included as Git submodules. To download the submodules either clone using 
`git clone --recurse-submodules` or after `git clone` use `git submodule init` and 
`git submodule update`.

Execute the [build](build_unitree_ros_melodic_container.sh) script:
```
./build_unitree_ros_melodic_container.sh
```

## Run
Execute the [run](build_unitree_ros_melodic_container.sh) script:
```
./build_unitree_ros_melodic_container.sh <optional name>
```
It is possible to set a custom name for the container. If no name is given, the name _"unitree-ros-melodic"_ is used.


## First Start and Setup Catkin Workspace
When you start the container for the first time, you must first set up the Catkin workspace. The following commands have to be called:
```
cd ~/catkin_ws/
catkin_make
```
Then the workspace is set up and the packages or the projects are built in catkin_ws/src.
After the first start, or after the execution of `catkin_make` the following command must be executed:
```
source /root/catkin_ws/devel/setup.bash
```

## View Robot and Launch Gazebo
Check the robot description and visualization in rviz by following command:
```
roslaunch go1_description go1_rviz.launch
```
---

Inside the running container, start the Gazebo simulation environment by following command:
```
roslaunch unitree_gazebo normal.launch rname:=go1 wname:=stairs
```

## Custom Projects and ROS Packages
Custom projects should be placed in `catkin_ws/src/` outside the Docker container. The Docker container is only used to build and run software.

If additional ROS packages or other tools or libraries from `apt` are needed, they should be specified in the [dockerfile](unitree-ros-melodic.dockerfile).