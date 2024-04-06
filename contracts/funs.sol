// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract funs{

    mapping(address => uint256) balances; 

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    address owner;
    
    modifier onlyowner(){
        require(owner == msg.sender, "you not the owner");
        _;
    }

     function deposit(address _account, uint _number) public payable {
        balances[_account] += _number;
        emit Deposit(_account, _number);
    }


    function withdraw(uint amount, address _account, uint _number) public {
    require(amount <= balances[msg.sender], "Insufficient balance");
    emit Withdraw(_account, _number);
    // Withdrawal logic here

    }

    function add(uint a, uint b) public pure returns (uint) {
    uint result = a + b;
    assert(result >= a); // Overflow check
    return result;

    }



    function transfer(address _from, address _to, uint _number) public  onlyowner{
    if (_number > balances[msg.sender]) {
        revert("Insufficient balance");
    }
    emit Transfer(_from, _to, _number);
    // Transfer logic here
    }



}