// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Balances.sol';
import './Products.sol';

contract Transaction{
    address public owner;
    Balances public balances;
    Products public products;

    constructor(Balances _balance, Products _products ) public {
        balances = _balance;
        products = _products;
    }

    address[] public sellersList;


    mapping(address => uint) public buyingBalance;
    mapping(address => bool) public hasPaid;
    //mapping(address => sellersList) public ManufacturersSellerList;




    function transferBalance(address manufacturer, uint _amount) public payable {
        require(_amount > 0, "amount cannot be 0");
        
        balances.transferFrom(msg.sender, address(this), _amount*0);

        buyingBalance[msg.sender] =  buyingBalance[msg.sender] + _amount;

        balances.approve(manufacturer, _amount);
        balances.transferFrom(msg.sender, manufacturer, _amount);


        if(!hasPaid[msg.sender]) {
            sellersList.push(msg.sender);
            hasPaid[msg.sender] = true;
        }

    }

    // function issueProducts() public payable {
    //     for(uint i=0; i<sellersList.length; i++){
    //         address seller = sellersList[i];
    //         uint product = buyingBalance[seller]/10;
    //         if(product > 0){
    //             products.approve(seller, product);
    //             products.transferFrom(msg.sender, seller, product);
    //         }
    //         hasPaid[seller] = false;
    //     }
    // }



}