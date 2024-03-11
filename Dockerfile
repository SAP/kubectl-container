FROM alpine:3.19

ARG TARGETARCH KUBECTL_VERSION

ENTRYPOINT ["/usr/local/bin/kubectl"]

RUN apk add bash openssl curl jq

RUN curl -sSfL -o /usr/local/bin/kubectl-${KUBECTL_VERSION} https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl \
 && chmod a+x /usr/local/bin/kubectl-${KUBECTL_VERSION} \
 && ln -s kubectl-${KUBECTL_VERSION} /usr/local/bin/kubectl