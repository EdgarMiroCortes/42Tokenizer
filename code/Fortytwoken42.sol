// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title fortytwoken42
 * @notice BEP-20 compatible token (same interface as ERC-20) for BNB Smart Chain.
 * @dev All supply is minted once to the deployer. No further minting.
 */
contract Fortytwoken42 is ERC20 {
    constructor() ERC20("fortytwoken42", "TWOKEN") {
        // 1_000_000 tokens with 18 decimals (BEP-20 / ERC-20 convention)
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }
}
