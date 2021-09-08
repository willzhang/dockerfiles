FROM curlimages/curl:7.78.0 AS downloader

ARG TARGETOS
ARG TARGETARCH
ARG KUBECTL_VERSION
ARG KUSTOMIZE_VERSION
HELM_VERSION=v3.6.2

WORKDIR /downloads

RUN set -ex; \
    curl -fL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl -o kubectl && \
    chmod +x kubectl

RUN set -ex; \
    curl -fL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_${TARGETOS}_${TARGETARCH}.tar.gz | tar xz && \
    chmod +x kustomize

RUN set -ex; \
    curl -fL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && \
    chmod +x linux-amd64/helm

# Runtime
FROM alpine:3.13.5 AS runtime

RUN apk add --no-cache git

WORKDIR /root

COPY --from=downloader /downloads/kubectl /usr/local/bin/kubectl
COPY --from=downloader /downloads/kustomize /usr/local/bin/kustomize
COPY --from=downloader/linux-amd64/helm /usr/local/bin/helm
