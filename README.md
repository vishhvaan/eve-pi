![The EVoltionary biorEactor](https://github.com/vishhvaan/eve-pi/raw/master/eve.png)


The EVE is an open framework for an automated continuous culture system.

  - Easy to use for programmers and non-programmers
  - Cheap
  - Replicate functionality of a morbidostat/chemostat/turbidostat
  - Versatile & easily modifiable for different purposes

This device is meant to be used for the study of population dynamics and evolution.

# Build it!
Head over to [Start Building] folder to find the 3D stls and circuit schematics (along with KiCAD project). 

![PCB](https://raw.githubusercontent.com/vishhvaan/eve-pi/master/Start%20Building/pcb_sche.png)

<p align="center">
  <img src="https://raw.githubusercontent.com/vishhvaan/eve-pi/master/Start%20Building/eve_cu.png" height ="500">
</p>


# Installation

1. Download and flash the [Raspbian] Buster OS on an SD card.
2. Insert the SD Card into the Pi and connect the Pi to a display, keyboard, and the local area network.
3. Note the IP address of the device with the command:
```sh
$ ifconfig
```
4. Enter super user mode with the command:
```sh
$ sudo su
```  
5. Run the setup script by entering the command: 
```sh
$ bash <(curl -s https://raw.githubusercontent.com/vishhvaan/eve-pi/master/st_eve.sh)
```
6. Follow the on-screen instructions to install the software.
7. Navigate to the folder `scripts/live/` and copy the `sample-conf.in` to `eve-conf.ini`.
8. Edit the `eve-conf.ini` file based on the "Configuration File Parameter Definitions" file in the "Start Building" folder.\*
9. If the Pi has a browser, navigate to the web interface by accessing: http://localhost.
10. On a browser on the network, navigate to the web interface by accessing the IP address or hostname of the device (e.g. http://eve.local_domain.net).

\* If the schematic was exactly followed, the default values for the hardware address in the sample-conf.ini file will work and do no tneed to be edited.

## Install for Docker for ARM Devices
 
Pre-built images coming soon to Docker Hub!

### Build the Docker Image

Use the Dockerfiles in the repo to build images yourself. Use the images to spin up containers in the Pi with EVE WebUI and all the programs built-in.

#### On ARM Devices

1. [Install Docker] on the Raspberry Pi.
2. Install git on the Raspberry Pi.
```sh
$ sudo apt install -y git
```  
2. Clone the repository to the home directory.
```sh
$ sudo git clone https://github.com/vishhvaan/eve-pi.git /eve
```  
3. Move to the correct directory.
```sh
$ cd /eve
``` 
4. Run the Docker build command.
```sh
$ docker build -t eve:pi .
```  
5. Create a container.
```sh
$ docker create --name = eve1 \
    -p 80:80 \
    -p 8050:8050 \
    -e PUID=1000 \
    -e PGID=1000 \
    -v /eve/data:/data \
    eve:pi
```  
6. Start the container.
```sh
$ docker start eve1
```  

#### On UNIX-based x86/x64 Devices
Emulate the ARM environment with QEMU. Build images with the Dockerfile.arm32v7.

### Shout Outs
The EVE uses a number of open source projects to work properly:

  - [script-server] -  Script server to run programs on the Pi
  - [slack-api] - Uses the Slack API for Python for experiment monitoring
  - [plotly] - Uses Dash for real-time plotting
  - [KiCAD] - For Circuit Schematics and PCB Designs
  - [Docker] - For creating self-contained application platforms


## New Features
 
  - Configurable save locations (USB or Network)
  - Combined graphs of culture units

<!--![GitHub All Releases](https://img.shields.io/github/downloads/vishhvaan/eve-pi/total)-->

License
----

MIT



   [script-server]: <https://github.com/bugy/script-server>
   [slack-api]: <https://github.com/slackapi/python-slackclient>
   [Start Building]: <https://github.com/vishhvaan/eve-pi/tree/master/Start%20Building>
   [plotly]: <https://plot.ly/dash/>
   [KiCad]: <http://www.kicad-pcb.org/>
   [Install Docker]: <https://github.com/docker/docker-install>
   [Raspbian]: <https://www.raspberrypi.org/downloads/raspbian/>
   [Docker]: <https://github.com/docker/docker-ce>

