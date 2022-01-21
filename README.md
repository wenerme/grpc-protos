# grpc-protos

A collection of grpc proto for

- Learning how to design gRPC API
- Understanding a service by reading API
- Copy & Paste

## Repositories

<!-- BEGIN REPO -->

repo | stats | tags
---|---|---
[authzed/spicedb](https://github.com/authzed/spicedb) | ![stars](https://img.shields.io/github/stars/authzed/spicedb) | auth
[chrislusf/seaweedfs](https://github.com/chrislusf/seaweedfs) | ![stars](https://img.shields.io/github/stars/chrislusf/seaweedfs) | storage
[cockroachdb/cockroach](https://github.com/cockroachdb/cockroach) | ![stars](https://img.shields.io/github/stars/cockroachdb/cockroach) | database
[containerd/containerd](https://github.com/containerd/containerd) | ![stars](https://img.shields.io/github/stars/containerd/containerd) | infra
[cosmos/cosmos-sdk](https://github.com/cosmos/cosmos-sdk) | ![stars](https://img.shields.io/github/stars/cosmos/cosmos-sdk) | blockchain
[dexidp/dex](https://github.com/dexidp/dex) | ![stars](https://img.shields.io/github/stars/dexidp/dex) | infra
[dgraph-io/dgo](https://github.com/dgraph-io/dgo) | ![stars](https://img.shields.io/github/stars/dgraph-io/dgo) | database
[envoyproxy/data-plane-api](https://github.com/envoyproxy/data-plane-api) | ![stars](https://img.shields.io/github/stars/envoyproxy/data-plane-api) | infra
[envoyproxy/protoc-gen-validate](https://github.com/envoyproxy/protoc-gen-validate) | ![stars](https://img.shields.io/github/stars/envoyproxy/protoc-gen-validate) | core
[esphome/esphome](https://github.com/esphome/esphome) | ![stars](https://img.shields.io/github/stars/esphome/esphome) | iot
[etcd-io/etcd](https://github.com/etcd-io/etcd) | ![stars](https://img.shields.io/github/stars/etcd-io/etcd) | infra
[googleapis/api-common-protos](https://github.com/googleapis/api-common-protos) | ![stars](https://img.shields.io/github/stars/googleapis/api-common-protos) | core
[googleapis/googleapis](https://github.com/googleapis/googleapis) | ![stars](https://img.shields.io/github/stars/googleapis/googleapis) | cloud
[grpc/grpc](https://github.com/grpc/grpc) | ![stars](https://img.shields.io/github/stars/grpc/grpc) | core
[hashicorp/consul](https://github.com/hashicorp/consul) | ![stars](https://img.shields.io/github/stars/hashicorp/consul) | infra
[kubernetes/cri-api](https://github.com/kubernetes/cri-api) | ![stars](https://img.shields.io/github/stars/kubernetes/cri-api) | infra ,kubernetes
[markphelps/flipt](https://github.com/markphelps/flipt) | ![stars](https://img.shields.io/github/stars/markphelps/flipt) | service
[open-telemetry/opentelemetry-proto](https://github.com/open-telemetry/opentelemetry-proto) | ![stars](https://img.shields.io/github/stars/open-telemetry/opentelemetry-proto) | infra
[teamgram/teamgram-server](https://github.com/teamgram/teamgram-server) | ![stars](https://img.shields.io/github/stars/teamgram/teamgram-server) | chat
[temporalio/api](https://github.com/temporalio/api) | ![stars](https://img.shields.io/github/stars/temporalio/api) | workflow
[uber/cadence-idl](https://github.com/uber/cadence-idl) | ![stars](https://img.shields.io/github/stars/uber/cadence-idl) | workflow
[yandex-cloud/cloudapi](https://github.com/yandex-cloud/cloudapi) | ![stars](https://img.shields.io/github/stars/yandex-cloud/cloudapi) | cloud
<!-- END REPO -->

## Dev

```bash
grpcurl -d '{"service": "grpc.health.v1.Health"}' api.example.com:443 grpc.health.v1.Health/Check
grpcurl -d '{"service": "helloworld.Greeter"}' api.example.com:443 grpc.health.v1.Health/Check

grpcurl api.example.com:443 helloworld.Greeter/SayHello
```
