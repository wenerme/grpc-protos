#!/usr/bin/env bash
#set -euxo pipefail # for debugging
set -euo pipefail

# synching dexidp/dex
_dir="gits/dexidp/dex"
echo -e "\n# synching dexidp/dex"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:dexidp/dex.git $_dir
mkdir -p dex/api/
test -e gits/dexidp/dex/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/dexidp/dex/api/ dex/api/
test -z "$(find dex/api/ -maxdepth 0 -empty)"


# synching googleapis/api-common-protos
_dir="gits/googleapis/api-common-protos"
echo -e "\n# synching googleapis/api-common-protos"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:googleapis/api-common-protos.git $_dir
mkdir -p google/
test -e gits/googleapis/api-common-protos/google/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/api-common-protos/google/ google/
test -z "$(find google/ -maxdepth 0 -empty)"


# synching googleapis/googleapis
_dir="gits/googleapis/googleapis"
echo -e "\n# synching googleapis/googleapis"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:googleapis/googleapis.git $_dir
mkdir -p googleapis/google/ googleapis/grafeas/ googleapis/gapic/metadata/
test -e gits/googleapis/googleapis/google/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/googleapis/google/ googleapis/google/
test -z "$(find googleapis/google/ -maxdepth 0 -empty)"
test -e gits/googleapis/googleapis/grafeas/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/googleapis/grafeas/ googleapis/grafeas/
test -z "$(find googleapis/grafeas/ -maxdepth 0 -empty)"
test -e gits/googleapis/googleapis/gapic/metadata/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/googleapis/googleapis/gapic/metadata/ googleapis/gapic/metadata/
test -z "$(find googleapis/gapic/metadata/ -maxdepth 0 -empty)"


# synching google/perfetto
_dir="gits/google/perfetto"
echo -e "\n# synching google/perfetto"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:google/perfetto.git $_dir
mkdir -p perfetto/ perfetto/ perfetto/
test -e gits/google/perfetto/protos/perfetto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/google/perfetto/protos/perfetto/ perfetto/
test -z "$(find perfetto/ -maxdepth 0 -empty)"
test -e gits/google/perfetto/protos/third_party
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/google/perfetto/protos/third_party perfetto/
test -z "$(find perfetto/ -maxdepth 0 -empty)"
test -e gits/google/perfetto/protos/README.md
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/google/perfetto/protos/README.md perfetto/
test -z "$(find perfetto/ -maxdepth 0 -empty)"


# synching temporalio/api
_dir="gits/temporalio/api"
echo -e "\n# synching temporalio/api"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:temporalio/api.git $_dir
mkdir -p temporal/api/
test -e gits/temporalio/api/temporal/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/temporalio/api/temporal/api/ temporal/api/
test -z "$(find temporal/api/ -maxdepth 0 -empty)"


# synching uber/cadence-idl
_dir="gits/uber/cadence-idl"
echo -e "\n# synching uber/cadence-idl"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:uber/cadence-idl.git $_dir
mkdir -p uber/
test -e gits/uber/cadence-idl/proto/uber/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/uber/cadence-idl/proto/uber/ uber/
test -z "$(find uber/ -maxdepth 0 -empty)"


# synching yandex-cloud/cloudapi
_dir="gits/yandex-cloud/cloudapi"
echo -e "\n# synching yandex-cloud/cloudapi"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:yandex-cloud/cloudapi.git $_dir
mkdir -p yandex/
test -e gits/yandex-cloud/cloudapi/yandex/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/yandex-cloud/cloudapi/yandex/ yandex/
test -z "$(find yandex/ -maxdepth 0 -empty)"


# synching grpc/grpc
_dir="gits/grpc/grpc"
echo -e "\n# synching grpc/grpc"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:grpc/grpc.git $_dir
mkdir -p grpc/ examples/
test -e gits/grpc/grpc/src/proto/grpc/
rsync -avm  --delete --delete-excluded --exclude 'xds/*'  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/grpc/grpc/src/proto/grpc/ grpc/
test -z "$(find grpc/ -maxdepth 0 -empty)"
test -e gits/grpc/grpc/examples/protos/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/grpc/grpc/examples/protos/ examples/
test -z "$(find examples/ -maxdepth 0 -empty)"


