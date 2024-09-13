// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

// import "./Simple.sol";

interface Test0{

    // unlike contract interface enables developers to lighten their code while still retaining the original functions of a contract
    //interfaces are just a blueprint of an already deployed contract, this prevents the developer from rewriting an already existing code

    function updatePercentage(int256 _cent) external;
    function pay(address payable reciever) payable external;
}

// contract Test {
//     int256 public percentage;

//     constructor (int _percentage){
//         percentage = _percentage;
//     }

//     function pay(address payable receiver) payable public {
//         bool sent = receiver.send(msg.value);
//         require(sent, "Not paid!!");
//     }

//     function updatePercentage(int256 _cent) external {
//         percentage = _cent;
//     }

//     receive() external payable { }
// }

contract Test2 {
    // Test testContract;

    function setPercentage(int256 _cent, address payable addressContract) external {
        Test0(addressContract).updatePercentage(_cent);
    }

    // function getResult(address simpleAddress) pure public returns (int x) {
    //     x = Simple(simpleAddress).calculate();
    // }

    function Transfer(address payable Payer, address payable receiver) payable public {
        Test0(Payer).pay{value: msg.value}(receiver);
    }
}
