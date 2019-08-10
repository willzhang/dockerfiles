FROM dorowu/ubuntu-desktop-lxde-vnc
RUN apt-get update -y \
    && apt-get upgrade -y \
    && curl -O https://launcher.mojang.com/download/Minecraft.deb \
    && apt-get install -y ./Minecraft.deb\
    && apt-get clean && apt-get autoclean
