FROM alpine:3.11

ENV KUBECTL_VERSION="1.18.3"

COPY *.sh /usr/local/bin/

RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl &&\
    chmod +x /usr/local/bin/kubectl &&\
    chmod +x /usr/local/bin/*.sh

ENTRYPOINT ["docker-entrypoint.sh"]
