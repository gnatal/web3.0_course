//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MyContract {

    string public ourString = "Hello World";

    // everything with (mark) costs money, call don't spend money
    function updateOurString(string memory _updateString) public  {
        ourString = _updateString;        
    }

}