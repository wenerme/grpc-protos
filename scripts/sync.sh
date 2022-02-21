#!/usr/bin/env bash
set -euxo pipefail
echo -e "\n# synching dexidp/dex"
[ ! -e gits/dexidp/dex ] || ( git -C gits/dexidp/dex fetch --depth 1 && git -C gits/dexidp/dex reset --hard origin )
[ -e gits/dexidp/dex ] || git clone --depth 1 git@github.com:dexidp/dex.git gits/dexidp/dex
mkdir -p dex/api/
test -e gits/dexidp/dex/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/dexidp/dex/api/ dex/api/
test -z "$(find dex/api/ -maxdepth 0 -empty)"

echo -e "\n# synching googleapis/api-common-protos"
[ ! -e gits/googleapis/api-common-protos ] || ( git -C gits/googleapis/api-common-protos fetch --depth 1 && git -C gits/googleapis/api-common-protos reset --hard origin )
[ -e gits/googleapis/api-common-protos ] || git clone --depth 1 git@github.com:googleapis/api-common-protos.git gits/googleapis/api-common-protos
mkdir -p google/
test -e gits/googleapis/api-common-protos/google/
rsync -avm    --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/api-common-protos/google/ google/
test -z "$(find google/ -maxdepth 0 -empty)"

echo -e "\n# synching googleapis/googleapis"
[ ! -e gits/googleapis/googleapis ] || ( git -C gits/googleapis/googleapis fetch --depth 1 && git -C gits/googleapis/googleapis reset --hard origin )
[ -e gits/googleapis/googleapis ] || git clone --depth 1 git@github.com:googleapis/googleapis.git gits/googleapis/googleapis
mkdir -p google/ grafeas/
test -e gits/googleapis/googleapis/google/
rsync -avm    --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/googleapis/google/ google/
test -z "$(find google/ -maxdepth 0 -empty)"
test -e gits/googleapis/googleapis/grafeas/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/googleapis/grafeas/ grafeas/
test -z "$(find grafeas/ -maxdepth 0 -empty)"

echo -e "\n# synching temporalio/api"
[ ! -e gits/temporalio/api ] || ( git -C gits/temporalio/api fetch --depth 1 && git -C gits/temporalio/api reset --hard origin )
[ -e gits/temporalio/api ] || git clone --depth 1 git@github.com:temporalio/api.git gits/temporalio/api
mkdir -p temporal/api/
test -e gits/temporalio/api/temporal/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/temporalio/api/temporal/api/ temporal/api/
test -z "$(find temporal/api/ -maxdepth 0 -empty)"

echo -e "\n# synching uber/cadence-idl"
[ ! -e gits/uber/cadence-idl ] || ( git -C gits/uber/cadence-idl fetch --depth 1 && git -C gits/uber/cadence-idl reset --hard origin )
[ -e gits/uber/cadence-idl ] || git clone --depth 1 git@github.com:uber/cadence-idl.git gits/uber/cadence-idl
mkdir -p uber/
test -e gits/uber/cadence-idl/proto/uber/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/uber/cadence-idl/proto/uber/ uber/
test -z "$(find uber/ -maxdepth 0 -empty)"

echo -e "\n# synching yandex-cloud/cloudapi"
[ ! -e gits/yandex-cloud/cloudapi ] || ( git -C gits/yandex-cloud/cloudapi fetch --depth 1 && git -C gits/yandex-cloud/cloudapi reset --hard origin )
[ -e gits/yandex-cloud/cloudapi ] || git clone --depth 1 git@github.com:yandex-cloud/cloudapi.git gits/yandex-cloud/cloudapi
mkdir -p yandex/
test -e gits/yandex-cloud/cloudapi/yandex/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/yandex-cloud/cloudapi/yandex/ yandex/
test -z "$(find yandex/ -maxdepth 0 -empty)"

