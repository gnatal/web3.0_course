// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {

    mapping (uint => address) public  distributionList;
    mapping (address => bool) public  isInList;
    uint public distributionSize;
    uint public MAX_UINT = type(uint).max;
    address owner;

    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
        owner = msg.sender;
    }

    function addToDistributionList (address user) public {
        require(user != owner, "You can't distribute to yourself");
        if(distributionSize < MAX_UINT && !isInList[user]) {
            distributionList[distributionSize] = user;
            isInList[user] = true;
            distributionSize++;
        }
    }

    function distribute () public  {
        uint toBeDistributed = owner.balance/20000;
        for(uint counter = 0; counter < distributionSize; counter++ ) {
            address distributed = distributionList[counter];
            _transfer(owner, distributed, toBeDistributed/distributionSize);
        }
    }

    // in this function A sells the token to B fro X Eth's 
    function sell (address payable seller, uint tokenRate) public payable  {
        require(seller != owner, "Can't buy from the source");
        seller.transfer(msg.value);
        transfer(msg.sender, msg.value * tokenRate);
    }

}
