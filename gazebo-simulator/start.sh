echo "Running docker for ros melodic with gazebo simulation for f1tenth"
echo "Image name should be: simulator"
echo "user:ros, password: ros, vncport: 5901, sshport:1025"
sudo docker run -it -p 5901:5901 -p 6901:6901 -p 1025:22 -d simulator