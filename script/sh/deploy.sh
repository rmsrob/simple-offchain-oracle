#!/usr/bin/env bash
set -e

source .env

# Deploy using the first anvil account.
forge script script/forge/Deployer.s.sol:DeployScript \
    -f "${LOCAL_RPC}" \
    --private-key "${OWNER_PRIVATE_KEY}" \
    --broadcast

# --rpc-url "${ETHEREUM_PRC}"
# --verify \
# --etherscan-api-key \
# -vvvv \
# --via-ir

# Generate deployment file.
./script/sh/gen-deployment-file.sh
