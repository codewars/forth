FROM ubuntu:18.04

ENV LANG=C.UTF-8
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
# Install GNU Forth Language Environment 0.7.3
# https://packages.ubuntu.com/bionic/gforth
        gforth \
        wget \
        ca-certificates \
    ; \
    rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
    useradd --create-home codewarrior; \
    mkdir /workspace; \
    chown codewarrior:codewarrior /workspace;

USER codewarrior
ENV USER=codewarrior \
    HOME=/home/codewarrior
WORKDIR /workspace

# `ttester-codewars.4th` contains words to make test output in Codewars format.
RUN wget -q https://raw.githubusercontent.com/codewars/ttester-codewars/v0.0.4/ttester-codewars.4th
