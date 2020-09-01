FROM alpine:latest

RUN apk add --no-cache jq \
    && wget -q -c https://get.helm.sh/helm-$(wget -q -O- https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)-linux-amd64.tar.gz -O - | tar -xz -C /bin/ --strip 1 \
    && chmod u+x /bin/helm

ENTRYPOINT ["helm"]
CMD ["--help"]
