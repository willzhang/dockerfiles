FROM registry.cn-shenzhen.aliyuncs.com/kollaimage/centos-binary-openstack-base:train

RUN yum install -y python-devel libffi-devel gcc openssl-devel libselinux-python \
    && yum install -y ansible \
    && yum install -y epel-release \
    && yum install -y python-pip \
    && pip install -U pip \
    && pip install kolla-ansible==9.1.0 --ignore-installed PyYAML

RUN	mkdir -p /etc/kolla \
    && chown $USER:$USER /etc/kolla \
    && cp -r /usr/share/kolla-ansible/etc_examples/kolla/* /etc/kolla \
    && cp /usr/share/kolla-ansible/ansible/inventory/* .
