FROM dorowu/ubuntu-desktop-lxde-vnc:latest
RUN apt update -y \
    && curl -O https://launcher.mojang.com/download/Minecraft.deb \
    && apt install -y ./Minecraft.deb \
    && rm -rf Minecraft.deb \
    && apt clean && apt autoclean
