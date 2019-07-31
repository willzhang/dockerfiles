FROM googlecontainer/git-sync:v3.1.1
COPY id_rsa /etc/git-secret/ssh
ENV GIT_SYNC_SSH=true \
    GIT_KNOWN_HOSTS=false
