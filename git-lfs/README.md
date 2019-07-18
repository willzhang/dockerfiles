

```
FROM debian:stretch-slim
LABEL maintainer="stewmcc@gmail.com"

RUN \
  apt-get update && \
  apt-get install -y sudo curl git && \
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
  sudo apt-get install git-lfs
```



```
#!/bin/bash
git lfs clone http://root:wise2c2017@10.0.99.191/test19/hexin01.git hexin01-tmp
cd hexin01-tmp && rm -rf *
git config --global user.email "admin@example.com" 
git config --global user.name "admin"
echo http://root:wise2c2017@10.0.99.191/test19/hexin01.git > .git-credentials
git config --global credential.helper store
cat > .gitattributes << EOF
*.jar filter=lfs diff=lfs merge=lfs -text
*.rar filter=lfs diff=lfs merge=lfs -text
*.doc filter=lfs diff=lfs merge=lfs -text
*.gif filter=lfs diff=lfs merge=lfs -text
*.png filter=lfs diff=lfs merge=lfs -text
*.jpg filter=lfs diff=lfs merge=lfs -text
EOF
\cp -r ../hexin01/* ./
git add -A
git commit -m "update hexin01"
git push origin master
#rm -rf ../hexin01
```








https://github.com/SimSimY/git-lfs

https://github.com/StewMcc/docker-git-lfs/blob/master/Dockerfile

https://github.com/git-lfs/git-lfs/wiki/Installation

https://github.com/jgpelaez/docker-git-lfs/blob/master/Dockerfile
