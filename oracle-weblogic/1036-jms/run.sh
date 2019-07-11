docker stop weblogic1036-test
docker rm weblogic1036-test
docker run -itd --name weblogic1036-test \
 -p 7002:7002 \
 -e CONFIG_FILE=/data/config/config.sh \
 -v /data/config/:/data/config \
 weblogic:10.3.6-test
