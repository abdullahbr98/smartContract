// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Products{
    uint products;

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


    mapping(address => uint256) public noOfProducts;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public {
        noOfProducts[msg.sender] = 0;
    }

    function setProducts(address _of, uint _noOfProducts) public {
        noOfProducts[_of] = _noOfProducts;
    }

    function transfer(address _to, uint256  _value) public returns (bool success) {
        require(noOfProducts[msg.sender] >= _value);
        noOfProducts[msg.sender] -= _value;
        noOfProducts[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= noOfProducts[_from]);
        require(_value <= allowance[_from][msg.sender]);


         noOfProducts[_to] += _value;

         noOfProducts[_from] -= _value;


         allowance[_from][msg.sender] -= _value;

         emit Transfer(_from, _to, _value);

         return true;
    }



}