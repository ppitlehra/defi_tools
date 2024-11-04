// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestUSDC is ERC20 {
    address public owner;

    constructor() ERC20("Test USD Coin", "USDC") {
        owner = msg.sender;
    }

    // Mint function to create new tokens, only accessible by the owner
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only owner can mint");
        _mint(to, amount);
    }

    // Optional: Set decimals to 6 to mimic USDC's 6-decimal standard
    function decimals() public view virtual override returns (uint8) {
        return 6;
    }
}
