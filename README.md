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

## Custom Projects and ROS Packages
Custom projects should be placed in `catkin_ws/src/` outside the Docker container. The Docker container is only used to build and run software.

If additional ROS packages or other tools or libraries from `apt` are needed, they should be specified in the [dockerfile](unitree-ros-melodic.dockerfile).

## View Robot and Launch Gazebo

_The following information is taken from the readme of the project [unitree_ros](https://github.com/unitreerobotics/unitree_ros)_

### The description of robots:
Namely the description of Go1, A1, Aliengo and Laikago. Each package includes mesh, urdf and xacro files of robot. Take Laikago for example, you can check the model in Rviz by:
```
roslaunch laikago_description laikago_rviz.launch
```

### unitree_gazebo & unitree_controller:
You can launch the Gazebo simulation with the following command:
```
roslaunch unitree_gazebo normal.launch rname:=a1 wname:=stairs
```
Where the `rname` means robot name, which can be `laikago`, `aliengo`, `a1` or `go1`. The `wname` means world name, which can be `earth`, `space` or `stairs`. And the default value of `rname` is `laikago`, while the default value of `wname` is `earth`. In Gazebo, the robot should be lying on the ground with joints not activated.

#### 1. Stand controller
After launching the gazebo simulation, you can start to control the robot:
```
rosrun unitree_controller unitree_servo
```

And you can add external disturbances, like a push or a kick:
```
rosrun unitree_controller unitree_external_force
```
#### 2. Position and pose publisher
Here we demonstrated how to control the position and pose of robot without a controller, which should be useful in SLAM or visual development.

Then run the position and pose publisher in another terminal:
```
rosrun unitree_controller unitree_move_kinetic
```
The robot will turn around the origin, which is the movement under the world coordinate frame. And inside of the source file [move_publisher.cpp](https://github.com/unitreerobotics/unitree_ros/blob/master/unitree_controller/src/move_publisher.cpp), we also provide the method to move using the robot coordinate frame. You can change the value of `def_frame` to `coord::ROBOT` and run the catkin_make again, then the `unitree_move_publisher` will move robot under its own coordinate frame.

### z1_controller

You can launch the z1 Gazebo simulation with the following command:

```
roslaunch unitree_gazebo z1.launch
```

After launching the gazebo simulation, you can start to control the z1 robot by z1_sdk.  
see [z1_documentation](dev-z1.unitree.com/5-sdk/run.html)  
You can also send ros commands directly to z1 robot:
```
rosrun z1_controller unitree_move_z1
```