# synching cosmos/cosmos-sdk
_dir="gits/cosmos/cosmos-sdk"
echo -e "\n# synching cosmos/cosmos-sdk"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:cosmos/cosmos-sdk.git $_dir
mkdir -p cosmos/
test -e gits/cosmos/cosmos-sdk/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/cosmos/cosmos-sdk/proto/ cosmos/
test -z "$(find cosmos/ -maxdepth 0 -empty)"


# synching chrislusf/seaweedfs
_dir="gits/chrislusf/seaweedfs"
echo -e "\n# synching chrislusf/seaweedfs"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:chrislusf/seaweedfs.git $_dir
mkdir -p seaweedfs/
test -e gits/chrislusf/seaweedfs/weed/pb/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/chrislusf/seaweedfs/weed/pb/ seaweedfs/
test -z "$(find seaweedfs/ -maxdepth 0 -empty)"


# synching envoyproxy/data-plane-api
_dir="gits/envoyproxy/data-plane-api"
echo -e "\n# synching envoyproxy/data-plane-api"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:envoyproxy/data-plane-api.git $_dir
mkdir -p envoy/
test -e gits/envoyproxy/data-plane-api/envoy/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/envoyproxy/data-plane-api/envoy/ envoy/
test -z "$(find envoy/ -maxdepth 0 -empty)"


# synching containerd/containerd
_dir="gits/containerd/containerd"
echo -e "\n# synching containerd/containerd"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:containerd/containerd.git $_dir
mkdir -p containerd/
test -e gits/containerd/containerd/api
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/containerd/containerd/api containerd/
test -z "$(find containerd/ -maxdepth 0 -empty)"


# synching open-telemetry/opentelemetry-proto
_dir="gits/open-telemetry/opentelemetry-proto"
echo -e "\n# synching open-telemetry/opentelemetry-proto"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:open-telemetry/opentelemetry-proto.git $_dir
mkdir -p opentelemetry/
test -e gits/open-telemetry/opentelemetry-proto/opentelemetry/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/open-telemetry/opentelemetry-proto/opentelemetry/ opentelemetry/
test -z "$(find opentelemetry/ -maxdepth 0 -empty)"


# synching prometheus/prometheus
_dir="gits/prometheus/prometheus"
echo -e "\n# synching prometheus/prometheus"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:prometheus/prometheus.git $_dir
mkdir -p prompb/
test -e gits/prometheus/prometheus/prompb/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/prometheus/prometheus/prompb/ prompb/
test -z "$(find prompb/ -maxdepth 0 -empty)"

if false; then

# synching cockroachdb/cockroach
_dir="gits/cockroachdb/cockroach"
echo -e "\n# synching cockroachdb/cockroach"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:cockroachdb/cockroach.git $_dir
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


# synching esphome/esphome
_dir="gits/esphome/esphome"
echo -e "\n# synching esphome/esphome"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:esphome/esphome.git $_dir
mkdir -p esphome/
test -e gits/esphome/esphome/esphome/components/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/esphome/esphome/esphome/components/api/ esphome/
test -z "$(find esphome/ -maxdepth 0 -empty)"


# synching dgraph-io/dgo
_dir="gits/dgraph-io/dgo"
echo -e "\n# synching dgraph-io/dgo"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:dgraph-io/dgo.git $_dir
mkdir -p dgraph/api/
test -e gits/dgraph-io/dgo/protos/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/dgraph-io/dgo/protos/ dgraph/api/
test -z "$(find dgraph/api/ -maxdepth 0 -empty)"


# synching etcd-io/etcd
_dir="gits/etcd-io/etcd"
echo -e "\n# synching etcd-io/etcd"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:etcd-io/etcd.git $_dir
mkdir -p etcd/
test -e gits/etcd-io/etcd/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/etcd-io/etcd/api/ etcd/
test -z "$(find etcd/ -maxdepth 0 -empty)"


# synching kubernetes/cri-api
_dir="gits/kubernetes/cri-api"
echo -e "\n# synching kubernetes/cri-api"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:kubernetes/cri-api.git $_dir
mkdir -p kubernetes/cri/runtime/
test -e gits/kubernetes/cri-api/pkg/apis/runtime/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/kubernetes/cri-api/pkg/apis/runtime/ kubernetes/cri/runtime/
test -z "$(find kubernetes/cri/runtime/ -maxdepth 0 -empty)"


