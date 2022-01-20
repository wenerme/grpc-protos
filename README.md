# grpc-protos

A collection of grpc proto

## Repositories

<!-- BEGIN REPO -->

repo | stats
---|---
[chrislusf/seaweedfs](https://github.com/chrislusf/seaweedfs) | ![stars](https://img.shields.io/github/stars/chrislusf/seaweedfs)
[cosmos/cosmos-sdk](https://github.com/cosmos/cosmos-sdk) | ![stars](https://img.shields.io/github/stars/cosmos/cosmos-sdk)
[dexidp/dex](https://github.com/dexidp/dex) | ![stars](https://img.shields.io/github/stars/dexidp/dex)
[envoyproxy/data-plane-api](https://github.com/envoyproxy/data-plane-api) | ![stars](https://img.shields.io/github/stars/envoyproxy/data-plane-api)
[googleapis/api-common-protos](https://github.com/googleapis/api-common-protos) | ![stars](https://img.shields.io/github/stars/googleapis/api-common-protos)
[googleapis/googleapis](https://github.com/googleapis/googleapis) | ![stars](https://img.shields.io/github/stars/googleapis/googleapis)
[grpc/grpc](https://github.com/grpc/grpc) | ![stars](https://img.shields.io/github/stars/grpc/grpc)
[temporalio/api](https://github.com/temporalio/api) | ![stars](https://img.shields.io/github/stars/temporalio/api)
[uber/cadence-idl](https://github.com/uber/cadence-idl) | ![stars](https://img.shields.io/github/stars/uber/cadence-idl)
[yandex-cloud/cloudapi](https://github.com/yandex-cloud/cloudapi) | ![stars](https://img.shields.io/github/stars/yandex-cloud/cloudapi)
<!-- END REPO -->

## Dev

```bash
grpcurl -d '{"service": "grpc.health.v1.Health"}' api.example.com:443 grpc.health.v1.Health/Check
grpcurl -d '{"service": "helloworld.Greeter"}' api.example.com:443 grpc.health.v1.Health/Check

grpcurl api.example.com:443 helloworld.Greeter/SayHello
```
