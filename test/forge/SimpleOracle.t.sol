// SPDX-License-Identifier: AGPL-3.0-only	
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {SimpleOracle} from "../../src/SimpleOracle.sol";

contract SimpleOracleTest is Test {
    SimpleOracle public oracle;
    address public owner;
    uint96 public initialMarketCap;

    function setUp() public {
        // Deploy and set initial values for testing
        oracle = new SimpleOracle();
        initialMarketCap = 10000000000;
        oracle.setBTCCap(initialMarketCap);
    }

    // Ensure that the deployer of the contract is the owner
    function testOwner() public {
        address actualOwner = oracle.owner();
        assertEq(actualOwner, address(this), "Unexpected contract owner");
    }

    // Test that getBTCCap() returns the correct BTC market cap
    function testGetBTCCap() public {
        uint96 currentMarketCap = oracle.getBTCCap();
        assertEq(currentMarketCap, initialMarketCap, "Unexpected initial BTC market cap");
    }
}
