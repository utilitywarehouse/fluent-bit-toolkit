FROM alpine:3.13

ENV KUBECTL_VERSION="1.21.1"

COPY filter-generator namespace-watcher /usr/local/bin/

RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
      && chmod +x /usr/local/bin/kubectl
