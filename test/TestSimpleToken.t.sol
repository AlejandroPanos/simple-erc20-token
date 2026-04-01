// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleToken} from "src/SimpleToken.sol";
import {DeploySimpleToken} from "script/DeploySimpleToken.s.sol";

contract TestSimpleToken is Test {
    /* Instantiate new contracts */
    SimpleToken private simpleToken;
    DeploySimpleToken private deployer;

    /* State variables */
    address john = makeAddr("john");
    address alice = makeAddr("alice");
    uint256 private constant VALUE = 5000;

    /* Set up function */
    function setUp() public {
        deployer = new DeploySimpleToken();
        simpleToken = deployer.run();
        vm.prank(msg.sender);
        simpleToken.transfer(john, VALUE);
    }

    /* Testing functions */
    function testInitialBalanceMatchesJohnsBalance() public view {
        assertEq(simpleToken.balanceOf(john), VALUE);
    }

    function testAlicesBalanceStartsAsZero() public view {
        assertEq(simpleToken.balanceOf(alice), 0);
    }
}
