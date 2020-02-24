FROM dorowu/ubuntu-desktop-lxde-vnc:latest \
RUN apt update -y \
    && apt install -y ./Minecraft.deb \
    && rm -rf Minecraft.deb \
    && apt clean && apt autoclean
