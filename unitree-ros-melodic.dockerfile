FROM osrf/ros:melodic-desktop

RUN apt update && apt install -q -y --no-install-recommends \
    # ROS packages and dependencies
    ros-melodic-controller-interface \
    ros-melodic-gazebo-ros-control \
    ros-melodic-joint-state-controller \
    ros-melodic-effort-controllers \
    ros-melodic-joint-trajectory-controller \
    ros-melodic-joint-state-publisher-gui \
    # Tools:
    wget \
    usbutils \
    openssh-client \
    iputils-ping \
    net-tools \
    vim 

# Set ROS setup source into .bashrc for automatic sourcing when starting the container
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

    # Intel/AMD/ATI GPU acceleration dependencies | MESA Driver
    # libgl1-mesa-glx \
    # libgl1-mesa-dri \