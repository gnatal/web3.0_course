//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleBoolean {

    bool public myBoolean;

    function setMyBool(bool _myBool) public {
        myBoolean = _myBool;
    }

}