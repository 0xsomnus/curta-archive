// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzleBase} from "./DeployPuzzleBase.s.sol";
import {Chal} from "@/contracts/puzzles/puzzle-08/Chal.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle8 is Script {

    Chal public chal;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        chal = new Chal();
        ICurta(CURTA_ADDR).addPuzzle(chal, 1);


        console.log("Puzzle Address: ", address(chal));

        vm.stopBroadcast();
    }
}