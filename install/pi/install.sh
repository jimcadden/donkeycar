# Script to install everything needed for donkeycar except the donkeycar library

#standard updates (5 min)
sudo dnf update -y
#sudo apt upgrade -y
#sudo rpi-update -y

#helpful libraries (2 min)
sudo dnf install python3-devel python3-distlib python3-setuptools python3-pip python3-wheel -y 

sudo dnf install git cmake pkgconfig -y
sudo dnf install libjpeg-turbo-devel libtiff-devel jasper-devel libpng12-devel -y
#? RPMFusion for libavcodec-dev  libavformat-dev libswscale-dev  (FFmpeg)  libxvidcore-dev libx264-dev (MPEG-4)
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install ffmpeg-devel x264-libs x264-devel xvidcore-devel
sudo dnf install libv4l-devel -y
sudo dnf install atlas-devel gcc-gfortran -y

sudo dnf install zeromq-devel -y
sudo dnf install xsel xclip -y
sudo dnf install python3-h5py -y

#install numpy and pandas (3 min)
sudo dnf install libxml2-devel python3-lxml -y
sudo dnf install libxslt-devel -y

#remove python2 (1 min)
#sudo apt-get remove python2.7 -y
sudo dnf autoremove -y

#install redis-server (1 min)
sudo dnf install redis -y

#create a python virtualenv (2 min)
sudo dnf install python3-virtualenv -y
virtualenv ~/env --system-site-packages --python python3
echo '#start env' >> ~/.bashrc
echo 'source ~/env/bin/activate' >> ~/.bashrc
echo 'export READTHEDOCS=True' >> ~/.bashrc # fix picamera build
source ~/env/bin/activate


#make sure the virtual environment is active
source ~/env/bin/activate

# install pandas and numpy and Adafruit CircuitPython
pip install pandas #also installs numpy

#pip install adafruit-circuitpython-lis3dh #from dev branch

#pip install tensorflow
# TensorFlow wheel for arm64: https://github.com/KumaTea/tensorflow-aarch64
pip install tensorflow -f https://tf.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html

# Avoid "ValueError: Unable to determine if this system is a Raspberry Pi"
pip install git+https://github.com/waveform80/picamera.git
pip install colorzero
