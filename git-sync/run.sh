docker stop git-sync
docker rm git-sync
docker run -itd \
    --name git-sync \
    -e GIT_SYNC_REPO=git@github.com:willzhang/shell.git \
    willdockerhub/git-sync:ssh
