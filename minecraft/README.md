## mclauncher
minecraft client launcher in docker with vnc,just for online, not for play!

## run container
```
docker run -d --name mclauncher \
  --restart always \
  -p 6080:80 \
  -p 5900:5900 \
  -e VNC_PASSWORD=password \
  -m 2G \
  willdockerhub/mclauncher
```

## connect with browers or vnc
```
http://<your-ip>:6080
```

choose:
Games--Minecraft Launcher

or use vnc connect 5900 port.