# synching kubernetes/api
_dir="gits/kubernetes/api"
echo -e "\n# synching kubernetes/api"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:kubernetes/api.git $_dir
mkdir -p k8s/io/api/
test -e gits/kubernetes/api/./
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/kubernetes/api/./ k8s/io/api/
test -z "$(find k8s/io/api/ -maxdepth 0 -empty)"


# synching envoyproxy/protoc-gen-validate
_dir="gits/envoyproxy/protoc-gen-validate"
echo -e "\n# synching envoyproxy/protoc-gen-validate"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:envoyproxy/protoc-gen-validate.git $_dir
mkdir -p validate/
test -e gits/envoyproxy/protoc-gen-validate/validate/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/envoyproxy/protoc-gen-validate/validate/ validate/
test -z "$(find validate/ -maxdepth 0 -empty)"


# synching authzed/spicedb
_dir="gits/authzed/spicedb"
echo -e "\n# synching authzed/spicedb"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:authzed/spicedb.git $_dir
mkdir -p spicedb/
test -e gits/authzed/spicedb/proto/internal/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/authzed/spicedb/proto/internal/ spicedb/
test -z "$(find spicedb/ -maxdepth 0 -empty)"


# synching markphelps/flipt
_dir="gits/markphelps/flipt"
echo -e "\n# synching markphelps/flipt"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:markphelps/flipt.git $_dir
mkdir -p flipt/
test -e gits/markphelps/flipt/rpc/flipt/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/markphelps/flipt/rpc/flipt/ flipt/
test -z "$(find flipt/ -maxdepth 0 -empty)"


# synching hashicorp/consul
_dir="gits/hashicorp/consul"
echo -e "\n# synching hashicorp/consul"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:hashicorp/consul.git $_dir
mkdir -p consul/ consul/
test -e gits/hashicorp/consul/proto-public/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/hashicorp/consul/proto-public/ consul/
test -z "$(find consul/ -maxdepth 0 -empty)"
test -e gits/hashicorp/consul/proto/
rsync -avm    --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/hashicorp/consul/proto/ consul/
test -z "$(find consul/ -maxdepth 0 -empty)"


# synching appleboy/gorush
_dir="gits/appleboy/gorush"
echo -e "\n# synching appleboy/gorush"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:appleboy/gorush.git $_dir
mkdir -p gorush/
test -e gits/appleboy/gorush/rpc/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/appleboy/gorush/rpc/proto/ gorush/
test -z "$(find gorush/ -maxdepth 0 -empty)"


# synching SocialSisterYi/bilibili-API-collect
_dir="gits/SocialSisterYi/bilibili-API-collect"
echo -e "\n# synching SocialSisterYi/bilibili-API-collect"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:SocialSisterYi/bilibili-API-collect.git $_dir
mkdir -p bilibili/
test -e gits/SocialSisterYi/bilibili-API-collect/grpc_api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/SocialSisterYi/bilibili-API-collect/grpc_api/ bilibili/
test -z "$(find bilibili/ -maxdepth 0 -empty)"


# synching flyteorg/flyte
_dir="gits/flyteorg/flyte"
echo -e "\n# synching flyteorg/flyte"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:flyteorg/flyte.git $_dir
mkdir -p flyteidl/ flyteidl/
test -e gits/flyteorg/flyte/flyteidl/protos/flyteidl/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/flyteorg/flyte/flyteidl/protos/flyteidl/ flyteidl/
test -z "$(find flyteidl/ -maxdepth 0 -empty)"
test -e gits/flyteorg/flyte/flyteidl/README.md
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/flyteorg/flyte/flyteidl/README.md flyteidl/
test -z "$(find flyteidl/ -maxdepth 0 -empty)"


# synching adap/flower
_dir="gits/adap/flower"
echo -e "\n# synching adap/flower"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:adap/flower.git $_dir
mkdir -p flower/
test -e gits/adap/flower/src/proto/flwr/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/adap/flower/src/proto/flwr/proto/ flower/
test -z "$(find flower/ -maxdepth 0 -empty)"


