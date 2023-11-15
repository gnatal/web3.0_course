//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleConstructor {

    address public myAddress;

    // called only once when the smart contract is deployed.
    constructor (address _someAddress) {
        myAddress = _someAddress;
    }

}