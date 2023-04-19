docker run \
    -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --mount type=bind,source="$(pwd)/catkin_ws",target=/root/catkin_ws \
    --network=host \
    uneron/unitree-ros-melodic

#     --name go1-ros-container \
