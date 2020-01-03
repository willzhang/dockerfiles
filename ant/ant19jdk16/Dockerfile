FROM willdockerhub/oracle-jdk:1.6

MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

# Modify Character Set and Time
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum -y install kde-l10n-Chinese \
    && yum -y reinstall glibc-common \
    && localedef -c -f GB18030 -i zh_CN zh_CN.GB18030 \
    && echo 'LANG="zh_CN.GB18030"' > /etc/locale.conf \
    && source /etc/locale.conf \
    && yum clean all

ENV LANG=zh_CN.GB18030 \ 
    LC_ALL=zh_CN.GB18030 \
    ANT_VERSION=1.9.13 \
    ANT_HOME=/opt/ant

# change to tmp folder
WORKDIR /tmp

# Download and extract apache ant to opt folder
RUN curl -Lo apache-ant-${ANT_VERSION}-bin.tar.gz https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /opt/ \
    && ln -s /opt/apache-ant-${ANT_VERSION} /opt/ant \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz

# add executables to path
RUN update-alternatives --install "/usr/bin/ant" "ant" "/opt/ant/bin/ant" 1 && \
    update-alternatives --set "ant" "/opt/ant/bin/ant"

# change to root folder
WORKDIR /root
