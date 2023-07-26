// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzleBase} from "./DeployPuzzleBase.s.sol";
import {MiniMutant} from "@/contracts/puzzles/puzzle-07/MiniMutant.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle7 is Script {

    MinitMutant public miniMutant;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        miniMutant = new MiniMutant();
        ICurta(CURTA_ADDR).addPuzzle(miniMutant, 1);


        console.log("Puzzle Address: ", address(miniMutant));

        vm.stopBroadcast();
    }
}