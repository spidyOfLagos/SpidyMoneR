// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract funs {
    mapping(address => uint256) private balances; 
    address private owner;

    event Deposit(address indexed account, uint amount);
    event Withdraw(address indexed account, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint _number) public payable {
        balances[msg.sender] += _number;
        emit Deposit(msg.sender, _number);
    }

    function withdraw(uint _amount) public {
        if (balances[msg.sender] >= _amount) revert("Insufficient balance");
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        

        balances[msg.sender] -= _amount;
        emit Withdraw(msg.sender, _amount);
        // Withdrawal logic here
    }

    function add(uint a, uint b) public pure returns (uint) {
        uint result = a + b;
        require(result >= a, "SafeMath: addition overflow");
        return result;
    }

    function transfer(address _to, uint _number) public onlyOwner {
        if (_number < 0) revert("Transfer amount must be greater than 0");
        require(_to != address(0), "Invalid recipient address");
        if (balances[msg.sender] < _number) revert("Insufficient balance");
        balances[msg.sender] -= _number;
        balances[_to] += _number;
        emit Transfer(msg.sender, _to, _number);
        // Transfer logic here
    }

    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }
}