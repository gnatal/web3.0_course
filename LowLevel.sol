//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ContractOne {
    mapping (address => uint) public addressBalance;

    function desposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }
}

contract ContractTwo {
    receive() external payable { }

    function depositContractOne (address _contract1) public {
        ContractOne one = ContractOne(_contract1);
        one.desposit{ value: 10, gas: 1000000}();
    }
}

contract ContractThree {
    receive() external payable { }

    function depositContractOne (address _contract1) public {
        bytes memory payload = abi.encodeWithSignature("deposit()");
        _contract1.call{ value: 10, gas: 1000000}(payload);
    }
}

contract Sender {

    receive() external payable { }

    function withdrawTransfer (address payable  _to)  public {
        _to.transfer(10);
    }

    function withdrawSend (address payable _to) public {
        _to.send(10);
    }
}

contract ReceiverNoAction {

    receive() external payable { }
    function getBalance () public view returns (uint){
        return address(this).balance;
    }
}

contract ReceiveAction {
    uint public balancedReceived;

    receive() external payable { 
        balancedReceived += msg.value;
    }

    function getBalance () public view returns (uint){
        return address(this).balance;
    }

}