echo -e "\n# synching grpc/grpc"
[ ! -e gits/grpc/grpc ] || ( git -C gits/grpc/grpc fetch --depth 1 && git -C gits/grpc/grpc reset --hard origin )
[ -e gits/grpc/grpc ] || git clone --depth 1 git@github.com:grpc/grpc.git gits/grpc/grpc
mkdir -p grpc/ examples/
test -e gits/grpc/grpc/src/proto/grpc/
rsync -avm  --delete --delete-excluded --exclude 'xds/*'  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/grpc/grpc/src/proto/grpc/ grpc/
test -z "$(find grpc/ -maxdepth 0 -empty)"
test -e gits/grpc/grpc/examples/protos/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/grpc/grpc/examples/protos/ examples/
test -z "$(find examples/ -maxdepth 0 -empty)"

echo -e "\n# synching cosmos/cosmos-sdk"
[ ! -e gits/cosmos/cosmos-sdk ] || ( git -C gits/cosmos/cosmos-sdk fetch --depth 1 && git -C gits/cosmos/cosmos-sdk reset --hard origin )
[ -e gits/cosmos/cosmos-sdk ] || git clone --depth 1 git@github.com:cosmos/cosmos-sdk.git gits/cosmos/cosmos-sdk
mkdir -p cosmos/
test -e gits/cosmos/cosmos-sdk/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cosmos/cosmos-sdk/proto/ cosmos/
test -z "$(find cosmos/ -maxdepth 0 -empty)"

echo -e "\n# synching chrislusf/seaweedfs"
[ ! -e gits/chrislusf/seaweedfs ] || ( git -C gits/chrislusf/seaweedfs fetch --depth 1 && git -C gits/chrislusf/seaweedfs reset --hard origin )
[ -e gits/chrislusf/seaweedfs ] || git clone --depth 1 git@github.com:chrislusf/seaweedfs.git gits/chrislusf/seaweedfs
mkdir -p seaweedfs/
test -e gits/chrislusf/seaweedfs/weed/pb/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/chrislusf/seaweedfs/weed/pb/ seaweedfs/
test -z "$(find seaweedfs/ -maxdepth 0 -empty)"

echo -e "\n# synching envoyproxy/data-plane-api"
[ ! -e gits/envoyproxy/data-plane-api ] || ( git -C gits/envoyproxy/data-plane-api fetch --depth 1 && git -C gits/envoyproxy/data-plane-api reset --hard origin )
[ -e gits/envoyproxy/data-plane-api ] || git clone --depth 1 git@github.com:envoyproxy/data-plane-api.git gits/envoyproxy/data-plane-api
mkdir -p envoy/
test -e gits/envoyproxy/data-plane-api/envoy/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/envoyproxy/data-plane-api/envoy/ envoy/
test -z "$(find envoy/ -maxdepth 0 -empty)"

echo -e "\n# synching containerd/containerd"
[ ! -e gits/containerd/containerd ] || ( git -C gits/containerd/containerd fetch --depth 1 && git -C gits/containerd/containerd reset --hard origin )
[ -e gits/containerd/containerd ] || git clone --depth 1 git@github.com:containerd/containerd.git gits/containerd/containerd
mkdir -p containerd/
test -e gits/containerd/containerd/api
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/containerd/containerd/api containerd/
test -z "$(find containerd/ -maxdepth 0 -empty)"

echo -e "\n# synching open-telemetry/opentelemetry-proto"
[ ! -e gits/open-telemetry/opentelemetry-proto ] || ( git -C gits/open-telemetry/opentelemetry-proto fetch --depth 1 && git -C gits/open-telemetry/opentelemetry-proto reset --hard origin )
[ -e gits/open-telemetry/opentelemetry-proto ] || git clone --depth 1 git@github.com:open-telemetry/opentelemetry-proto.git gits/open-telemetry/opentelemetry-proto
mkdir -p opentelemetry/
test -e gits/open-telemetry/opentelemetry-proto/opentelemetry/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/open-telemetry/opentelemetry-proto/opentelemetry/ opentelemetry/
test -z "$(find opentelemetry/ -maxdepth 0 -empty)"

