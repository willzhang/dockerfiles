FROM alpine

WORKDIR /k8s/
RUN apk add --update curl && rm -rf /var/cache/apk/* \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/kubernetes-client-linux-amd64.tar.gz \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/kubernetes-server-linux-amd64.tar.gz \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/kubernetes-node-linux-amd64.tar.gz