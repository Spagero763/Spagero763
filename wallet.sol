// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SimpleWallet
 * @dev A basic wallet contract that allows deposits, withdrawals, and transfers
 */
contract SimpleWallet {
    // Mapping of address to their balance
    mapping(address => uint256) private balances;
    
    // Events to emit when transactions occur
    event Deposit(address indexed sender, uint256 amount, uint256 newBalance);
    event Withdraw(address indexed recipient, uint256 amount, uint256 newBalance);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    
    /**
     * @dev Deposit funds into the wallet
     */
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        
        balances[msg.sender] += msg.value;
        
        emit Deposit(msg.sender, msg.value, balances[msg.sender]);
    }
    
    /**
     * @dev Withdraw funds from the wallet
     * @param amount The amount to withdraw
     */
    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Withdrawal failed");
        
        emit Withdraw(msg.sender, amount, balances[msg.sender]);
    }
    
    /**
     * @dev Transfer funds to another address
     * @param recipient The address to send funds to
     * @param amount The amount to transfer
     */
    function transfer(address payable recipient, uint256 amount) public {
        require(recipient != address(0), "Invalid recipient address");
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        
        emit Transfer(msg.sender, recipient, amount);
    }
    
    /**
     * @dev Get the balance of an address
     * @param account The address to check
     * @return The balance of the address
     */
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
    
    /**
     * @dev Get the balance of the caller
     * @return The balance of the caller
     */
    function myBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}