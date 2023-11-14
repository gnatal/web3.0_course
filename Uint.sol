//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleUint {

    // initialize with 0 costs gas so don't do it.
    // uint = uint256 -> 0 - (2^256)-1
    // there are uints from uint8 to uint 256 (uint16, uint32)
    uint public myUint;

    // if you goes beyond the uint limit you get a overflow (crash) [transaction failed]
    // formerly it would go back to 0 but this is stupid so it was ditched
    // if you make an unint < 0 it will crash.
    uint8 public myUint8 = 250;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

}