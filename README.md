# grpc-protos

A collection of grpc proto for

- Learning how to design gRPC API
- Understanding a service by reading API
- Copy & Paste

## Repositories

<!-- BEGIN REPO -->

repo | stats | tags
---|---|---
[adap/flower](https://github.com/adap/flower) | ![stars](https://img.shields.io/github/stars/adap/flower) | ai
[Alluxio/alluxio](https://github.com/Alluxio/alluxio) | ![stars](https://img.shields.io/github/stars/Alluxio/alluxio) | storage
[appleboy/gorush](https://github.com/appleboy/gorush) | ![stars](https://img.shields.io/github/stars/appleboy/gorush) | service
[authzed/spicedb](https://github.com/authzed/spicedb) | ![stars](https://img.shields.io/github/stars/authzed/spicedb) | auth
[camunda/camunda](https://github.com/camunda/camunda) | ![stars](https://img.shields.io/github/stars/camunda/camunda) | workflow
[chrislusf/seaweedfs](https://github.com/chrislusf/seaweedfs) | ![stars](https://img.shields.io/github/stars/chrislusf/seaweedfs) | storage
[cockroachdb/cockroach](https://github.com/cockroachdb/cockroach) | ![stars](https://img.shields.io/github/stars/cockroachdb/cockroach) | database
[conductor-oss/conductor](https://github.com/conductor-oss/conductor) | ![stars](https://img.shields.io/github/stars/conductor-oss/conductor) | workflow
[container-storage-interface/spec](https://github.com/container-storage-interface/spec) | ![stars](https://img.shields.io/github/stars/container-storage-interface/spec) | storage ,kubernetes ,plugin ,spec
[containerd/containerd](https://github.com/containerd/containerd) | ![stars](https://img.shields.io/github/stars/containerd/containerd) | infra
[cosmos/cosmos-sdk](https://github.com/cosmos/cosmos-sdk) | ![stars](https://img.shields.io/github/stars/cosmos/cosmos-sdk) | blockchain
[dexidp/dex](https://github.com/dexidp/dex) | ![stars](https://img.shields.io/github/stars/dexidp/dex) | auth
[dgraph-io/dgo](https://github.com/dgraph-io/dgo) | ![stars](https://img.shields.io/github/stars/dgraph-io/dgo) | database
[envoyproxy/data-plane-api](https://github.com/envoyproxy/data-plane-api) | ![stars](https://img.shields.io/github/stars/envoyproxy/data-plane-api) | infra ,gateway
[envoyproxy/protoc-gen-validate](https://github.com/envoyproxy/protoc-gen-validate) | ![stars](https://img.shields.io/github/stars/envoyproxy/protoc-gen-validate) | core
[esphome/esphome](https://github.com/esphome/esphome) | ![stars](https://img.shields.io/github/stars/esphome/esphome) | iot
[etcd-io/etcd](https://github.com/etcd-io/etcd) | ![stars](https://img.shields.io/github/stars/etcd-io/etcd) | infra
[flyteorg/flyte](https://github.com/flyteorg/flyte) | ![stars](https://img.shields.io/github/stars/flyteorg/flyte) | workflow
[google/perfetto](https://github.com/google/perfetto) | ![stars](https://img.shields.io/github/stars/google/perfetto) | infra
[googleapis/api-common-protos](https://github.com/googleapis/api-common-protos) | ![stars](https://img.shields.io/github/stars/googleapis/api-common-protos) | core
[googleapis/googleapis](https://github.com/googleapis/googleapis) | ![stars](https://img.shields.io/github/stars/googleapis/googleapis) | cloud
[grpc/grpc](https://github.com/grpc/grpc) | ![stars](https://img.shields.io/github/stars/grpc/grpc) | core
[hashicorp/consul](https://github.com/hashicorp/consul) | ![stars](https://img.shields.io/github/stars/hashicorp/consul) | infra
[Kong/kong](https://github.com/Kong/kong) | ![stars](https://img.shields.io/github/stars/Kong/kong) | gateway
[kubernetes/api](https://github.com/kubernetes/api) | ![stars](https://img.shields.io/github/stars/kubernetes/api) | infra ,kubernetes
[kubernetes/cri-api](https://github.com/kubernetes/cri-api) | ![stars](https://img.shields.io/github/stars/kubernetes/cri-api) | infra ,kubernetes
[markphelps/flipt](https://github.com/markphelps/flipt) | ![stars](https://img.shields.io/github/stars/markphelps/flipt) | service
[open-telemetry/opentelemetry-proto](https://github.com/open-telemetry/opentelemetry-proto) | ![stars](https://img.shields.io/github/stars/open-telemetry/opentelemetry-proto) | tracing ,spec
[Permify/permify](https://github.com/Permify/permify) | ![stars](https://img.shields.io/github/stars/Permify/permify) | service
[prometheus/prometheus](https://github.com/prometheus/prometheus) | ![stars](https://img.shields.io/github/stars/prometheus/prometheus) | tracing ,plugin
[SocialSisterYi/bilibili-API-collect](https://github.com/SocialSisterYi/bilibili-API-collect) | ![stars](https://img.shields.io/github/stars/SocialSisterYi/bilibili-API-collect) | service
[techschool/simplebank](https://github.com/techschool/simplebank) | ![stars](https://img.shields.io/github/stars/techschool/simplebank) | demo
[temporalio/api](https://github.com/temporalio/api) | ![stars](https://img.shields.io/github/stars/temporalio/api) | workflow
[uber/cadence-idl](https://github.com/uber/cadence-idl) | ![stars](https://img.shields.io/github/stars/uber/cadence-idl) | workflow
[vitessio/vitess](https://github.com/vitessio/vitess) | ![stars](https://img.shields.io/github/stars/vitessio/vitess) | database
[yandex-cloud/cloudapi](https://github.com/yandex-cloud/cloudapi) | ![stars](https://img.shields.io/github/stars/yandex-cloud/cloudapi) | cloud
<!-- END REPO -->

> Kubernetes's gRPC is generated from Golang

## Dev

```bash
grpcurl -d '{"service": "grpc.health.v1.Health"}' api.example.com:443 grpc.health.v1.Health/Check
grpcurl -d '{"service": "helloworld.Greeter"}' api.example.com:443 grpc.health.v1.Health/Check

grpcurl api.example.com:443 helloworld.Greeter/SayHello
```
