// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract GamerTag {
    address public owner;

    constructor(address _owner){
        _owner != address(0);
    }

    enum Stages {
        Premium,
        Gold,
        Silver
    }

    struct Gamer{
        uint256 id;
        string name;
        address gamer;
        Stages stage;
    }

    struct GameStaging{
        string Team1;
        uint256 Team_1_Score;
        string Team2;
        uint256 Team_2_Score;
    }

    modifier Payment(){
    require(msg.value == 0.002 ether || msg.value == 0.04 ether || msg.value == 0.08 ether, "Transaction Declined");
        _;
    }

    mapping(uint256 => Gamer) public gamer;
    mapping(uint => GameStaging) public staging;
    uint256 ID;

    function CreateGamer(string memory _name) public payable Payment returns (string memory message){
        ID++;
        if(msg.value == 0.002 ether){
        gamer[ID] = (Gamer(ID, _name, msg.sender, Stages.Silver));
        return "Congratulations Gamer! you are now a Silver stage player";
        }
        if(msg.value == 0.004 ether){
            gamer[ID] = (Gamer(ID, _name, msg.sender, Stages.Gold));
        return "Congratulations Gamer! you are now a Gold stage player";
        }
        if(msg.value == 0.008 ether){
            gamer[ID] = (Gamer(ID, _name, msg.sender, Stages.Premium));
        return "Congratulations Gamer! you are now a Premium stage player";
        }
    }

    function EnterGame(string memory _team1, uint256 _team_1_score, string memory _team2, uint256 _team_2_score ) public payable returns(string memory message){
        GameStaging(_team1, _team_1_score, _team2, _team_2_score);
        return "Game successfully set. Good Luck!";
    }


     function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

}