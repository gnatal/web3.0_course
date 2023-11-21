//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract WalletStruct {

    PaymentReceived public payment;

    function payContract () public  payable  {
        payment = new PaymentReceived(msg.sender, msg.value);

    }
}

contract PaymentReceived {

    address public from;
    uint public amount;

    constructor(address _from, uint _amoutn) {
        from = _from;
        amount = _amoutn;
    }

}

contract Wallet2 {

    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    // both forms works
    function payContract () public  payable  {
        //payment.from = msg.sender;
        //payment.amount = msg.value;

        payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}