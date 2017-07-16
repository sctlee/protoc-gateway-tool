GRPC_GATEWAY_PROTO_PATH=/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis
GPRC_PROTO_PATH=/go/protoc/include
protoc_dir=/protoc_dir

echo "generate grpc"
protoc -I$protoc_dir \
  -I$GOPATH/src \
  -I$GRPC_GATEWAY_PROTO_PATH \
  -I$GPRC_PROTO_PATH \
  --go_out=plugins=grpc:$protoc_dir \
  $protoc_dir/*.proto
echo "generate gateway"
protoc -I$protoc_dir \
  -I$GOPATH/src \
  -I$GRPC_GATEWAY_PROTO_PATH \
  -I$GPRC_PROTO_PATH \
  --grpc-gateway_out=logtostderr=true:$protoc_dir \
  $protoc_dir/*.proto
echo "finished"
