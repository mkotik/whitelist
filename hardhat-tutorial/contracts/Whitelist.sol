//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    // if an address if whitelisted we set it to true, otherwise it will be false by default
    mapping(address => bool) public whitelistedAddresses;

    //used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhiteListed;
    
    // setting the max number of whitelisted addresses
    // user sets this value at time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhiteListed <= maxWhitelistedAddresses, "More addresses can not be addded; Limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }
}