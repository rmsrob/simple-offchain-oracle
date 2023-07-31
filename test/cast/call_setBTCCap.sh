#!/usr/bin/env bash
set -e

source .env

# Get the last local deployment.
address=$(jq -r ".transactions[0].contractAddress" ./broadcast/Deployer.s.sol/1/run-latest.json)
owner=$(jq -r ".transactions[0].transaction.from" ./broadcast/Deployer.s.sol/1/run-latest.json)

# Impersonate the 2nd Anvil acc.
cast rpc anvil_impersonateAccount $owner >/dev/null

# Get the last market cap from Coingecko
last_mc=$(curl -s 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en' | jq -r '.[0].market_cap')

echo "📢 $owner with owner. Update to $last_mc"

# Call getBTCCap() from not owner.
cast send "$address" \
    --from $owner \
    --unlocked \
    "setBTCCap(uint96)" $last_mc

# Stop impersonating the 2nd Anvil acc.
cast rpc anvil_stopImpersonatingAccount $owner >/dev/null
