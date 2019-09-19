official vagrant-box for latest version centos and ubuntu.
docker run -itd --name centos willdockerhub/vagrant-box:centos
docker cp centos:/CentOS-7.box ./
docker rm -f centos .