FROM alpine:3.6

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.11.158

RUN \
  apk --no-cache update && \
  apk --no-cache add \
    python py-pip py-setuptools ca-certificates groff less && \
  pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
  rm -rf \
    /var/cache/apk/* \
    /root/.cache

COPY backup-s3.sh /usr/local/bin/backup-s3

WORKDIR /data
