//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleFallback {

    uint public lastValueSent;

    //2300 gas.
    receive() external payable { }

}