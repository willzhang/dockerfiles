FROM willdockerhub/oracle-jdk:1.6

MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

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
    ANT_VERSION=1.7.1 \
    ANT_VERSION=1.9.13 \
    ANT_HOME=/opt/ant

# change to tmp folder
WORKDIR /tmp

# Download and extract apache ant to opt folder
RUN yum install -y wget \
    && wget --no-check-certificate --no-cookies https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /opt/ \
    && ln -s /opt/apache-ant-${ANT_VERSION} /opt/ant \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz

# add executables to path
RUN update-alternatives --install "/usr/bin/ant" "ant" "/opt/ant/bin/ant" 1 && \
    update-alternatives --set "ant" "/opt/ant/bin/ant"

# change to root folder
WORKDIR /root
