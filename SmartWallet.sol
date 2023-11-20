//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SmartWallet {

    address owner;
    uint public balance;

    constructor () {
        owner = msg.sender;
    }

    function add() public payable {
        balance += msg.value;
    }

    function withdraw(address payable to) public  {
        if(owner == to) {
            to.transfer(address (this).balance);
            balance = 0;
        }
    }



}