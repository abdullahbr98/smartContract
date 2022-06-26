// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Authenticate{
    mapping (address => address[]) public sellerList;


    function addSeller(address seller) public {
        sellerList[msg.sender].push(seller);
    }

}