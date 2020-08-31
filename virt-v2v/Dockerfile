FROM centos:7

RUN yum update -y \
    && yum install -y epel-release \
    && yum install -y virt-v2v \
    && yum clean all

ENTRYPOINT ["/usr/bin/virt-v2v"]
