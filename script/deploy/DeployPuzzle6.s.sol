// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import {EventHorizon} from "@/contracts/puzzles/puzzle-06/EventHorizon.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle6 is DeployPuzzleBase {

    EventHorizon public eventHorizon;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        eventHorizon = new EventHorizon();
        ICurta(CURTA_ADDR).addPuzzle(eventHorizon, 1);


        console.log("Puzzle Address: ", address(eventHorizon));

        vm.stopBroadcast();
    }
}
