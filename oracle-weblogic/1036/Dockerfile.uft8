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
COPY $FMW_PKG container-scripts/entrypoint.sh container-scripts/wls-silent.xml /root/
COPY container-scripts/create-wls-domain.py container-scripts/ds-deploy.py /root/Oracle/

RUN java -jar /root/$FMW_PKG -mode=silent -silent_xml=/root/wls-silent.xml \
    && rm /root/$FMW_PKG /root/wls-silent.xml \
    && chmod +x /root/entrypoint.sh 

ENV DOMIAN_HOME=/root/Oracle/Middleware/user_projects/domains/base_domain \
    PATH=$PATH:$JAVA_HOME/bin:/root/Oracle/Middleware/wlserver_10.3/common/bin:$DOMAIN_HOME/bin \
    CONFIG_JVM_ARGS='-Djava.security.egd=file:/dev/./urandom'

WORKDIR /root/Oracle/Middleware

CMD source /root/entrypoint.sh
