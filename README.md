![WIP](https://img.shields.io/badge/status-wip-red)
<a href="https://gitpod.io/#https://github.com/rrobrms/simple-offchain-oracle" target="_blank">
  <img
    src="https://img.shields.io/badge/Open%20with-Gitpod-908a85?logo=gitpod"
    alt="Contribute with Gitpod"
  />
</a>

# simple-offchain-oracle

> A simple offchain oracle that get the market cap for BTC

## Install
> **Note** Prerequisite:
- [Foundry](https://book.getfoundry.sh/getting-started/installation)

```sh
git clone git@github.com:rmsrob/simple-offchain-oracle.git
cd simple-offchain-oracle
forge install
find ./script/sh ./test/cast -type f -exec chmod u+x {} +
cp -iv .env.example .env
```

## Usage

> call the Oracle
```sh
sh ./test/cast/view_getBTCCap.sh
```

> set value for the Oracle
```sh
sh ./test/cast/call_setBTCCap.sh
```

## Deployment
```sh
make fork
make deploy
```