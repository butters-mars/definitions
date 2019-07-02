#!/bin/sh

DIR=$1
OUT=$1

protoc -I/usr/local/include -I$DIR \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:$OUT \
  --validate_out=lang=go:$OUT \
  --descriptor_set_out $OUT/descriptor.pb \
  $DIR/*.proto
