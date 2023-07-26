// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzleBase} from "./DeployPuzzleBase.s.sol";
import {BabyItsMe} from "@/contracts/puzzles/puzzle-11/BabyItsMe.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle11 is Script {

    BabyItsMe public babyItsMe;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        babyItsMe = new BabyItsMe();
        ICurta(CURTA_ADDR).addPuzzle(babyItsMe, 1);


        console.log("Puzzle Address: ", address(babyItsMe));

        vm.stopBroadcast();
    }
}