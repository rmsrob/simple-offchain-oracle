![WIP](https://img.shields.io/badge/status-wip-red)

[![Latest release](https://img.shields.io/github/v/release/rrobrms/simple-offchain-oracle)](https://github.com/rrobrms/simple-offchain-oracle/releases/latest)
[![Go Reference](https://pkg.go.dev/badge/github.com/rrobrms/simple-offchain-oracle.svg)](https://pkg.go.dev/github.com/rrobrms/simple-offchain-oracle)
[![Go Report Card](https://goreportcard.com/badge/github.com/rrobrms/simple-offchain-oracle)](https://goreportcard.com/report/github.com/rrobrms/simple-offchain-oracle)
[![Coverage Status](https://coveralls.io/repos/github/rrobrms/simple-offchain-oracle/badge.svg?branch=master)](https://coveralls.io/github/rrobrms/simple-offchain-oracle?branch=master)
<a href="https://gitpod.io/#https://github.com/rrobrms/simple-offchain-oracle" target="_blank">
  <img
    src="https://img.shields.io/badge/Open%20with-Gitpod-908a85?logo=gitpod"
    alt="Contribute with Gitpod"
  />
</a>

# simple-offchain-oracle

> description

## Install
> **Note** Prerequisite:
- [Foundry](https://book.getfoundry.sh/getting-started/installation)

```sh
git clone git@github.com:rmsrob/simple-offchain-oracle.git
cd simple-offchain-oracle
forge install
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