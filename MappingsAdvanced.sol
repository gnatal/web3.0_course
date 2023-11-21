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