// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import './Balances.sol';
import './Products.sol';

contract TransactProducts{
    address public owner;
    Balances public balances;
    Products public products;

    constructor(Balances _balance, Products _products ) public {
        balances = _balance;
        products = _products;
    }

    // address[] public sellersList;


    // mapping(address => address[]) public manSellerList;
    // mapping(address => uint) public paid;
    // mapping(address => bool) public hasPaid;
    //mapping(address => sellersList) public ManufacturersSellerList;
    //manSellerlist[manufacturer][seller]

    // function setSeller(address manufacturer, address seller, uint amount) public {
    //     manSellerList[manufacturer].push(seller);
    //     paid[seller] = amount;
    //     hasPaid[seller] = true;
    // }

//need to add check if seller has acutally paid
//Add function for sending products to all buyers
    function transferProducts(address seller, uint _amount) public payable{
        require(_amount > 0, "amount cannot be 0");
        
        products.transferFrom(msg.sender, address(this), _amount*0);


        
        products.approve(seller, _amount);
        products.transferFrom(msg.sender, seller, _amount);


        // if(!hasPaid[msg.sender]) {
        //     sellersList.push(msg.sender);
        //     hasPaid[msg.sender] = true;
        // }

    }


}