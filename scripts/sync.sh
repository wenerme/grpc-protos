#!/usr/bin/env bash
set -euxo pipefail
echo -e "\n# synching dexidp/dex"
[ ! -e gits/dexidp/dex ] || git -C gits/dexidp/dex pull
[ -e gits/dexidp/dex ] || git clone --depth 50 git@github.com:dexidp/dex.git gits/dexidp/dex
mkdir -p dex/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/dexidp/dex/api/ dex/api/

echo -e "\n# synching googleapis/api-common-protos"
[ ! -e gits/googleapis/api-common-protos ] || git -C gits/googleapis/api-common-protos pull
[ -e gits/googleapis/api-common-protos ] || git clone --depth 50 git@github.com:googleapis/api-common-protos.git gits/googleapis/api-common-protos
mkdir -p google/
rsync -avm    --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/googleapis/api-common-protos/google/ google/

echo -e "\n# synching googleapis/googleapis"
[ ! -e gits/googleapis/googleapis ] || git -C gits/googleapis/googleapis pull
[ -e gits/googleapis/googleapis ] || git clone --depth 50 git@github.com:googleapis/googleapis.git gits/googleapis/googleapis
mkdir -p google/ grafeas/
rsync -avm    --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/googleapis/googleapis/google/ google/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/googleapis/googleapis/grafeas/ grafeas/

echo -e "\n# synching temporalio/api"
[ ! -e gits/temporalio/api ] || git -C gits/temporalio/api pull
[ -e gits/temporalio/api ] || git clone --depth 50 git@github.com:temporalio/api.git gits/temporalio/api
mkdir -p temporal/api/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/temporalio/api/temporal/api/ temporal/api/

echo -e "\n# synching uber/cadence-idl"
[ ! -e gits/uber/cadence-idl ] || git -C gits/uber/cadence-idl pull
[ -e gits/uber/cadence-idl ] || git clone --depth 50 git@github.com:uber/cadence-idl.git gits/uber/cadence-idl
mkdir -p uber/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/uber/cadence-idl/proto/uber/ uber/

echo -e "\n# synching yandex-cloud/cloudapi"
[ ! -e gits/yandex-cloud/cloudapi ] || git -C gits/yandex-cloud/cloudapi pull
[ -e gits/yandex-cloud/cloudapi ] || git clone --depth 50 git@github.com:yandex-cloud/cloudapi.git gits/yandex-cloud/cloudapi
mkdir -p yandex/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/yandex-cloud/cloudapi/yandex/ yandex/

echo -e "\n# synching grpc/grpc"
[ ! -e gits/grpc/grpc ] || git -C gits/grpc/grpc pull
[ -e gits/grpc/grpc ] || git clone --depth 50 git@github.com:grpc/grpc.git gits/grpc/grpc
mkdir -p grpc/
rsync -avm  --delete --delete-excluded --exclude 'testing/*'  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/grpc/grpc/src/proto/grpc/ grpc/

echo -e "\n# synching cosmos/cosmos-sdk"
[ ! -e gits/cosmos/cosmos-sdk ] || git -C gits/cosmos/cosmos-sdk pull
[ -e gits/cosmos/cosmos-sdk ] || git clone --depth 50 git@github.com:cosmos/cosmos-sdk.git gits/cosmos/cosmos-sdk
mkdir -p cosmos/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/cosmos/cosmos-sdk/api/cosmos/ cosmos/

echo -e "\n# synching chrislusf/seaweedfs"
[ ! -e gits/chrislusf/seaweedfs ] || git -C gits/chrislusf/seaweedfs pull
[ -e gits/chrislusf/seaweedfs ] || git clone --depth 50 git@github.com:chrislusf/seaweedfs.git gits/chrislusf/seaweedfs
mkdir -p seaweedfs/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/chrislusf/seaweedfs/weed/pb/ seaweedfs/

echo -e "\n# synching envoyproxy/data-plane-api"
[ ! -e gits/envoyproxy/data-plane-api ] || git -C gits/envoyproxy/data-plane-api pull
[ -e gits/envoyproxy/data-plane-api ] || git clone --depth 50 git@github.com:envoyproxy/data-plane-api.git gits/envoyproxy/data-plane-api
mkdir -p envoy/
rsync -avm  --delete --delete-excluded  --include '*/' --include '*.proto' --include '*.md' --exclude="*" gits/envoyproxy/data-plane-api/envoy/ envoy/
git add .
