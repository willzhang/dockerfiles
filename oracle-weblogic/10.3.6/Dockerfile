FROM centos:7.6.1810

LABEL MAINTAINER wise2c <admin@wise2c.com>

# Modify Character Set and Time
RUN yum update -y \
    && yum install -y kde-l10n-Chinese \
    && yum reinstall -y glibc-common \
    && yum clean all && rm -rf /tmp/* rm -rf /var/cache/yum/* \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8 \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8 \
    LC_CTYPE=zh_CN.UTF-8 \
    JAVA_PKG=jdk-6u45-linux-x64.bin \
    FMW_PKG=wls1036_generic.jar \
    JAVA_HOME=/usr/java/default

#install JDK
ADD $JAVA_PKG /usr/java/
RUN cd /usr/java/ \
    && chmod +x /usr/java/$JAVA_PKG \
    && sh $JAVA_PKG \
    && rm $JAVA_PKG \
    && export JAVA_DIR=$(ls -1 -d /usr/java/*) \
    && ln -s $JAVA_DIR /usr/java/latest \
    && ln -s $JAVA_DIR /usr/java/default \
    && alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 \
    && alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 \
    && alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

#install Weblogic
ADD $FMW_PKG container-scripts/* /
RUN chmod +x /entrypoint.sh \
    && java -jar $FMW_PKG -mode=silent -silent_xml=/wls-silent.xml \
    && rm $FMW_PKG wls-silent.xml

ENV PATH=$PATH:$JAVA_HOME/bin:/root/Oracle/Middleware/wlserver_10.3/common/bin:/root/Oracle/Middleware/user_projects/domains/base_domain/bin \
    CONFIG_JVM_ARGS='-Djava.security.egd=file:/dev/./urandom'

WORKDIR /root/Oracle/Middleware

CMD source /entrypoint.sh
