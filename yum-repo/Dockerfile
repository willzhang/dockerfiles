#########################################################################################
FROM centos:7.4.1708 as build0
ENV EPEL_RELEASE=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    DOCKER_REPO=https://download.docker.com/linux/centos/docker-ce.repo
COPY yum-repo/pkg.list /
RUN mkdir /rpms \
    && yum install -y $EPEL_RELEASE yum-utils \
    && yum-config-manager --add-repo $DOCKER_REPO \
    && yum install -y --downloadonly --downloaddir=/rpms $(cat /pkg.list)

#########################################################################################
FROM centos:7.5.1804 as build1
ENV EPEL_RELEASE=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    DOCKER_REPO=https://download.docker.com/linux/centos/docker-ce.repo
COPY yum-repo/pkg.list /
RUN mkdir /rpms \
    && yum install -y $EPEL_RELEASE yum-utils \
    && yum-config-manager --add-repo $DOCKER_REPO \
    && yum install -y --downloadonly --downloaddir=/rpms $(cat /pkg.list)

#########################################################################################
FROM centos:7.6.1810 as build2
ENV EPEL_RELEASE=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    DOCKER_REPO=https://download.docker.com/linux/centos/docker-ce.repo
COPY yum-repo/pkg.list /
RUN mkdir /rpms \
    && yum install -y $EPEL_RELEASE yum-utils createrepo \
    && yum-config-manager --add-repo $DOCKER_REPO \
    && yum install -y --downloadonly --downloaddir=/rpms $(cat /pkg.list)

COPY --from=build0 /rpms/* /rpms/
COPY --from=build1 /rpms/* /rpms/
RUN createrepo /rpms/	

#########################################################################################	
FROM nginx:alpine
RUN mkdir /usr/share/nginx/html/rpms
COPY --from=build2 /rpms/* /usr/share/nginx/html/rpms/
COPY yum-repo/index.html /usr/share/nginx/html/
COPY yum-repo/nginx.conf /etc/nginx/conf.d/default.conf
