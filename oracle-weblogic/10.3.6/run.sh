docker stop weblogic1036
docker rm weblogic1036
docker run -itd  --name weblogic1036 -e CONFIG_FILE=/data/weblogic/config.sh -v /data/weblogic/:/data/weblogic weblogic:10.3.6
