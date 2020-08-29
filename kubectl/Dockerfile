FROM alpine:latest

RUN wget https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod u+x kubectl && mv kubectl /bin/kubectl

ENTRYPOINT ["kubectl"]
CMD ["--help"]
