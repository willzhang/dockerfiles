FROM alpine:latest

RUN apk add --no-cache jq \
    && wget https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -O /bin/kubectl \
    && wget -c https://get.helm.sh/helm-$(wget -q -O- https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)-linux-amd64.tar.gz -O - | tar -xz -C /bin/ --strip 1 \
    && chmod u+x /bin/kubectl \
    && chmod u+x /bin/helm

ENTRYPOINT ["kubectl"]
CMD ["--help"]
