// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import './Transaction.sol';

contract Balances {

    uint totalBalance;
    // Transaction transaction;

    struct Manufacturer{
        bool isManufacturer;
        address[] sellers;
    }

    Manufacturer manufacturer;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value

    );

    event Approval(
         address indexed _owner,
        address indexed _spender,
        uint _value

    );


    function setBalanceOfUser(address user, uint amount) public {
        balanceOf[user] = amount;
    }
    
    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public{
        balanceOf[msg.sender] = 0;
        // transaction = _transaction;
    }

    function transfer(address _to, uint256  _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public payable returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);


         balanceOf[_to] += _value;

         balanceOf[_from] -= _value;


         allowance[_from][msg.sender] -= _value;

         emit Transfer(_from, _to, _value);

         return true;
    }

    // function transferToUser(address _to, uint256 _value) public payable{
    //     require(_value != 0, 'value should nto be 0');
    //     transferFrom(msg.sender, _to, _value);

    //     transaction.transferFunds(msg.sender, _value);
    // }


}