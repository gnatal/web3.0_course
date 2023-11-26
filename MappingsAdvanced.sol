//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MappingsSample2 {

    function sendMoney() public payable {

    }

    function getBalance () public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllMoney (address payable _to) public {
        _to.transfer(getBalance());
    } 

}

// [t1,t2,t3,t5, ... tn] (miner fee.) [maior fee, ... menor fee]

// minerador cardano minaração.