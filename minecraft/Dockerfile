FROM dorowu/ubuntu-desktop-lxde-vncRUN apt-get update -y \
RUN apt update -y \
    && apt install -y ./Minecraft.deb \
    && rm -rf Minecraft.deb \
    && apt clean && apt autoclean
