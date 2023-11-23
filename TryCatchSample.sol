//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract TryCatchSample {

    function aFunction () public pure {
        require(false, "Error message");
    }

}

contract ErrorHandling {
    event ErrorLoggin(string reason);
    function catchError() public {
        TryCatchSample aFun = new TryCatchSample();
        try aFun.aFunction() {

        } catch Error(string memory reason) {
            emit ErrorLoggin(reason);
        } 
    }
}