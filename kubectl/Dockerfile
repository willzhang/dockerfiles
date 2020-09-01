FROM alpine:latest

RUN wget https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod u+x kubectl \
    && mv kubectl /bin/kubectl \
    && apk add jq \
    && wget https://get.helm.sh/helm-$(curl -s https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)-linux-amd64.tar.gz | tar -xf helm-v3.3.1-linux-amd64.tar.gz -C /bin/ --strip 1 \
    && chmod u+x /bin/helm

ENTRYPOINT ["kubectl"]
CMD ["--help"]
