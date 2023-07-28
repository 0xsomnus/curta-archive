// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import {TinySig} from "@/contracts/puzzles/puzzle-03/TinySig.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle3 is DeployPuzzleBase {

    TinySig public tinySig;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        tinySig = new TinySig();
        ICurta(CURTA_ADDR).addPuzzle(tinySig, 1);


        console.log("Puzzle Address: ", address(tinySig));

        vm.stopBroadcast();
    }
}
