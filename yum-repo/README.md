# Yum Repo for createrepo、docker-ce-18.06、docker-compose

使用方法

YUM Repo服务器安装好docker，直接运行命令：

docker run -d -p 2009:2009 --name=yum-repo willdockerhub/yum-repo:1.0

在需要安装docker的其它主机上：

创建一个文件 docker-local.repo 并将其拷贝至 /etc/yum.repos.d/

###############################################

[docker-local]

name=docker-local

baseurl=http://repo-server-ip:2009/rpms

enabled=1

gpgcheck=0

###############################################

上面的 repo-server-ip 请写为上述服务器的真实IP地址

# 配置好以后需要使用rpm -ivh安装createrepo rpm包



然后就可以直接用yum install命令命令安装相关软件了。例如：

yum install docker docker-compose


