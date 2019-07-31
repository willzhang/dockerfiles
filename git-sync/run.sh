docker stop git-sync
docker rm git-sync
docker run -itd \
    --name git-sync \
    -e GIT_SYNC_REPO=git@github.com:willzhang/shell.git \
    -e GIT_SYNC_SSH=true \
    willdockerhub/git-sync:v3.1.1
