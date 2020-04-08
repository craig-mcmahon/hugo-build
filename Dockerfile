FROM golang:1.13-alpine

ENV HUGO_VERSION=v0.68.3

RUN apk update \
 && apk add --no-cache gcc g++ musl-dev git \
 && mkdir $HOME/src \
 && cd $HOME/src \
 && git clone https://github.com/gohugoio/hugo.git \
 && cd hugo \
 && git checkout ${HUGO_VERSION}  \
 && go install --tags extended \
 && rm -rf $HOME/src
