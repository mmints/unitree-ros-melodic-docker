#!/bin/bash

if [ -z "$1" ]; then
    container_name="unitree-ros-melodic"
else
    container_name="$1"
fi

docker run \
    -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --mount type=bind,source="$(pwd)/catkin_ws",target=/root/catkin_ws \
    --network=host \
     --name $container_name \
    uneron/unitree-ros-melodic