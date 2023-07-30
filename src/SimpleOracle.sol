// SPDX-License-Identifier: AGPL-3.0-only	
pragma solidity ^0.8.13;

contract SimpleOracle {
    address public owner;

    uint public btcMarketCap;

    event CallbackGetBTCCap();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "contract owner only");
        _;
    }

    function updateBTCCap() public {
        // Calls the callback function
        emit CallbackGetBTCCap();
    }

    // Function to update the BTC market cap (called by the oracle application off-chain)
    function setBTCCap(uint cap) external onlyOwner {
        btcMarketCap = cap;
    }

    function getBTCCap() public view returns (uint) {
        return btcMarketCap;
    }
}
