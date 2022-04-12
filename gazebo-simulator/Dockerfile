FROM henry2423/ros-vnc-ubuntu:melodic

### Install as root
## SSH
USER root
RUN apt update && apt install -y openssh-server

## Fix key for apt get
RUN sudo apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt clean && apt update

## Install the simulator
RUN mkdir -p ~/catkin_ws/src/
RUN . /opt/ros/melodic/setup.sh && \ 
    cd ~/catkin_ws/src/ && catkin_init_workspace && \
    cd ~/catkin_ws && catkin_make
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

RUN apt-get -y install ros-melodic-ros-control ros-melodic-gazebo-ros-control \ 
                   ros-melodic-ros-controllers ros-melodic-navigation qt4-default \
                   ros-melodic-ackermann-msgs ros-melodic-serial ros-melodic-teb-local-planner*

RUN cd ~/ && git clone https://github.com/linklab-uva/f1tenth_gtc_tutorial
RUN ln -s ~/f1tenth_gtc_tutorial/src/ ~/catkin_ws/src/
RUN . /opt/ros/melodic/setup.sh && \ 
    cd ~/catkin_ws && catkin_make install

RUN apt-get -y --only-upgrade install ros-*

USER $USER
###

### Run commands
CMD echo $PASSWD | sudo -S service ssh start  && sleep infinity