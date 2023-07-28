// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import {WhatAreBuckets} from "@/contracts/puzzles/puzzle-04/WhatAreBuckets.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle4 is DeployPuzzleBase {

    WhatAreBuckets public whatAreBuckets;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        whatAreBuckets = new WhatAreBuckets();
        ICurta(CURTA_ADDR).addPuzzle(whatAreBuckets, 1);


        console.log("Puzzle Address: ", address(whatAreBuckets));

        vm.stopBroadcast();
    }
}
