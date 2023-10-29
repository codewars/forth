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

# Testest Forth test framework
RUN wget -q https://raw.githubusercontent.com/codewars/ttester-codewars/v1.1.1/preamble.4th
RUN wget -q https://raw.githubusercontent.com/codewars/ttester-codewars/v1.1.1/protect.4th
RUN wget -q https://raw.githubusercontent.com/codewars/ttester-codewars/v1.1.1/prepare.4th
RUN wget -q https://raw.githubusercontent.com/codewars/ttester-codewars/v1.1.1/testest.4th
