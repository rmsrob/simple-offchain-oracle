#!/usr/bin/env bash
set -e

source .env

FROM_SC=SimpleOracle
DEPLOY_SC=Deployer
DEPLOYED_FILENAME=oracle

abi=$(jq -c "{abi: .abi}" ./out/$FROM_SC.sol/$FROM_SC.json)
address=$(jq -c \
    "{address: .transactions[0].contractAddress}" \
    ./broadcast/$DEPLOY_SC.s.sol/1/run-latest.json)
blocknumberhex=$(jq -rc \
    ".receipts[0].blockNumber" \
    ./broadcast/$DEPLOY_SC.s.sol/1/run-latest.json)
blocknumber=$(cast --to-base $blocknumberhex 10)
echo "$abi $address {\"blockNumber\": $blocknumber}" | jq -s add >./deployments/$DEPLOYED_FILENAME.json
