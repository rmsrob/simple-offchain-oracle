// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.13;

contract SimpleOracle {
  address public owner;
  uint96 public btcMarketCap;

  event CallbackGetBTCCap();

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "contract owner only");
    _;
  }

  // Function to update the BTC market cap
  function setBTCCap(uint96 cap) external onlyOwner {
    btcMarketCap = cap;
  }

  // Notify to update the BTC market cap
  function updateBTCCap() public {
    emit CallbackGetBTCCap();
  }

  function getBTCCap() public view returns (uint96) {
    return btcMarketCap;
  }
}
