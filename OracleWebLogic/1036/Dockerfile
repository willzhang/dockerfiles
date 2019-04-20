FROM registry.access.redhat.com/rhel6.5:latest

MAINTAINER wise2c <admin@wise2c.com>

USER root

COPY jdk-6u45-linux-x64.bin wls1036_generic.jar wls-silent.xml entrypoint.sh create-wls-domain.py /

RUN curl -o /etc/yum.repos.d/Centos-6.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
    && sed -i "s;\$releasever;6;g" /etc/yum.repos.d/Centos-6.repo \
    && yum update -y \
    && yum install -y kde-l10n-Chinese glibc-common \
    && localedef -i zh_CN -f GB18030 zh_CN.GB18030 \
    && echo LANG="zh_CN.GB18030" > /etc/locale.conf \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone \
    && yum clean all

RUN chmod +x /entrypoint.sh \
    && chmod +x /jdk-6u45-linux-x64.bin \
    && ./jdk-6u45-linux-x64.bin \
    && mkdir /usr/java \
    && mv ./jdk1.6.0_45 /usr/java/ \
    && /usr/java/jdk1.6.0_45/bin/java -jar wls1036_generic.jar -mode=silent -silent_xml=/wls-silent.xml \
    && rm jdk-6u45-linux-x64.bin wls1036_generic.jar wls-silent.xml

ENV LANG=zh_CN.GB18030 \
    LC_ALL=zh_CN.GB18030 \
    JAVA_HOME=/usr/java/jdk1.6.0_45 \
    JRE_HOME=/usr/java/jdk1.6.0_45/jre \
    CLASSPATH=".:/usr/java/jdk1.6.0_45/lib/dt.jar:/usr/java/jdk1.6.0_45/lib/tools.jar"  \
    PATH=$PATH:$JAVA_HOME/bin:/root/Oracle/Middleware/wlserver_10.3/common/bin:/root/Oracle/Middleware/user_projects/domains/base_domain/bin \
    CONFIG_JVM_ARGS='-Djava.security.egd=file:/dev/./urandom'

WORKDIR /root/Oracle/Middleware

CMD source entrypoint.sh
