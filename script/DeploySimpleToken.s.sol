// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleToken} from "src/SimpleToken.sol";

contract DeploySimpleToken is Script {
    /* State variables */
    uint256 private constant INITIAL_SUPPLY = 500 ether;

    /* Deploy function */
    function run() public returns (SimpleToken) {
        vm.startBroadcast();
        SimpleToken token = new SimpleToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }
}
