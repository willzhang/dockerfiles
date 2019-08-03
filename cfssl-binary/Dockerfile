FROM alpine

WORKDIR /cfssl/
ENV CFSSL_URL=https://pkg.cfssl.org/R1.2
RUN apk add --update curl && rm -rf /var/cache/apk/* \
  && curl -O ${CFSSL_URL}/cfssl_linux-amd64 \
  && curl -O ${CFSSL_URL}/cfssljson_linux-amd64 \
  && curl -O ${CFSSL_URL}/cfssl-certinfo_linux-amd64
