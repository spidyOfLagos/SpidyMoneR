# Sample Hardhat Project


Hello World
This Solidity program is a simple "Hello World" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

Description
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has a single function that returns the string "Hello World!". This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

Getting Started
Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

pragma solidity ^0.8.4;

contract funs {
    
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
        emit Transfer(_from, _to, _number);
    }
    // Transfer logic here
}


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.

Authors
Metacrafter Chris
@metacraftersio

License
This project is licensed under the MIT License - see the LICENSE.md file for details

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```
