#### Yum Repo for createrepo、docker-ce-18.06、docker-compose

### 未安装docker情况下使用本yum源
在线环境取出镜像中的离线包
```
docker pull willdockerhub/yum-repo:v1.0
docker cp willdockerhub/yum-repo:v1.0:/usr/share/nginx/html/rpms /root
```
复制整个rpms目录到离线环境，配置本地yum源
```
cat >> /etc/yum.repo.d/local.repo << EOF
[local]
name=local
baseurl=file:///root/rpms
enabled=1
gpgcheck=0
```
然后就可以直接用yum install命令命令安装相关软件了。例如：
yum install docker docker-compose

#### 已安装docker情况下使用本yum源

YUM Repo服务器安装好docker，直接运行命令：

docker run -d -p 2009:2009 --name=yum-repo willdockerhub/yum-repo:v1.0

在需要安装docker的其它主机上：

创建一个文件local.repo 并将其拷贝至 /etc/yum.repos.d/
```
cat >> /etc/yum.repo.d/local.repo << EOF
[docker-local]
name=docker-local
baseurl=http://repo-server-ip:2009/rpms
enabled=1
gpgcheck=0
EOF
```
上面的 repo-server-ip 请写为上述服务器的真实IP地址.

然后就可以直接用yum install命令命令安装相关软件了。例如：

yum install docker docker-compose

