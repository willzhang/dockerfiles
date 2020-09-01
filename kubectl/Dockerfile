FROM alpine:latest

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -O /bin/kubectl \
    && chmod u+x /bin/kubectl

ENTRYPOINT ["kubectl"]
CMD ["--help"]
