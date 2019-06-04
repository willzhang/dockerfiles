FROM oracle-jdk:1.7

ENV ANT_VERSION=1.7.1
ENV ANT_HOME=/opt/ant

# change to tmp folder
WORKDIR /tmp

COPY apache-ant-${ANT_VERSION}-bin.tar.gz ./

RUN tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /opt/ \
    && ln -s /opt/apache-ant-${ANT_VERSION} /opt/ant \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz.sha512

# add executables to path
RUN update-alternatives --install "/usr/bin/ant" "ant" "/opt/ant/bin/ant" 1 && \
    update-alternatives --set "ant" "/opt/ant/bin/ant" 

# change to root folder
WORKDIR /root