if false; then
echo -e "\n# synching cockroachdb/cockroach"
[ ! -e gits/cockroachdb/cockroach ] || ( git -C gits/cockroachdb/cockroach fetch --depth 1 && git -C gits/cockroachdb/cockroach reset --hard origin )
[ -e gits/cockroachdb/cockroach ] || git clone --depth 1 git@github.com:cockroachdb/cockroach.git gits/cockroachdb/cockroach
mkdir -p cockroach/roachpb/ cockroach/sql/ cockroach/kv/ cockroach/jobs/ cockroach/server/ cockroach/ccl/ cockroach/storage/ cockroach/util/ cockroach/ts/ cockroach/config/ cockroach/startupmigrations/ cockroach/geo/ cockroach/blobs/ cockroach/clusterversion/ cockroach/gossip/ cockroach/acceptance/
test -e gits/cockroachdb/cockroach/pkg/roachpb/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/roachpb/ cockroach/roachpb/
test -z "$(find cockroach/roachpb/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/sql/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/sql/ cockroach/sql/
test -z "$(find cockroach/sql/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/kv/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/kv/ cockroach/kv/
test -z "$(find cockroach/kv/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/jobs/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/jobs/ cockroach/jobs/
test -z "$(find cockroach/jobs/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/server/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/server/ cockroach/server/
test -z "$(find cockroach/server/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/ccl/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/ccl/ cockroach/ccl/
test -z "$(find cockroach/ccl/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/storage/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/storage/ cockroach/storage/
test -z "$(find cockroach/storage/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/util/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/util/ cockroach/util/
test -z "$(find cockroach/util/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/ts/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/ts/ cockroach/ts/
test -z "$(find cockroach/ts/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/config/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/config/ cockroach/config/
test -z "$(find cockroach/config/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/startupmigrations/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/startupmigrations/ cockroach/startupmigrations/
test -z "$(find cockroach/startupmigrations/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/geo/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/geo/ cockroach/geo/
test -z "$(find cockroach/geo/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/blobs/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/blobs/ cockroach/blobs/
test -z "$(find cockroach/blobs/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/clusterversion/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/clusterversion/ cockroach/clusterversion/
test -z "$(find cockroach/clusterversion/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/gossip/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/gossip/ cockroach/gossip/
test -z "$(find cockroach/gossip/ -maxdepth 0 -empty)"
test -e gits/cockroachdb/cockroach/pkg/acceptance/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cockroachdb/cockroach/pkg/acceptance/ cockroach/acceptance/
test -z "$(find cockroach/acceptance/ -maxdepth 0 -empty)"
fi

echo -e "\n# synching esphome/esphome"
[ ! -e gits/esphome/esphome ] || ( git -C gits/esphome/esphome fetch --depth 1 && git -C gits/esphome/esphome reset --hard origin )
[ -e gits/esphome/esphome ] || git clone --depth 1 git@github.com:esphome/esphome.git gits/esphome/esphome
mkdir -p esphome/
test -e gits/esphome/esphome/esphome/components/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/esphome/esphome/esphome/components/api/ esphome/
test -z "$(find esphome/ -maxdepth 0 -empty)"

echo -e "\n# synching dgraph-io/dgo"
[ ! -e gits/dgraph-io/dgo ] || ( git -C gits/dgraph-io/dgo fetch --depth 1 && git -C gits/dgraph-io/dgo reset --hard origin )
[ -e gits/dgraph-io/dgo ] || git clone --depth 1 git@github.com:dgraph-io/dgo.git gits/dgraph-io/dgo
mkdir -p dgraph/api/
test -e gits/dgraph-io/dgo/protos/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/dgraph-io/dgo/protos/ dgraph/api/
test -z "$(find dgraph/api/ -maxdepth 0 -empty)"

echo -e "\n# synching etcd-io/etcd"
[ ! -e gits/etcd-io/etcd ] || ( git -C gits/etcd-io/etcd fetch --depth 1 && git -C gits/etcd-io/etcd reset --hard origin )
[ -e gits/etcd-io/etcd ] || git clone --depth 1 git@github.com:etcd-io/etcd.git gits/etcd-io/etcd
mkdir -p etcd/
test -e gits/etcd-io/etcd/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/etcd-io/etcd/api/ etcd/
test -z "$(find etcd/ -maxdepth 0 -empty)"