# synching Permify/permify
_dir="gits/Permify/permify"
echo -e "\n# synching Permify/permify"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:Permify/permify.git $_dir
mkdir -p permify/
test -e gits/Permify/permify/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/Permify/permify/proto/ permify/
test -z "$(find permify/ -maxdepth 0 -empty)"


# synching techschool/simplebank
_dir="gits/techschool/simplebank"
echo -e "\n# synching techschool/simplebank"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:techschool/simplebank.git $_dir
mkdir -p simplebank/ simplebank/ simplebank/ simplebank/ simplebank/ simplebank/
test -e gits/techschool/simplebank/proto/user.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/user.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"
test -e gits/techschool/simplebank/proto/service_simple_bank.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/service_simple_bank.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"
test -e gits/techschool/simplebank/proto/rpc_verify_email.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/rpc_verify_email.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"
test -e gits/techschool/simplebank/proto/rpc_update_user.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/rpc_update_user.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"
test -e gits/techschool/simplebank/proto/rpc_create_user.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/rpc_create_user.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"
test -e gits/techschool/simplebank/proto/rpc_login_user.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/techschool/simplebank/proto/rpc_login_user.proto simplebank/
test -z "$(find simplebank/ -maxdepth 0 -empty)"


# synching camunda/camunda
_dir="gits/camunda/camunda"
echo -e "\n# synching camunda/camunda"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:camunda/camunda.git $_dir
mkdir -p camunda/zeebe/gateway-protocol/ camunda/zeebe/dynamic-config/
test -e gits/camunda/camunda/zeebe/gateway-protocol/src/main/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/camunda/camunda/zeebe/gateway-protocol/src/main/proto/ camunda/zeebe/gateway-protocol/
test -z "$(find camunda/zeebe/gateway-protocol/ -maxdepth 0 -empty)"
test -e gits/camunda/camunda/zeebe/dynamic-config/src/main/resources/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/camunda/camunda/zeebe/dynamic-config/src/main/resources/proto/ camunda/zeebe/dynamic-config/
test -z "$(find camunda/zeebe/dynamic-config/ -maxdepth 0 -empty)"


# synching conductor-oss/conductor
_dir="gits/conductor-oss/conductor"
echo -e "\n# synching conductor-oss/conductor"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:conductor-oss/conductor.git $_dir
mkdir -p conductor/
test -e gits/conductor-oss/conductor/grpc/src/main/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/conductor-oss/conductor/grpc/src/main/proto/ conductor/
test -z "$(find conductor/ -maxdepth 0 -empty)"


# synching vitessio/vitess
_dir="gits/vitessio/vitess"
echo -e "\n# synching vitessio/vitess"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:vitessio/vitess.git $_dir
mkdir -p vitess/
test -e gits/vitessio/vitess/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/vitessio/vitess/proto/ vitess/
test -z "$(find vitess/ -maxdepth 0 -empty)"


# synching Kong/kong
_dir="gits/Kong/kong"
echo -e "\n# synching Kong/kong"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:Kong/kong.git $_dir
mkdir -p kong/
test -e gits/Kong/kong/kong/include/kong/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/Kong/kong/kong/include/kong/ kong/
test -z "$(find kong/ -maxdepth 0 -empty)"


# synching Alluxio/alluxio
_dir="gits/Alluxio/alluxio"
echo -e "\n# synching Alluxio/alluxio"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:Alluxio/alluxio.git $_dir
mkdir -p alluxio/
test -e gits/Alluxio/alluxio/common/transport/src/main/proto/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/Alluxio/alluxio/common/transport/src/main/proto/ alluxio/
test -z "$(find alluxio/ -maxdepth 0 -empty)"


# synching container-storage-interface/spec
_dir="gits/container-storage-interface/spec"
echo -e "\n# synching container-storage-interface/spec"
[ ! -e $_dir ] || [ $(($(date +%s) - $(stat -c %Y "$_dir"))) -lt 1800 ] || ( git -C $_dir fetch --depth 1 && git -C $_dir reset --hard origin && touch $_dir )
[ -e $_dir ] || git clone --depth 1 git@github.com:container-storage-interface/spec.git $_dir
mkdir -p csi/
test -e gits/container-storage-interface/spec/csi.proto
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include 'README.md' --exclude="*" gits/container-storage-interface/spec/csi.proto csi/
test -z "$(find csi/ -maxdepth 0 -empty)"
git add .
