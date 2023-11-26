//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract EventExample {

    mapping (address => uint) public tokenBalance;

    event tokenSent(address indexed _from, address _to, uint _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function setToken (address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit tokenSent(msg.sender, _to, _amount);

        return true;
    }
}