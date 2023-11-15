//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract BlockchainMessager {

    string public message;

    uint public changeCounter;

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    function setMyString (string memory newMessage) public {
        if(msg.sender == owner) {
            message = newMessage;
            changeCounter++;
        }
    }

}