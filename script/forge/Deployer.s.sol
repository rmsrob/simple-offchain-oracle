// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.13;

import { Script } from "forge-std/Script.sol";
import { SimpleOracle } from "../../src/SimpleOracle.sol";

contract DeployScript is Script {
  function run() public {
    vm.startBroadcast();

    new SimpleOracle();

    vm.stopBroadcast();
  }
}
