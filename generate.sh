GRPC_GATEWAY_PROTO_PATH=/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis
GPRC_PROTO_PATH=/go/protoc/include
protoc_dir=/protoc_dir

echo "generate grpc"
protoc --proto_path=$protoc_dir --proto_path=$GRPC_GATEWAY_PROTO_PATH --proto_path=$GPRC_PROTO_PATH \
	--go_out=Mgoogle/api/annotations.proto=github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis/google/api,plugins=grpc:$protoc_dir $protoc_dir/*.proto
echo "generate gateway"
protoc --proto_path=$protoc_dir --proto_path=$GRPC_GATEWAY_PROTO_PATH --proto_path=$GPRC_PROTO_PATH \
	--grpc-gateway_out=logtostderr=true:$protoc_dir  $protoc_dir/*.proto
echo "finished"