echo -e "\n# synching kubernetes/cri-api"
[ ! -e gits/kubernetes/cri-api ] || ( git -C gits/kubernetes/cri-api fetch --depth 1 && git -C gits/kubernetes/cri-api reset --hard origin )
[ -e gits/kubernetes/cri-api ] || git clone --depth 1 git@github.com:kubernetes/cri-api.git gits/kubernetes/cri-api
mkdir -p kubernetes/cri/runtime/
test -e gits/kubernetes/cri-api/pkg/apis/runtime/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/kubernetes/cri-api/pkg/apis/runtime/ kubernetes/cri/runtime/
test -z "$(find kubernetes/cri/runtime/ -maxdepth 0 -empty)"

echo -e "\n# synching envoyproxy/protoc-gen-validate"
[ ! -e gits/envoyproxy/protoc-gen-validate ] || ( git -C gits/envoyproxy/protoc-gen-validate fetch --depth 1 && git -C gits/envoyproxy/protoc-gen-validate reset --hard origin )
[ -e gits/envoyproxy/protoc-gen-validate ] || git clone --depth 1 git@github.com:envoyproxy/protoc-gen-validate.git gits/envoyproxy/protoc-gen-validate
mkdir -p validate/
test -e gits/envoyproxy/protoc-gen-validate/validate/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/envoyproxy/protoc-gen-validate/validate/ validate/
test -z "$(find validate/ -maxdepth 0 -empty)"

echo -e "\n# synching authzed/spicedb"
[ ! -e gits/authzed/spicedb ] || ( git -C gits/authzed/spicedb fetch --depth 1 && git -C gits/authzed/spicedb reset --hard origin )
[ -e gits/authzed/spicedb ] || git clone --depth 1 git@github.com:authzed/spicedb.git gits/authzed/spicedb
mkdir -p spicedb/
test -e gits/authzed/spicedb/proto/internal/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/authzed/spicedb/proto/internal/ spicedb/
test -z "$(find spicedb/ -maxdepth 0 -empty)"

echo -e "\n# synching markphelps/flipt"
[ ! -e gits/markphelps/flipt ] || ( git -C gits/markphelps/flipt fetch --depth 1 && git -C gits/markphelps/flipt reset --hard origin )
[ -e gits/markphelps/flipt ] || git clone --depth 1 git@github.com:markphelps/flipt.git gits/markphelps/flipt
mkdir -p flipt/
test -e gits/markphelps/flipt/rpc/flipt/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/markphelps/flipt/rpc/flipt/ flipt/
test -z "$(find flipt/ -maxdepth 0 -empty)"

echo -e "\n# synching teamgram/teamgram-server"
[ ! -e gits/teamgram/teamgram-server ] || ( git -C gits/teamgram/teamgram-server fetch --depth 1 && git -C gits/teamgram/teamgram-server reset --hard origin )
[ -e gits/teamgram/teamgram-server ] || git clone --depth 1 git@github.com:teamgram/teamgram-server.git gits/teamgram/teamgram-server
mkdir -p teamgram/mtproto/ teamgram/messenger/
test -e gits/teamgram/teamgram-server/mtproto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/teamgram/teamgram-server/mtproto/ teamgram/mtproto/
test -z "$(find teamgram/mtproto/ -maxdepth 0 -empty)"
test -e gits/teamgram/teamgram-server/messenger/biz_server/biz/core/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/teamgram/teamgram-server/messenger/biz_server/biz/core/ teamgram/messenger/
test -z "$(find teamgram/messenger/ -maxdepth 0 -empty)"

echo -e "\n# synching hashicorp/consul"
[ ! -e gits/hashicorp/consul ] || ( git -C gits/hashicorp/consul fetch --depth 1 && git -C gits/hashicorp/consul reset --hard origin )
[ -e gits/hashicorp/consul ] || git clone --depth 1 git@github.com:hashicorp/consul.git gits/hashicorp/consul
mkdir -p consul/proto/
test -e gits/hashicorp/consul/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/hashicorp/consul/proto/ consul/proto/
test -z "$(find consul/proto/ -maxdepth 0 -empty)"
git add .
