FROM oracle-jdk:1.6

LABEL MAINTAINER wise2c <admin@wise2c.com>

USER root

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
    FMW_PKG=wls1036_generic.jar

#install Weblogic
COPY $FMW_PKG container-scripts/* /root/Oracle/

RUN chmod +x /root/Oracle/* \
    && java -jar /root/Oracle/$FMW_PKG -mode=silent -silent_xml=/root/Oracle/wls-silent.xml \
    && rm -f /root/Oracle/$FMW_PKG /root/Oracle/wls-silent.xml

ENV DOMIAN_HOME=/root/Oracle/Middleware/user_projects/domains/base_domain \
    PATH=$PATH:$JAVA_HOME/bin:/root/Oracle/Middleware/wlserver_10.3/common/bin:$DOMAIN_HOME/bin \
    CONFIG_JVM_ARGS='-Djava.security.egd=file:/dev/./urandom'

WORKDIR /root/Oracle/Middleware

CMD source /root/Oracle/entrypoint.sh
