FROM golang:1.12-alpine

RUN apk add --no-cache make git

COPY ./ /workspace/

WORKDIR /workspace

RUN make setup build
