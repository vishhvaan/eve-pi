FROM arm32v7/ubuntu:latest

COPY docker_install/qemu-arm-static /usr/bin/qemu-arm-static

#RUN [ "/usr/bin/qemu-arm-static", "/bin/sh", "-c", "/bin/echo Hello from ARM container" ]  


RUN apt update
RUN apt install -y python3 python3-pip python3-dev

RUN echo '[global]' >> /etc/pip.conf
RUN echo 'extra-index-url=https://www.piwheels.org/simple' >> /etc/pip.conf

RUN pip3 install numpy slackclient pandas matplotlib configparser
#RUN pip3 install adafruit-circuitpython-ads1x15 adafruit-circuitpython-mcp230xx adafruit-circuitpython-onewire adafruit-circuitpython-ds18x20 numpy slackclient pandas matplotlib configparser
