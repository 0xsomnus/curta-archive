// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import {PingPong} from "@/contracts/puzzles/puzzle-13/PingPong.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle13 is DeployPuzzleBase {

    PingPong public pingPong;

    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle with bytecode arg and print address to the console.
        pingPong = new PingPong(hex"60003560f01c60ac1460005260206000f3");
        ICurta(CURTA_ADDR).addPuzzle(pingPong, 1);


        console.log("Puzzle Address: ", address(pingPong));

        vm.stopBroadcast();
    }
}
