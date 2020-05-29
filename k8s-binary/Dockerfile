FROM alpine

ARG kube_version

WORKDIR /k8s/
RUN apk add --update curl && rm -rf /var/cache/apk/* \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/${kube_version}/kubernetes-client-linux-amd64.tar.gz \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/${kube_verison}/kubernetes-server-linux-amd64.tar.gz \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/${kube_verison}/kubernetes-node-linux-amd64.tar.gz
