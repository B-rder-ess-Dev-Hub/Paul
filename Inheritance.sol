// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Parent {
    
    address public owner;

    constructor(address  _owner){
        require(_owner != address(0), "Transaction failed! Not a valid admin");
        owner = _owner;
    }

    modifier Admin(){
        require(msg.sender == owner, "Access Denied! Action can only be executed by the  admin");
        _;
    }

}

contract Parent2 {

    enum Status{
        Successful,
        Declined
    }

    struct User{
        uint256 id;
        string name;
        Status status;
    }

    mapping(uint256 => User) public user;

    uint256 userid;

}


contract Child is Parent, Parent2{

    constructor(address _owner)Parent(_owner){}

    function RegisterUser(string memory _user) public Admin returns (string memory message){
        userid += 1;
        user[userid] = (User(userid, _user, Status.Successful ));
        return "User successfully registered";
    }

}