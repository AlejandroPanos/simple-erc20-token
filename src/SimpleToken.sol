// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken is ERC20 {
    /* State variables */
    string private constant NAME = "SimpleToken";
    string private constant SYMBOL = "ST";

    /* Constructor */
    constructor(uint256 initialSupply) ERC20(NAME, SYMBOL) {
        _mint(msg.sender, initialSupply);
    }
}
