//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MappingStructExample {

    // this lesson is about tracking stuff but this is not z smart a idea

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numOfDeposits;
        mapping (uint => Transaction) deposits;
        uint numWithdraws;
        mapping (uint => Transaction) withdraws;
    }   

    mapping (address => Balance) public balances;

    function deposit () public payable {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numOfDeposits] = deposit;
        balances[msg.sender].numOfDeposits++;
    }

    function withdraw(address payable _to, uint amount) public {
        balances[msg.sender].totalBalance -= amount;
        Transaction memory withdraw = Transaction(amount, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numWithdraws] = withdraw;
        balances[msg.sender].numWithdraws++;
        _to.transfer(amount);
    }

}