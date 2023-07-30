#!/usr/bin/env bash
set -e

source .env

# Get the last local deployment.
address=$(jq -r ".transactions[0].contractAddress" ./broadcast/Deployer.s.sol/1/run-latest.json)
not_owner=0x70997970C51812dc3A010C7d01b50e0d17dc79C8 # the 2nd Anvil acc.

# Impersonate not_owner.
cast rpc anvil_impersonateAccount $not_owner >/dev/null

# Call getBTCCap() from not owner.
cast call "$address" \
    --from $not_owner \
    "getBTCCap()"

# Stop impersonating not_owner.
cast rpc anvil_stopImpersonatingAccount $not_owner >/dev/null
