//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract ExampleExceptionRequire {

    mapping (address => uint) public balanceReceived;

    function deposit () public payable  {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdraw (address payable  _to, uint _amout) public {
        require(_amout <= balanceReceived[msg.sender], "not enough mana");
        balanceReceived[msg.sender] -= _amout;
        _to.transfer(_amout);
        
    }

}